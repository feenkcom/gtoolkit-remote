"
Remote phlow version of GtObjectComparerValue. Represents a value participating in an object comparison.
"
Class {
	#name : #GtRemotePhlowObjectComparerValue,
	#superclass : #Object,
	#instVars : [
		'object'
	],
	#category : #'GToolkit-RemotePhlow-ObjectComparer'
}

{ #category : #testing }
GtRemotePhlowObjectComparerValue >> hasValue [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtRemotePhlowObjectComparerValue >> object [
	^ object
]

{ #category : #accessing }
GtRemotePhlowObjectComparerValue >> object: anObject [
	object := anObject
]

{ #category : #printing }
GtRemotePhlowObjectComparerValue >> textForValue [
	^ self valueDisplayString
]

{ #category : #printing }
GtRemotePhlowObjectComparerValue >> valueDisplayOn: aStream [
	^ self subclassResponsibility
]

{ #category : #printing }
GtRemotePhlowObjectComparerValue >> valueDisplayString [
	^ String streamContents: [ :s | self valueDisplayOn: s ]
]
