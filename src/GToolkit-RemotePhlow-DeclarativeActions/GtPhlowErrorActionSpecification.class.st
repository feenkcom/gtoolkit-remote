Class {
	#name : #GtPhlowErrorActionSpecification,
	#superclass : #GtPhlowActionSpecification,
	#instVars : [
		'errorMessage'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeActions'
}

{ #category : #accessing }
GtPhlowErrorActionSpecification class >> typeLabel [
	^ 'phlowErrorActionSpecification'
]

{ #category : #accessing }
GtPhlowErrorActionSpecification >> errorMessage [
	^ errorMessage
]

{ #category : #accessing }
GtPhlowErrorActionSpecification >> errorMessage: aStringMessage [
	errorMessage := aStringMessage
]
