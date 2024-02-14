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

{ #category : #comparing }
GtPhlowFontNameAttribute >> equals: anAnotherAttribute [
	^ self fontName = anAnotherAttribute fontName
]

{ #category : #accessing }
GtPhlowFontNameAttribute >> fontName [
	^ fontName
]

{ #category : #accessing }
GtPhlowFontNameAttribute >> fontName: aString [
	fontName := aString
]

{ #category : #comparing }
GtPhlowFontNameAttribute >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ super hash bitXor: self fontName hash
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
