Class {
	#name : #GtRemotePhlowSpawnObjectWrapper,
	#superclass : #Object,
	#instVars : [
		'targetObject'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeActions'
}

{ #category : #accessing }
GtRemotePhlowSpawnObjectWrapper >> targetObject [
	^ targetObject
]

{ #category : #accessing }
GtRemotePhlowSpawnObjectWrapper >> targetObject: anObject [
	targetObject := anObject
]
