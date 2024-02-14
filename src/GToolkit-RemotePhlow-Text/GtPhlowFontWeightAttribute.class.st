Class {
	#name : #GtPhlowFontWeightAttribute,
	#superclass : #GtPhlowTextAttribute,
	#instVars : [
		'weight'
	],
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #'instance creation' }
GtPhlowFontWeightAttribute class >> bold [
	^ self new 
		weight: #bold
]

{ #category : #'instance creation' }
GtPhlowFontWeightAttribute class >> thin [
	^ self new 
		weight: #thin
]

{ #category : #accessing }
GtPhlowFontWeightAttribute class >> typeLabel [
	^ 'phlowFontWeightAttribute'
]

{ #category : #styling }
GtPhlowFontWeightAttribute >> applyStyleToText: aText [
	aText perform: weight asSymbol
]

{ #category : #converting }
GtPhlowFontWeightAttribute >> asDictionaryForExport [
	^ super asDictionaryForExport
		at: 'weight' put: weight;
		yourself
]

{ #category : #comparing }
GtPhlowFontWeightAttribute >> equals: anAnotherAttribute [
	^ self weight = anAnotherAttribute weight
]

{ #category : #comparing }
GtPhlowFontWeightAttribute >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ super hash bitXor: self weight hash
]

{ #category : #initialization }
GtPhlowFontWeightAttribute >> initializeFromJSONDictionary: aTextAttributeData [
	super initializeFromJSONDictionary: aTextAttributeData.
	weight := aTextAttributeData at: 'weight'
]

{ #category : #printing }
GtPhlowFontWeightAttribute >> printOn: aStream [
	aStream
		nextPutAll: 'phlow font-weight: ';
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
