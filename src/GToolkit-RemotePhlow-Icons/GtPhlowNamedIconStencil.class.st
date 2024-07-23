Class {
	#name : #GtPhlowNamedIconStencil,
	#superclass : #GtPhlowIconStencil,
	#instVars : [
		'iconName'
	],
	#category : #'GToolkit-RemotePhlow-Icons'
}

{ #category : #accessing }
GtPhlowNamedIconStencil >> asDictionaryForExport [
	^ super asDictionaryForExport
		at: 'iconName' put: self iconName;
		yourself
]

{ #category : #accessing }
GtPhlowNamedIconStencil >> iconName [
	^ iconName
]

{ #category : #accessing }
GtPhlowNamedIconStencil >> iconName: anIconName [
	iconName := anIconName
]

{ #category : #accessing }
GtPhlowNamedIconStencil >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	
	aDictionary 
		at: 'iconName' 
		ifPresent: [ :anIconName | 
			anIconName ifNotNil: [ 
				self iconName: anIconName ] ]
]
