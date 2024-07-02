Class {
	#name : #GtRemotePhlowApiWrapper,
	#superclass : #Object,
	#instVars : [
		'currentAction'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeActions'
}

{ #category : #accessing }
GtRemotePhlowApiWrapper >> currentAction [
	^ currentAction
]

{ #category : #accessing }
GtRemotePhlowApiWrapper >> phlow [ 
	^ self
]

{ #category : #accessing }
GtRemotePhlowApiWrapper >> spawnObject: anObject [
	currentAction := GtRemotePhlowSpawnObjectAction forObject: anObject
]
