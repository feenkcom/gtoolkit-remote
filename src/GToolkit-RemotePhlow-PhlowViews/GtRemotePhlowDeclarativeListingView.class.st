Class {
	#name : #GtRemotePhlowDeclarativeListingView,
	#superclass : #GtRemotePhlowDeclarativeView,
	#instVars : [
		'itemsBuilder',
		'transformation'
	],
	#category : 'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #accessing }
GtRemotePhlowDeclarativeListingView >> defaultTransformation [
	^ GtRemotePhlowSendObjectTransformation forValuable: [ :anObject | anObject ]
]

{ #category : #accessing }
GtRemotePhlowDeclarativeListingView >> items: aBlockClosure [

	itemsBuilder := aBlockClosure
]

{ #category : #accessing }
GtRemotePhlowDeclarativeListingView >> itemsBuilder [
	^ itemsBuilder ifNil: [ 
		itemsBuilder := [ { } ] ]
]

{ #category : #'api - scripting' }
GtRemotePhlowDeclarativeListingView >> send: aBlock [
	"Define what object should be displayed on selection and fire select or spawn item requests"
	self
		assert: [ aBlock isNotNil ]
		description: [ 'Send transformation block must be non-nil'  ].
	aBlock isSymbol ifTrue: [ 
		self 
			assert: [ aBlock isUnary ]
			description: [ 'Send transformation symbol must be unary' ].
		self transformation: (GtRemotePhlowSendObjectTransformation 
			forValuable: [ :obj | aBlock value: obj ]).
		^ self ].
	self
		assert: [ aBlock numArgs <= 2 ]
		description: [ 'Send transformation block must have two or less arguments'  ].
	self transformation: (GtRemotePhlowSendObjectTransformation forValuable: aBlock)
]

{ #category : #accessing }
GtRemotePhlowDeclarativeListingView >> transformation [ 	
	^ transformation ifNil: [ 
		transformation := self defaultTransformation ]
]

{ #category : #accessing }
GtRemotePhlowDeclarativeListingView >> transformation: aGtPhlowSendTransformation [
	transformation := aGtPhlowSendTransformation.
]
