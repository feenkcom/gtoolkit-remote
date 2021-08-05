Class {
	#name : 'GtRemotePhlowCollectionIterator',
	#superclass : 'Object',
	#instVars : [
		'targetCollection'
	],
	#category : 'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : 'as yet unclassified' }
GtRemotePhlowCollectionIterator class >> forCollection: aCollection [
	^ self new
		targetCollection: aCollection
]

{ #category : 'iterating' }
GtRemotePhlowCollectionIterator >> forElementsFrom: startIndex to: endIndex withIndexDo: aBlock [
	self subclassResponsibility
]

{ #category : 'accessing' }
GtRemotePhlowCollectionIterator >> targetCollection: aCollection [
	targetCollection := aCollection
]

{ #category : 'accessing' }
GtRemotePhlowCollectionIterator >> totalItemsCount [
	^ targetCollection 
		ifNil: [ 0 ] 
		ifNotNil:  [ :aCollection | aCollection size ]
]
