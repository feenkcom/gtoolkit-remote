Class {
	#name : #GtRemotePhlowTextStylerSpecification,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #'instance creation' }
GtRemotePhlowTextStylerSpecification class >> fromJSONDictionary: aTextStylerData [ 
	| typeLabel stylerClass |
 	typeLabel := aTextStylerData at: '__typeLabel'.
 	
 	stylerClass := self stylerSpecificationClassForType: typeLabel.
		
	^ stylerClass 
		ifNil: [ nil ]
		ifNotNil: [
			stylerClass new  
				initializeFromJSONDictionary: aTextStylerData ]
]

{ #category : #'instance creation' }
GtRemotePhlowTextStylerSpecification class >> stylerSpecificationClassForType: aTypeLabel [ 
	aTypeLabel = GtRemotePhlowTextAttributeRunsStylerSpecification typeLabel ifTrue: [
 		^ GtRemotePhlowTextAttributeRunsStylerSpecification  ].
			
	aTypeLabel = GtRemotePhlowTextClassStylerSpecification typeLabel ifTrue: [
 		^ GtRemotePhlowTextClassStylerSpecification  ].
			
	aTypeLabel = GtRemotePhlowTextParserStylerSpecification typeLabel ifTrue: [
 		^  GtRemotePhlowTextParserStylerSpecification ].
 		
 	^ nil
]

{ #category : #accessing }
GtRemotePhlowTextStylerSpecification class >> typeLabel [
	^ '<missing>'
]

{ #category : #converting }
GtRemotePhlowTextStylerSpecification >> asDictionaryForExport [
	"Answer the receiver as a dictionary ready for JSON serialisation.
	Subclasses will override and add to the dictionary"

	^ Dictionary new 
		at: '__typeLabel' put: self class typeLabel;
		yourself
]

{ #category : #initialization }
GtRemotePhlowTextStylerSpecification >> initializeFromJSONDictionary: aTextStylerData [ 
	
]
