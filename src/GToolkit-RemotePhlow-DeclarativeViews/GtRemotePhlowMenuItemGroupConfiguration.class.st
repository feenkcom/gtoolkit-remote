Class {
	#name : #GtRemotePhlowMenuItemGroupConfiguration,
	#superclass : #GtPhlowDeclarativeSpecification,
	#instVars : [
		'name',
		'priority'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtRemotePhlowMenuItemGroupConfiguration class >> default [
	^ self new
]

{ #category : #'instance creation' }
GtRemotePhlowMenuItemGroupConfiguration class >> editing [
	^ self new
		name: #Editing;
		priority: 48
]

{ #category : #'instance creation' }
GtRemotePhlowMenuItemGroupConfiguration class >> evaluation [
	^ self new
		name: #Evaluation;
		priority: 47
]

{ #category : #'instance creation' }
GtRemotePhlowMenuItemGroupConfiguration class >> inspection [
	^ self new
		name: #Inspection;
		priority: 40
]

{ #category : #'instance creation' }
GtRemotePhlowMenuItemGroupConfiguration class >> modification [
	^ self new
		name: #Modification;
		priority: 35
]

{ #category : #'instance creation' }
GtRemotePhlowMenuItemGroupConfiguration class >> navigation [
	^ self new
		name: #Navigation;
		priority: 20
]

{ #category : #'instance creation' }
GtRemotePhlowMenuItemGroupConfiguration class >> new [
	^ super new initialize
]

{ #category : #'instance creation' }
GtRemotePhlowMenuItemGroupConfiguration class >> printing [
	^ self new
		name: #Printing;
		priority: 60
]

{ #category : #'instance creation' }
GtRemotePhlowMenuItemGroupConfiguration class >> removal [
	^ self new
		name: #Removal;
		priority: 100
]

{ #category : #accessing }
GtRemotePhlowMenuItemGroupConfiguration class >> typeLabel [
	^ 'remotePhlowMenuItemGroupConfiguration'
]

{ #category : #serialization }
GtRemotePhlowMenuItemGroupConfiguration >> asDictionaryForExport [
	| dict |
	dict := super asDictionaryForExport.
	dict at: 'name' put: self name.
	dict at: 'priority' put: self priority.
	^ dict
]

{ #category : #converting }
GtRemotePhlowMenuItemGroupConfiguration >> asMenuItemGroupConfiguration [
	^ BrMenuItemGroupConfiguration new
		name: self name;
		priority: self priority
]

{ #category : #converting }
GtRemotePhlowMenuItemGroupConfiguration >> asRemotePhlowMenuItemGroupConfiguration [
	^ self
]

{ #category : #accessing }
GtRemotePhlowMenuItemGroupConfiguration >> id [
	^ self name
]

{ #category : #initialization }
GtRemotePhlowMenuItemGroupConfiguration >> initialize [
	super initialize.
	priority := 50.
	name := #Default
]

{ #category : #serialization }
GtRemotePhlowMenuItemGroupConfiguration >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	self name: (aDictionary at: 'name').
	self priority: (aDictionary at: 'priority').
]

{ #category : #accessing }
GtRemotePhlowMenuItemGroupConfiguration >> name [
	^ name
]

{ #category : #accessing }
GtRemotePhlowMenuItemGroupConfiguration >> name: aSymbol [
	name := aSymbol
]

{ #category : #printing }
GtRemotePhlowMenuItemGroupConfiguration >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self name asString;
		nextPut: $)
]

{ #category : #accessing }
GtRemotePhlowMenuItemGroupConfiguration >> priority [
	^ priority
]

{ #category : #accessing }
GtRemotePhlowMenuItemGroupConfiguration >> priority: aNumber [
	priority := aNumber
]
