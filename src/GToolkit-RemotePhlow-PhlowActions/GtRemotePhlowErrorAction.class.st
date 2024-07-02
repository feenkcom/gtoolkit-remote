Class {
	#name : #GtRemotePhlowErrorAction,
	#superclass : #GtRemotePhlowAction,
	#instVars : [
		'errorMessage'
	],
	#category : #'GToolkit-RemotePhlow-PhlowActions'
}

{ #category : #converting }
GtRemotePhlowErrorAction >> asGtDeclarativeAction [
	^ GtPhlowErrorActionSpecification new
		priority: self priority;
		errorMessage: self errorMessage;
		tooltipText: self tooltipText
]

{ #category : #accessing }
GtRemotePhlowErrorAction >> errorMessage [
	^ errorMessage
]

{ #category : #accessing }
GtRemotePhlowErrorAction >> errorMessage: aStringMessage [
	errorMessage := aStringMessage
]
