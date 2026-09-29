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
		target: self target;
		tooltipText: self tooltipText;
		id: (self id ifNotNil: [ :anId | anId asBlocElementId ])
]

{ #category : #accessing }
GtRemotePhlowErrorAction >> errorMessage [
	^ errorMessage
]

{ #category : #accessing }
GtRemotePhlowErrorAction >> errorMessage: aStringMessage [
	errorMessage := aStringMessage
]
