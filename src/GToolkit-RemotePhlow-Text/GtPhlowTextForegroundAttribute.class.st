Class {
	#name : #GtPhlowTextForegroundAttribute,
	#superclass : #GtPhlowTextAttribute,
	#instVars : [
		'color'
	],
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #accessing }
GtPhlowTextForegroundAttribute class >> typeLabel [
	^ 'phlowTextForegroundAttribute'
]

{ #category : #styling }
GtPhlowTextForegroundAttribute >> applyStyleToText: aText [
	aText foreground: self color asColor 
]

{ #category : #converting }
GtPhlowTextForegroundAttribute >> asDictionaryForExport [

	^ super asDictionaryForExport
		at: 'color' put: self color asDictionaryForExport;
		yourself
]

{ #category : #accessing }
GtPhlowTextForegroundAttribute >> color [
	^ color
]

{ #category : #accessing }
GtPhlowTextForegroundAttribute >> color: anObject [
	color := anObject
]

{ #category : #initialization }
GtPhlowTextForegroundAttribute >> initializeFromJSONDictionary: aTextAttributeData [ 
	super initializeFromJSONDictionary: aTextAttributeData .
	
	color := GtPhlowColor fromJSONDictionary: (aTextAttributeData at: 'color')
]

{ #category : #printing }
GtPhlowTextForegroundAttribute >> printOn: aStream [
	aStream
		nextPutAll: 'text-foreground: ';
		nextPutAll: self color printString
]
