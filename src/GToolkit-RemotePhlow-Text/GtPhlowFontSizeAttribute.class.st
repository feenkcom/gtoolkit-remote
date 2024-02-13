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

{ #category : #comparing }
GtPhlowFontSizeAttribute >> equals: anAnotherAttribute [
	^ self sizeValue = anAnotherAttribute sizeValue
]

{ #category : #comparing }
GtPhlowFontSizeAttribute >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ super hash bitXor: self sizeValue hash
]

{ #category : #initialization }
GtPhlowFontSizeAttribute >> initializeFromJSONDictionary: aTextAttributeData [ 
	super initializeFromJSONDictionary: aTextAttributeData .
	
	sizeValue := aTextAttributeData at: 'size'
]

{ #category : #printing }
GtPhlowFontSizeAttribute >> printOn: aStream [
	aStream
		nextPutAll: 'phlow font-size: ';
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
