Class {
	#name : 'GtRemotePhlowDeclarativeListingView',
	#superclass : 'GtRemotePhlowDeclarativeView',
	#instVars : [
		'itemsProviderComputation',
		'transformation'
	],
	#category : 'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : 'accessing' }
GtRemotePhlowDeclarativeListingView >> defaultTransformation [
	^ GtRemotePhlowSendObjectTransformation forValuable: [ :anObject | anObject ]
]

{ #category : 'api - scripting' }
GtRemotePhlowDeclarativeListingView >> items: aBlockClosure [
	itemsProviderComputation := aBlockClosure
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeListingView >> itemsProviderComputation [
	^ itemsProviderComputation ifNil: [ 
		itemsProviderComputation := #() asGPhlowItemsIterator ]
]

{ #category : 'api - scripting' }
GtRemotePhlowDeclarativeListingView >> send: aBlock [
	"Define what object should be displayed on selection and fire select or spawn item requests"
	self transformation: (GtRemotePhlowSendObjectTransformation forValuable: aBlock)
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeListingView >> transformation [ 	
	^ transformation ifNil: [ 
		transformation := self defaultTransformation ]
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeListingView >> transformation: aGtPhlowSendTransformation [
	transformation := aGtPhlowSendTransformation.
]
