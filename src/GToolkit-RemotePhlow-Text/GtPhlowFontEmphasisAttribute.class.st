Class {
	#name : #GtPhlowFontEmphasisAttribute,
	#superclass : #GtPhlowTextAttribute,
	#instVars : [
		'emphasis'
	],
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #'instance creation' }
GtPhlowFontEmphasisAttribute class >> italic [
	^ self new 
		emphasis: #italic
]

{ #category : #accessing }
GtPhlowFontEmphasisAttribute class >> typeLabel [
	^ 'phlowFontEmphasisAttribute'
]

{ #category : #styling }
GtPhlowFontEmphasisAttribute >> applyStyleToText: aText [
	aText perform: emphasis asSymbol
]

{ #category : #converting }
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

{ #category : #initialization }
GtPhlowFontEmphasisAttribute >> initializeFromJSONDictionary: aTextAttributeData [
	super initializeFromJSONDictionary: aTextAttributeData.
	emphasis := aTextAttributeData at: 'emphasis'
]

{ #category : #printing }
GtPhlowFontEmphasisAttribute >> printOn: aStream [
	aStream
		nextPutAll: 'phlow font-emphasis: ';
		nextPutAll: emphasis
]
