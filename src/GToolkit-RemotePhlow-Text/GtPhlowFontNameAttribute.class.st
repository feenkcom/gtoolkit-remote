Class {
	#name : #GtPhlowFontNameAttribute,
	#superclass : #GtPhlowTextAttribute,
	#instVars : [
		'fontName'
	],
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #accessing }
GtPhlowFontNameAttribute class >> typeLabel [
	^ 'phlowFontNameAttribute'
]

{ #category : #styling }
GtPhlowFontNameAttribute >> applyStyleToText: aText [
	aText fontName: fontName
]

{ #category : #converting }
GtPhlowFontNameAttribute >> asDictionaryForExport [
	^ super asDictionaryForExport
		at: 'name' put: fontName;
		yourself
]

{ #category : #accessing }
GtPhlowFontNameAttribute >> fontName [
	^ fontName
]

{ #category : #accessing }
GtPhlowFontNameAttribute >> fontName: aString [
	fontName := aString
]

{ #category : #initialization }
GtPhlowFontNameAttribute >> initializeFromJSONDictionary: aTextAttributeData [
	super initializeFromJSONDictionary: aTextAttributeData.
	fontName := aTextAttributeData at: 'name'
]

{ #category : #printing }
GtPhlowFontNameAttribute >> printOn: aStream [
	aStream
		nextPutAll: 'phlow font-name: ';
		nextPutAll: fontName
]
