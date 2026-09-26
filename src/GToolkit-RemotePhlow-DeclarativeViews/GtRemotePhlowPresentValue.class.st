Class {
	#name : #GtRemotePhlowPresentValue,
	#superclass : #GtRemotePhlowOptionalValue,
	#instVars : [
		'targetValue'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #controlling }
GtRemotePhlowPresentValue >> ifPresent: presentBlock [
	presentBlock value: self targetValue
]

{ #category : #accessing }
GtRemotePhlowPresentValue >> ifPresent: presentBlock ifAbsent: absentBlock [
	^ presentBlock value: self targetValue
]

{ #category : #testing }
GtRemotePhlowPresentValue >> isPresent [
	^ true
]

{ #category : #printing }
GtRemotePhlowPresentValue >> printOn: aStream [
	aStream
		nextPutAll: 'Present(';
		print: self targetValue;
		nextPut: $)
]

{ #category : #accessing }
GtRemotePhlowPresentValue >> targetValue [
	^ targetValue
]

{ #category : #accessing }
GtRemotePhlowPresentValue >> targetValue: anObject [
	targetValue := anObject
]
