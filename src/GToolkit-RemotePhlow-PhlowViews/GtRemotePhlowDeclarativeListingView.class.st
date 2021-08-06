Class {
	#name : 'GtRemotePhlowDeclarativeListingView',
	#superclass : 'GtRemotePhlowDeclarativeView',
	#instVars : [
		'itemsProviderBuilder',
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
	itemsProviderBuilder := aBlockClosure
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeListingView >> itemsProviderBuilder [
	^ itemsProviderBuilder ifNil: [ 
		itemsProviderBuilder := #() asGPhlowItemsIterator ]
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
