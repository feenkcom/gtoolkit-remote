Class {
	#name : #GtRemotePhlowDeclarativeForwarderView,
	#superclass : #GtRemotePhlowDeclarativeView,
	#instVars : [
		'viewSelector',
		'objectComputation'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #converting }
GtRemotePhlowDeclarativeForwarderView >> asGtDeclarativeView [
	^ (objectComputation value 
		perform: viewSelector withArguments: { 
			 GtRemotePhlowDeclarativeProtoView new }) asGtDeclarativeView
			 	title: self title;
			 	priority: self priority
]

{ #category : #'api - scripting' }
GtRemotePhlowDeclarativeForwarderView >> object: anObjectComputation [
	objectComputation := anObjectComputation.
]

{ #category : #'api - scripting' }
GtRemotePhlowDeclarativeForwarderView >> view: aSelector [
	viewSelector := aSelector
]
