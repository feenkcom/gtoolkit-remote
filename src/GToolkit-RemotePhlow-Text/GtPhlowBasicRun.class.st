Class {
	#name : #GtPhlowBasicRun,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #'instance creation' }
GtPhlowBasicRun class >> from: aStartIndex to: aEndIndex attributes: aCollectionOfAttributes [
	^ self new 
		initializeFrom: aStartIndex to: aEndIndex attributes: aCollectionOfAttributes
]

{ #category : #'instance creation' }
GtPhlowBasicRun class >> fromJSONDictionary: aTextStylerData [ 
	| typeLabel attributesClass |
 	typeLabel := aTextStylerData at: '__typeLabel'.
			
	typeLabel = GtPhlowRun typeLabel ifTrue: [
 		attributesClass :=  GtPhlowRun ].
		
	^ attributesClass 
		ifNil: [ nil ]
		ifNotNil: [
			attributesClass new  
				initializeFromJSONDictionary: aTextStylerData ]
]

{ #category : #accessing }
GtPhlowBasicRun class >> typeLabel [
	^ '<missing>'
]

{ #category : #styling }
GtPhlowBasicRun >> applyStyleToText: aText [
	self subclassResponsibility
]

{ #category : #accessing }
GtPhlowBasicRun >> asDictionaryForExport [
	"Answer the receiver as a dictionary ready for JSON serialisation.
	Subclasses will override and add to the dictionary"

	^ Dictionary new 
		at: '__typeLabel' put: self class typeLabel;
		yourself
]

{ #category : #initialization }
GtPhlowBasicRun >> initializeFrom: aStartIndex to: aEndIndex attributes: aCollectionOfAttributes [ 
	self subclassResponsibility
]
