Class {
	#name : #GtPhlowTextAttributedRuns,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #'instance creation' }
GtPhlowTextAttributedRuns class >> fromJSONDictionary: aTextStylerData [ 
	| typeLabel attributesClass |
 	typeLabel := aTextStylerData at: '__typeLabel'.
 	
	typeLabel = GtPhlowTextAttributeWithRuns typeLabel ifTrue: [
 		attributesClass := GtPhlowTextAttributeWithRuns  ].
			
	typeLabel = GtPhlowTextRunWithAttributes typeLabel ifTrue: [
 		attributesClass :=  GtPhlowTextRunWithAttributes ].
		
	^ attributesClass 
		ifNil: [ nil ]
		ifNotNil: [
			attributesClass new  
				initializeFromJSONDictionary: aTextStylerData ]
]

{ #category : #accessing }
GtPhlowTextAttributedRuns class >> typeLabel [
	^ '<missing>'
]

{ #category : #accessing }
GtPhlowTextAttributedRuns >> asDictionaryForExport [
	"Answer the receiver as a dictionary ready for JSON serialisation.
	Subclasses will override and add to the dictionary"

	^ Dictionary new 
		at: '__typeLabel' put: self class typeLabel;
		yourself
]
