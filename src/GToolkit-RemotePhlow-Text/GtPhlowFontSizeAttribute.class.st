Class {
	#name : #GtPhlowFontSizeAttribute,
	#superclass : #GtPhlowTextAttribute,
	#instVars : [
		'sizeValue'
	],
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #accessing }
GtPhlowFontSizeAttribute class >> typeLabel [
	^ 'phlowFontSizeAttribute'
]

{ #category : #styling }
GtPhlowFontSizeAttribute >> applyStyleToText: aText [
	aText fontSize: self sizeValue
]

{ #category : #converting }
GtPhlowFontSizeAttribute >> asDictionaryForExport [

	^ super asDictionaryForExport
		at: 'size' put: self sizeValue;
		yourself
]

{ #category : #initialization }
GtPhlowFontSizeAttribute >> initializeFromJSONDictionary: aTextAttributeData [ 
	super initializeFromJSONDictionary: aTextAttributeData .
	
	sizeValue := aTextAttributeData at: 'size'
]

{ #category : #printing }
GtPhlowFontSizeAttribute >> printOn: aStream [
	aStream
		nextPutAll: 'font-size: ';
		nextPutAll: self sizeValue asString
]

{ #category : #accessing }
GtPhlowFontSizeAttribute >> sizeValue [
	^ sizeValue
]

{ #category : #accessing }
GtPhlowFontSizeAttribute >> sizeValue: anInteger [
	sizeValue := anInteger
]
