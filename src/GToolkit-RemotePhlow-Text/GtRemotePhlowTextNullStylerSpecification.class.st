Class {
	#name : #GtRemotePhlowTextNullStylerSpecification,
	#superclass : #GtRemotePhlowTextStylerSpecification,
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #accessing }
GtRemotePhlowTextNullStylerSpecification class >> typeLabel [
	^ 'remotePhlowTextNullStylerSpecification'
]

{ #category : #testing }
GtRemotePhlowTextNullStylerSpecification >> canAffectText [
	^ false
]
