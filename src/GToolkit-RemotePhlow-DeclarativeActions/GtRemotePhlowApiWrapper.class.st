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
GtRemotePhlowApiWrapper >> fireCurrentToolUpdateWish [
	currentAction := GtRemotePhlowNavigationUpdateCurrentToolAction new
]

{ #category : #accessing }
GtRemotePhlowApiWrapper >> fireToolUpdateWish [
	currentAction := GtRemotePhlowNavigationUpdateMainToolAction new
]

{ #category : #accessing }
GtRemotePhlowApiWrapper >> fireViewUpdateWish [
	currentAction := GtRemotePhlowNavigationUpdateViewAction new
]

{ #category : #accessing }
GtRemotePhlowApiWrapper >> phlow [ 
	^ self
]

{ #category : #accessing }
GtRemotePhlowApiWrapper >> spawnObject: anObject [
	currentAction := GtRemotePhlowSpawnObjectAction forObject: anObject
]
