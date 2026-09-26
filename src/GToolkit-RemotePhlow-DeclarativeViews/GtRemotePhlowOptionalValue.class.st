Class {
	#name : #GtRemotePhlowOptionalValue,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #accessing }
GtRemotePhlowOptionalValue >> ifPresent: presentBlock ifAbsent: absentBlock [
	^ self subclassResponsibility
]

{ #category : #testing }
GtRemotePhlowOptionalValue >> isPresent [
	^ self subclassResponsibility
]
