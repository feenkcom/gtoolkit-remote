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
	^ (objectComputation value 
		perform: viewSelector withArguments: { 
			 GtRemotePhlowProtoView new }) asGtDeclarativeView
			 	title: self title;
			 	priority: self priority
]

{ #category : #'api - scripting' }
GtRemotePhlowForwarderView >> object: anObjectComputation [
	objectComputation := anObjectComputation.
]

{ #category : #'api - scripting' }
GtRemotePhlowForwarderView >> view: aSelector [
	viewSelector := aSelector
]
