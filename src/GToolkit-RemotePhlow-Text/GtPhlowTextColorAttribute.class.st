Class {
	#name : #GtPhlowTextColorAttribute,
	#superclass : #GtPhlowTextAttribute,
	#instVars : [
		'color'
	],
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #accessing }
GtPhlowTextColorAttribute >> asDictionaryForExport [
	^ super asDictionaryForExport
		at: 'color' put: self color asDictionaryForExport;
		yourself
]

{ #category : #accessing }
GtPhlowTextColorAttribute >> color [
	^ color
]

{ #category : #accessing }
GtPhlowTextColorAttribute >> color: anObject [
	color := anObject
]

{ #category : #accessing }
GtPhlowTextColorAttribute >> initializeFromJSONDictionary: aTextAttributeData [
	super initializeFromJSONDictionary: aTextAttributeData.
	color := GtPhlowColor fromJSONDictionary: (aTextAttributeData at: 'color')
]
