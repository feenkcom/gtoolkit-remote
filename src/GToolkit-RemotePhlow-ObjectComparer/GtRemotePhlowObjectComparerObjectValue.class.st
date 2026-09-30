"
Remote phlow version of GtObjectComparerObjectValue.
"
Class {
	#name : #GtRemotePhlowObjectComparerObjectValue,
	#superclass : #GtRemotePhlowObjectComparerValue,
	#category : #'GToolkit-RemotePhlow-ObjectComparer'
}

{ #category : #testing }
GtRemotePhlowObjectComparerObjectValue >> hasValue [
	^ true
]

{ #category : #printing }
GtRemotePhlowObjectComparerObjectValue >> textForValue [
	^ self valueDisplayString, ' ', self value class name
]

{ #category : #accessing }
GtRemotePhlowObjectComparerObjectValue >> value [
	^ object
]

{ #category : #printing }
GtRemotePhlowObjectComparerObjectValue >> valueDisplayOn: aStream [
	self value gtDisplayOn: aStream
]
