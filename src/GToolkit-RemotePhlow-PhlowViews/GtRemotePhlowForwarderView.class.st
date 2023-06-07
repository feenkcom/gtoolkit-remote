Class {
	#name : #GtRemotePhlowForwarderView,
	#superclass : #GtRemotePhlowView,
	#instVars : [
		'viewSelector',
		'objectComputation',
		'transformation'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #converting }
GtRemotePhlowForwarderView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView."

	^ GtPhlowForwardViewSpecification new 
		title: self title;
		priority: self priority;
		phlowDataSource: (GtRemotePhlowDeclarativeForwardViewDataSource 
			forPhlowView: self);
		dataTransport: GtPhlowViewSpecification dataLazy
]

{ #category : #converting }
GtRemotePhlowForwarderView >> computeForwardedView [
	| targetObject computedView |
	
	[ targetObject := objectComputation value ] 
		on: Error do: [ :anError |
			^ self 
				phlowErrorViewWithException: anError  ].
				
	computedView := self on: targetObject perform: viewSelector.
	
	computedView class = self class ifTrue: [
		"If we the forward is to another forwarder view we follow the chain
		to reach the first view that is now a forward view."
		^ computedView computeForwardedView ].
		
	^ computedView
]

{ #category : #accessing }
GtRemotePhlowForwarderView >> defaultTransformation [
	^ GtRemotePhlowSendObjectTransformation forValuable: [ :anObject | anObject ]
]

{ #category : #testing }
GtRemotePhlowForwarderView >> hasTransformation [
	<return: #Boolean>
	^ transformation notNil
]

{ #category : #'api - scripting' }
GtRemotePhlowForwarderView >> object: anObjectComputation [
	objectComputation := anObjectComputation.
]

{ #category : #'api - scripting' }
GtRemotePhlowForwarderView >> send: aBlock [
	"Define what object should be displayed on selection and fire select or spawn item requests"
	self transformation: (GtRemotePhlowSendObjectTransformation forValuable: aBlock)
]

{ #category : #accessing }
GtRemotePhlowForwarderView >> transformation [ 	
	^ transformation ifNil: [ 
		transformation := self defaultTransformation ]
]

{ #category : #accessing }
GtRemotePhlowForwarderView >> transformation: aGtPhlowSendTransformation [
	transformation := aGtPhlowSendTransformation.
]

{ #category : #'api - scripting' }
GtRemotePhlowForwarderView >> view: aSelector [
	viewSelector := aSelector
]
