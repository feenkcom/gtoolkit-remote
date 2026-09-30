"
Remote phlow version of GtObjectComparerSlotValue.
"
Class {
	#name : #GtRemotePhlowObjectComparerSlotValue,
	#superclass : #GtRemotePhlowObjectComparerValue,
	#instVars : [
		'slotName',
		'value'
	],
	#category : #'GToolkit-RemotePhlow-ObjectComparer'
}

{ #category : #testing }
GtRemotePhlowObjectComparerSlotValue >> hasValue [
	^ true
]

{ #category : #accessing }
GtRemotePhlowObjectComparerSlotValue >> slotName [
	^ slotName
]

{ #category : #accessing }
GtRemotePhlowObjectComparerSlotValue >> slotName: aString [
	slotName := aString
]

{ #category : #printing }
GtRemotePhlowObjectComparerSlotValue >> textForValue [
	^ self valueDisplayString, ' ', self value class name
]

{ #category : #accessing }
GtRemotePhlowObjectComparerSlotValue >> value [
	^ value
]

{ #category : #accessing }
GtRemotePhlowObjectComparerSlotValue >> value: anObject [
	value := anObject
]

{ #category : #printing }
GtRemotePhlowObjectComparerSlotValue >> valueDisplayOn: aStream [
	self value gtDisplayOn: aStream
]
