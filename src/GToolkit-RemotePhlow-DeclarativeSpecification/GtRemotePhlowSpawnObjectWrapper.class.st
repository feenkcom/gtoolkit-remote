Class {
	#name : #GtRemotePhlowSpawnObjectWrapper,
	#superclass : #Object,
	#instVars : [
		'targetObject'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeSpecification'
}

{ #category : #serialization }
GtRemotePhlowSpawnObjectWrapper class >> replicationSpec [
	^#(#(#targetObject #forwarder))
]

{ #category : #accessing }
GtRemotePhlowSpawnObjectWrapper >> targetObject [
	^ targetObject
]

{ #category : #accessing }
GtRemotePhlowSpawnObjectWrapper >> targetObject: anObject [
	targetObject := anObject
]
