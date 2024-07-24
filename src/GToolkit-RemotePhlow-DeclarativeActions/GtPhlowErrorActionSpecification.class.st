Class {
	#name : #GtPhlowErrorActionSpecification,
	#superclass : #GtPhlowActionSpecification,
	#instVars : [
		'errorMessage'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeActions'
}

{ #category : #accessing }
GtPhlowErrorActionSpecification class >> typeLabel [
	^ 'phlowErrorActionSpecification'
]

{ #category : #converting }
GtPhlowErrorActionSpecification >> asDictionaryForExport [
	| dictionaryForExport|
	dictionaryForExport := super asDictionaryForExport.
	
	errorMessage ifNotNil: [ :aText |
		dictionaryForExport at: 'errorMessage' put: aText ].
	tooltipText ifNotNil: [ :aText |
		dictionaryForExport at: 'tooltipText' put: aText ].

	^ dictionaryForExport
]

{ #category : #accessing }
GtPhlowErrorActionSpecification >> errorMessage [
	^ errorMessage
]

{ #category : #accessing }
GtPhlowErrorActionSpecification >> errorMessage: aStringMessage [
	errorMessage := aStringMessage
]

{ #category : #accessing }
GtPhlowErrorActionSpecification >> iconStencil [ 
	^ nil
]

{ #category : #accessing }
GtPhlowErrorActionSpecification >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	
	aDictionary 
		at: 'errorMessage' 
		ifPresent: [ :aText |
			self errorMessage: aText ].
	aDictionary 
		at: 'tooltipText' 
		ifPresent: [ :aText |
			self tooltipText: aText ].
]

{ #category : #accessing }
GtPhlowErrorActionSpecification >> label [
	^ 'Error'
]
