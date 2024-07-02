Class {
	#name : #GtRemotePhlowSpawnObjectAction,
	#superclass : #GtRemotePhlowNavigationAction,
	#instVars : [
		'targetObject'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeActions'
}

{ #category : #'instance creation' }
GtRemotePhlowSpawnObjectAction class >> forObject: anObject [ 
	^ self new 
		targetObject: anObject 
]

{ #category : #converting }
GtRemotePhlowSpawnObjectAction >> asDictionaryForExport [
	"Answer the receiver as a dictionary ready for JSON serialisation.
	Subclasses will override and add to the dictionary"

	^ super asDictionaryForExport
		at: 'targetObject' put: targetObject;
		yourself
]

{ #category : #initialization }
GtRemotePhlowSpawnObjectAction >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.

	self
		targetObject: (aDictionary at: 'targetObject')
]

{ #category : #accessing }
GtRemotePhlowSpawnObjectAction >> targetObject: anObject [ 
	targetObject := anObject 
]
