Class {
	#name : #GtRemotePhlowAbsentValue,
	#superclass : #GtRemotePhlowOptionalValue,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #controlling }
GtRemotePhlowAbsentValue >> ifPresent: presentBlock [
	"Do nothing"
]

{ #category : #accessing }
GtRemotePhlowAbsentValue >> ifPresent: presentBlock ifAbsent: absentBlock [
	^ absentBlock value
]

{ #category : #testing }
GtRemotePhlowAbsentValue >> isPresent [
	^ false
]

{ #category : #printing }
GtRemotePhlowAbsentValue >> printOn: aStream [
	aStream nextPutAll: 'Absent'
]
