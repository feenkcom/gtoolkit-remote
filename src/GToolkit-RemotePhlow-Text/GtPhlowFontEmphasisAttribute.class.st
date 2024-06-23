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

{ #category : #'instance creation' }
GtPhlowFontEmphasisAttribute class >> normal [
	^ self new 
		emphasis: #normal
]

{ #category : #'instance creation' }
GtPhlowFontEmphasisAttribute class >> oblique [
	^ self new 
		emphasis: #oblique
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

{ #category : #comparing }
GtPhlowFontEmphasisAttribute >> equals: anAnotherAttribute [
	^ self emphasis = anAnotherAttribute emphasis
]

{ #category : #comparing }
GtPhlowFontEmphasisAttribute >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ super hash bitXor: self emphasis hash
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
