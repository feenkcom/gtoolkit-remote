Class {
	#name : #GtPhlowTextColorAttribute,
	#superclass : #GtPhlowTextAttribute,
	#instVars : [
		'color'
	],
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #styling }
GtPhlowTextColorAttribute >> applyStyleToText: aText [
	aText highlight: self color
]

{ #category : #accessing }
GtPhlowTextColorAttribute >> asDictionaryForExport [
	^ super asDictionaryForExport
		at: 'color' put: self color asDictionaryForExport;
		yourself
]

{ #category : #accessing }
GtPhlowTextColorAttribute >> color [
	^ color
]

{ #category : #accessing }
GtPhlowTextColorAttribute >> color: anObject [
	color := anObject
]

{ #category : #comparing }
GtPhlowTextColorAttribute >> equals: anAnotherAttribute [
	^ self color = anAnotherAttribute color
]

{ #category : #comparing }
GtPhlowTextColorAttribute >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ super hash bitXor: self color hash
]

{ #category : #initialization }
GtPhlowTextColorAttribute >> initializeFromJSONDictionary: aTextAttributeData [
	super initializeFromJSONDictionary: aTextAttributeData.
	color := GtPhlowColor fromJSONDictionary: (aTextAttributeData at: 'color')
]
