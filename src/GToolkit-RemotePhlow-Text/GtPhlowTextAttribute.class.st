Class {
	#name : #GtPhlowTextAttribute,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #'instance creation' }
GtPhlowTextAttribute class >> attibuteClassForType: aTypeLabel [ 
 	
	aTypeLabel = GtPhlowTextForegroundAttribute typeLabel ifTrue: [
 		^ GtPhlowTextForegroundAttribute  ].
	aTypeLabel = GtPhlowFontSizeAttribute typeLabel ifTrue: [
 		^ GtPhlowFontSizeAttribute  ].
		
	^ nil
]

{ #category : #'instance creation' }
GtPhlowTextAttribute class >> fromJSONDictionary: aTextAttributeData [ 
	| attributeType attributeClass |
	attributeType :=  aTextAttributeData at: '__typeLabel'.
 	
	attributeClass := self attibuteClassForType: attributeType.
		
	^ attributeType 
		ifNil: [ 
			GtPhlowTextUnknownAttribute new
				rawData: aTextAttributeData ]
		ifNotNil: [
			attributeClass new
				initializeFromJSONDictionary: aTextAttributeData  ]
]

{ #category : #accessing }
GtPhlowTextAttribute class >> typeLabel [
	^ 'unknown'
]

{ #category : #styling }
GtPhlowTextAttribute >> applyStyleToText: aText [
	self subclassResponsibility
]

{ #category : #converting }
GtPhlowTextAttribute >> asDictionaryForExport [
	"Answer the receiver as a dictionary ready for JSON serialisation.
	Subclasses will override and add to the dictionary"

	^ Dictionary new 
		at: '__typeLabel' put: self class typeLabel;
		yourself
]

{ #category : #initialization }
GtPhlowTextAttribute >> initializeFromJSONDictionary: aTextAttributeData [ 
]
