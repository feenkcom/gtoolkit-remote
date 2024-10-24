Class {
	#name : #GtRemotePhlowViewedObjectClassSpecification,
	#superclass : #GtPhlowDeclarativeSpecification,
	#instVars : [
		'viewObjectClassName',
		'viewObjectInstanceVariableNames'
	],
	#category : #'GToolkit-RemotePhlow-InspectorCore'
}

{ #category : #accessing }
GtRemotePhlowViewedObjectClassSpecification class >> forClass: aClass [
	^ self new 
		initializeFromClass: aClass
]

{ #category : #accessing }
GtRemotePhlowViewedObjectClassSpecification class >> typeLabel [
	^ 'phlowViewedObjectClassSpecification'
]

{ #category : #converting }
GtRemotePhlowViewedObjectClassSpecification >> asDictionaryForExport [
	| dictionaryForExport|
	dictionaryForExport := super asDictionaryForExport.
	
	dictionaryForExport at: 'viewObjectClassName' put: viewObjectClassName.
	dictionaryForExport 
		at: 'viewObjectInstanceVariableNames' 
		put: viewObjectInstanceVariableNames.
	
	^ dictionaryForExport
]

{ #category : #initialization }
GtRemotePhlowViewedObjectClassSpecification >> initializeFromClass: aClass [
	self viewObjectClassName: aClass name.
	self viewObjectInstanceVariableNames: aClass allInstVarNames
]

{ #category : #initialization }
GtRemotePhlowViewedObjectClassSpecification >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.

	self
		viewObjectClassName: (aDictionary 
			at: 'viewObjectClassName' 
			ifAbsent: [ nil ]);
		viewObjectInstanceVariableNames: (aDictionary 
			at: 'viewObjectInstanceVariableNames' 
			ifAbsent: [ nil ])
]

{ #category : #accessing }
GtRemotePhlowViewedObjectClassSpecification >> viewObjectClassName [
	^ viewObjectClassName
]

{ #category : #accessing }
GtRemotePhlowViewedObjectClassSpecification >> viewObjectClassName: anObject [
	viewObjectClassName := anObject
]

{ #category : #accessing }
GtRemotePhlowViewedObjectClassSpecification >> viewObjectInstanceVariableNames [
	^ viewObjectInstanceVariableNames
]

{ #category : #accessing }
GtRemotePhlowViewedObjectClassSpecification >> viewObjectInstanceVariableNames: anObject [
	viewObjectInstanceVariableNames := anObject
]
