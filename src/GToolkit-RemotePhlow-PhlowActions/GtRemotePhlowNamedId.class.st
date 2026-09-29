"
Named remote phlow action id, analogous to BlElementNamedId. Stores a symbol identifier.
"
Class {
	#name : #GtRemotePhlowNamedId,
	#superclass : #GtRemotePhlowId,
	#instVars : [
		'identifier'
	],
	#category : #'GToolkit-RemotePhlow-PhlowActions'
}

{ #category : #'instance creation' }
GtRemotePhlowNamedId class >> named: aSymbol [
	^ self new identifier: aSymbol asSymbol
]

{ #category : #accessing }
GtRemotePhlowNamedId class >> typeLabel [
	^ 'remotePhlowNamedActionId'
]

{ #category : #comparing }
GtRemotePhlowNamedId >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ self asSymbol = anObject asSymbol
]

{ #category : #serialization }
GtRemotePhlowNamedId >> asDictionaryForExport [
	^ super asDictionaryForExport
		at: 'identifier' put: identifier;
		yourself
]

{ #category : #converting }
GtRemotePhlowNamedId >> asSymbol [
	^ identifier
]

{ #category : #accessing }
GtRemotePhlowNamedId >> identifier [
	^ identifier
]

{ #category : #accessing }
GtRemotePhlowNamedId >> identifier: aSymbol [
	identifier := aSymbol
]

{ #category : #serialization }
GtRemotePhlowNamedId >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	identifier := (aDictionary at: 'identifier') asSymbol
]
