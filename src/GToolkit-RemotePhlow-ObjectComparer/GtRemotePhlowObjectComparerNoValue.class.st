"
Remote phlow version of GtObjectComparerNoValue.
"
Class {
	#name : #GtRemotePhlowObjectComparerNoValue,
	#superclass : #GtRemotePhlowObjectComparerValue,
	#category : #'GToolkit-RemotePhlow-ObjectComparer'
}

{ #category : #testing }
GtRemotePhlowObjectComparerNoValue >> hasValue [
	^ false
]

{ #category : #accessing }
GtRemotePhlowObjectComparerNoValue >> value [
	^ nil
]

{ #category : #printing }
GtRemotePhlowObjectComparerNoValue >> valueDisplayOn: aStream [
	aStream nextPutAll: '—'
]
