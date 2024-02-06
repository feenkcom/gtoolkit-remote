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

{ #category : #accessing }
GtPhlowFontNameAttribute >> applyStyleToText: aText [
	aText fontName: fontName
]

{ #category : #accessing }
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
GtPhlowFontNameAttribute >> fontName: anObject [
	fontName := anObject
]

{ #category : #accessing }
GtPhlowFontNameAttribute >> initializeFromJSONDictionary: aTextAttributeData [
	super initializeFromJSONDictionary: aTextAttributeData.
	fontName := aTextAttributeData at: 'name'
]

{ #category : #accessing }
GtPhlowFontNameAttribute >> printOn: aStream [
	aStream
		nextPutAll: 'font-name: ';
		nextPutAll: fontName
]
