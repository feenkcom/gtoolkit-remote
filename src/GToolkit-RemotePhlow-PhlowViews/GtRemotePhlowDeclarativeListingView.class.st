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
