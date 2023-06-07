Class {
	#name : #GtRemotePhlowListingView,
	#superclass : #GtRemotePhlowView,
	#instVars : [
		'itemsProviderComputation',
		'transformation'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #copying }
GtRemotePhlowListingView >> copyTransformationFrom: aTransformation [
	aTransformation ifNil: [ ^ self ].
	self send: aTransformation valuable
]

{ #category : #accessing }
GtRemotePhlowListingView >> defaultTransformation [
	^ GtRemotePhlowSendObjectTransformation forValuable: [ :anObject | anObject ]
]

{ #category : #'api - scripting' }
GtRemotePhlowListingView >> items: aBlockClosure [
	itemsProviderComputation := aBlockClosure
]

{ #category : #accessing }
GtRemotePhlowListingView >> itemsProviderComputation [
	^ itemsProviderComputation ifNil: [ 
		itemsProviderComputation := #() asGPhlowItemsIterator ]
]

{ #category : #'api - scripting' }
GtRemotePhlowListingView >> send: aBlock [
	"Define what object should be displayed on selection and fire select or spawn item requests"
	self transformation: (GtRemotePhlowSendObjectTransformation forValuable: aBlock)
]

{ #category : #accessing }
GtRemotePhlowListingView >> transformation [ 	
	^ transformation ifNil: [ 
		transformation := self defaultTransformation ]
]

{ #category : #accessing }
GtRemotePhlowListingView >> transformation: aGtPhlowSendTransformation [
	transformation := aGtPhlowSendTransformation.
]
