Class {
	#name : #GtRemotePhlowViewErrorView,
	#superclass : #GtRemotePhlowView,
	#instVars : [
		'errorMessage'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #converting }
GtRemotePhlowViewErrorView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView."

	^GtPhlowViewErrorViewSpecification new 
		title: self title;
		priority: self priority;
		errorMessage: self errorMessage;
		dataTransport: GtPhlowViewSpecification dataIncluded.
]

{ #category : #accessing }
GtRemotePhlowViewErrorView >> errorMessage [
	^ errorMessage
]

{ #category : #accessing }
GtRemotePhlowViewErrorView >> errorMessage: aStringMessage [
	errorMessage := aStringMessage
]
