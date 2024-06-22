Class {
	#name : #GtPhlowTextDecorationAttribute,
	#superclass : #GtPhlowTextAttribute,
	#instVars : [
		'decoration'
	],
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #accessing }
GtPhlowTextDecorationAttribute class >> new [
	^ self basicNew initialize
]

{ #category : #accessing }
GtPhlowTextDecorationAttribute class >> typeLabel [
	^ #phlowTextDecorationAttribute
]

{ #category : #styling }
GtPhlowTextDecorationAttribute >> applyStyleToText: aText [
	aText decorationDo: [ :aTextDecorationAttribute |
		decoration applyPropertiesTo: aTextDecorationAttribute ]
]

{ #category : #converting }
GtPhlowTextDecorationAttribute >> asDictionaryForExport [
	^ super asDictionaryForExport
		at: 'decoration' put: decoration asDictionaryForExport;
		yourself
]

{ #category : #accessing }
GtPhlowTextDecorationAttribute >> color [
	^ decoration color
]

{ #category : #accessing }
GtPhlowTextDecorationAttribute >> color: aColor [
	decoration color: aColor
]

{ #category : #'api - decoration' }
GtPhlowTextDecorationAttribute >> dashed [
	decoration dashed
]

{ #category : #accessing }
GtPhlowTextDecorationAttribute >> decoration [
	<return: #GtPhlowTextDecoration>

	^ decoration
]

{ #category : #accessing }
GtPhlowTextDecorationAttribute >> decoration: aGTPhlowTextDecoration [
	decoration := aGTPhlowTextDecoration
]

{ #category : #'api - decoration' }
GtPhlowTextDecorationAttribute >> dotted [
	decoration dotted
]

{ #category : #'api - decoration' }
GtPhlowTextDecorationAttribute >> double [
	decoration double
]

{ #category : #comparing }
GtPhlowTextDecorationAttribute >> equals: anAnotherAttribute [
	^ self decoration = anAnotherAttribute decoration
]

{ #category : #initialization }
GtPhlowTextDecorationAttribute >> initialize [
	super initialize.
	
	decoration := GtPhlowTextDecoration new
]

{ #category : #initialization }
GtPhlowTextDecorationAttribute >> initializeFromJSONDictionary: aTextAttributeData [
	super initializeFromJSONDictionary: aTextAttributeData.
	
	decoration := GtPhlowTextDecoration 
		fromJSONDictionary: (aTextAttributeData at: 'decoration')
]

{ #category : #'api - decoration' }
GtPhlowTextDecorationAttribute >> lineThrough [
	decoration withLineThrough
]

{ #category : #'api - decoration' }
GtPhlowTextDecorationAttribute >> overline [
	decoration withOverline
]

{ #category : #'api - decoration' }
GtPhlowTextDecorationAttribute >> solid [
	decoration solid
]

{ #category : #accessing }
GtPhlowTextDecorationAttribute >> thickness [
	^ decoration thickness
]

{ #category : #accessing }
GtPhlowTextDecorationAttribute >> thickness: aNumber [
	decoration thickness: aNumber
]

{ #category : #'api - decoration' }
GtPhlowTextDecorationAttribute >> underline [
	decoration withUnderline
]

{ #category : #'api - decoration' }
GtPhlowTextDecorationAttribute >> wavy [
	decoration wavy
]
