Class {
	#name : #GtPhlowTextAttribute,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #'instance creation' }
GtPhlowTextAttribute class >> attibuteClassForType: aTypeLabel [
	self
		allSubclassesDo: [ :each | each typeLabel = aTypeLabel ifTrue: [ ^ each ] ].
	^ GtPhlowTextUnknownAttribute
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

{ #category : #comparing }
GtPhlowTextAttribute >> = anObject [
	"Return true if I am equal to a given object"
	<return: #Boolean>
	
	self == anObject
		ifTrue: [ ^ true ].
	(anObject class = self class)
		ifFalse: [ ^ false ].

	^ self equals: anObject
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

{ #category : #comparing }
GtPhlowTextAttribute >> equals: anAttribute [
	^ anAttribute class = self class
]

{ #category : #comparing }
GtPhlowTextAttribute >> hash [
	"Should be overriden by subclasses"
	^ 31 hash
]

{ #category : #initialization }
GtPhlowTextAttribute >> initializeFromJSONDictionary: aTextAttributeData [ 
]
