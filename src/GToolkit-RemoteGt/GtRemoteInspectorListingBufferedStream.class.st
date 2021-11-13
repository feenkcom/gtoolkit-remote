Class {
	#name : #GtRemoteInspectorListingBufferedStream,
	#superclass : #Object,
	#traits : 'TAsyncStream',
	#classTraits : 'TAsyncStream classTrait',
	#instVars : [
		'declarativeView',
		'index',
		'done',
		'buffer',
		'bufferFuture'
	],
	#category : #'GToolkit-RemoteGt'
}

{ #category : #'instance creation' }
GtRemoteInspectorListingBufferedStream class >> declarativeView: aDeclarativeView [
	^ self new declarativeView: aDeclarativeView
]

{ #category : #accessing }
GtRemoteInspectorListingBufferedStream >> bufferSize [
	^ 100
]

{ #category : #initialization }
GtRemoteInspectorListingBufferedStream >> declarativeView: aDeclarativeView [
	declarativeView := aDeclarativeView
]

{ #category : #initialization }
GtRemoteInspectorListingBufferedStream >> initialize [
	super initialize.
	
	index := 1.
	done := false.
	buffer := nil.
	bufferFuture := nil
]

{ #category : #'api - stream' }
GtRemoteInspectorListingBufferedStream >> pollNext: anAsynchronousContext [
	"Attempt to pull out the next value of this stream, registering the current task for wakeup if the value is not yet available, and returning None if the stream is exhausted.
	There are several possible return values, each indicating a distinct stream state:
	 - Poll::Pending means that this stream's next value is not ready yet. Implementations will ensure that the current task will be notified when the next value may be ready.
	 - Poll::Ready(Some(val)) means that the stream has successfully produced a value, val, and may produce further values on subsequent poll_next calls.
	 - Poll::Ready(None) means that the stream has terminated, and poll_next should not be invoked again."
	<return: #AsyncPoll>

	done ifTrue: [
		^ AsyncPoll ready: AsyncOptionalValue none ].

	[ buffer
		ifNotNil: [ :aBuffer |
			| aNextItem |

			aBuffer
				ifEmpty: [
					done := true.
					buffer := nil.
					bufferFuture := nil.

					^ AsyncPoll ready: AsyncOptionalValue none ].

			aNextItem := aBuffer removeFirst.
			index := index + 1.
			aBuffer ifEmpty: [ 
				buffer := nil.
				bufferFuture := nil ].

			^ AsyncPoll ready: (AsyncOptionalValue some: aNextItem) ]
		ifNil: [
			bufferFuture
				ifNil: [
					bufferFuture := [ declarativeView retrieveItems: self bufferSize fromIndex: index ] asAsyncFuture ]
				ifNotNil: [
					(bufferFuture poll: anAsynchronousContext)
						ifReady: [ :aReadyPoll | buffer := LinkedList newFrom: aReadyPoll value ]
						ifPending: [ :aPendingPoll | ^ aPendingPoll ] ] ] ] repeat
]

{ #category : #'api - stream copy' }
GtRemoteInspectorListingBufferedStream >> postSimilarCopy [
	"Is called by similarCopy. self is a shallow copy, implementors should set the fields as necessary to complete the similar copy"
	
	index := 1.
	done := false.
	buffer := nil.
	bufferFuture := nil
]
