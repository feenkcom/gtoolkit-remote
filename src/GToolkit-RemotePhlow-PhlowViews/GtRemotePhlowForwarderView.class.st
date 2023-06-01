Class {
	#name : #GtRemotePhlowForwarderView,
	#superclass : #GtRemotePhlowView,
	#instVars : [
		'viewSelector',
		'objectComputation'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #converting }
GtRemotePhlowForwarderView >> asGtDeclarativeView [
	^  [ (objectComputation value 
		perform: viewSelector withArguments: { 
			 self }) asGtDeclarativeView
			 	title: self title;
			 	priority: self priority ] 
	on: Error do: [ :anError |
		(self 
				phlowErrorViewWithException: anError 
				inComputation: nil
				forBuildContext: nil "(GtPhlowBuildContext new 
					object: anObject; 
					arguments: aCollectionOfArguments) "
				andSelector: self definingSelector) asGtDeclarativeView ]
]

{ #category : #'api - scripting' }
GtRemotePhlowForwarderView >> object: anObjectComputation [
	objectComputation := anObjectComputation.
]

{ #category : #'api - scripting' }
GtRemotePhlowForwarderView >> view: aSelector [
	viewSelector := aSelector
]
