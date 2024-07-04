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
	"Answer the receiver as a dictionary ready for JSON serialisation"

	^ super asDictionaryForExport
		at: 'objectWrapper' put: (GtRemotePhlowSpawnObjectWrapper new
				targetObject: targetObject );
		yourself
]

{ #category : #initialization }
GtRemotePhlowSpawnObjectAction >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.

	aDictionary at: 'objectWrapper' ifPresent: [ :anObjectWrapper |
		self
			targetObject: (aDictionary at: 'objectWrapper') targetObject ].
]

{ #category : #accessing }
GtRemotePhlowSpawnObjectAction >> targetObject: anObject [ 
	targetObject := anObject 
]
