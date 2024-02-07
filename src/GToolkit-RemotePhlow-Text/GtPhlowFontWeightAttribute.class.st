Class {
	#name : #GtPhlowFontWeightAttribute,
	#superclass : #GtPhlowTextAttribute,
	#instVars : [
		'weight'
	],
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #accessing }
GtPhlowFontWeightAttribute class >> typeLabel [
	^ 'phlowFontWeightAttribute'
]

{ #category : #accessing }
GtPhlowFontWeightAttribute >> applyStyleToText: aText [
	aText perform: weight asSymbol
]

{ #category : #accessing }
GtPhlowFontWeightAttribute >> asDictionaryForExport [
	^ super asDictionaryForExport
		at: 'weight' put: weight;
		yourself
]

{ #category : #accessing }
GtPhlowFontWeightAttribute >> initializeFromJSONDictionary: aTextAttributeData [
	super initializeFromJSONDictionary: aTextAttributeData.
	weight := aTextAttributeData at: 'weight'
]

{ #category : #accessing }
GtPhlowFontWeightAttribute >> printOn: aStream [
	aStream
		nextPutAll: 'font-weight: ';
		nextPutAll: weight
]

{ #category : #accessing }
GtPhlowFontWeightAttribute >> weight [
	^ weight
]

{ #category : #accessing }
GtPhlowFontWeightAttribute >> weight: anObject [
	weight := anObject
]
