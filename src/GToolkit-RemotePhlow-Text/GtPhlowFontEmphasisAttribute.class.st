Class {
	#name : #GtPhlowFontEmphasisAttribute,
	#superclass : #GtPhlowTextAttribute,
	#instVars : [
		'emphasis'
	],
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #accessing }
GtPhlowFontEmphasisAttribute class >> typeLabel [
	^ 'phlowFontEmphasisAttribute'
]

{ #category : #accessing }
GtPhlowFontEmphasisAttribute >> applyStyleToText: aText [
	aText perform: emphasis asSymbol
]

{ #category : #accessing }
GtPhlowFontEmphasisAttribute >> asDictionaryForExport [
	^ super asDictionaryForExport
		at: 'emphasis' put: emphasis;
		yourself
]

{ #category : #accessing }
GtPhlowFontEmphasisAttribute >> emphasis [
	^ emphasis
]

{ #category : #accessing }
GtPhlowFontEmphasisAttribute >> emphasis: anObject [
	emphasis := anObject
]

{ #category : #accessing }
GtPhlowFontEmphasisAttribute >> initializeFromJSONDictionary: aTextAttributeData [
	super initializeFromJSONDictionary: aTextAttributeData.
	emphasis := aTextAttributeData at: 'emphasis'
]

{ #category : #accessing }
GtPhlowFontEmphasisAttribute >> printOn: aStream [
	aStream
		nextPutAll: 'font-emphasis: ';
		nextPutAll: emphasis
]
