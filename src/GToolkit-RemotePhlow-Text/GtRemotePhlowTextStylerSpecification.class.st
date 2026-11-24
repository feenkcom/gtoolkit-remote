Class {
	#name : #GtRemotePhlowTextStylerSpecification,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #'instance creation' }
GtRemotePhlowTextStylerSpecification class >> fromJSONDictionary: aTextStylerSpecificationData [ 
	| typeLabel stylerSpecificationClass |
 	typeLabel := aTextStylerSpecificationData at: '__typeLabel'.
 	
 	stylerSpecificationClass := self stylerSpecificationClassForType: typeLabel.
		
	^ stylerSpecificationClass 
		ifNil: [ nil ]
		ifNotNil: [
			stylerSpecificationClass new 
				initializeFromJSONDictionary: aTextStylerSpecificationData ]
]

{ #category : #'instance creation' }
GtRemotePhlowTextStylerSpecification class >> stylerSpecificationClassForType: aTypeLabel [ 
	"aTypeLabel comes from the other side: a String or a Symbol"

	(GtRemotePhlowTextAttributeRunsStylerSpecification typeLabel sameContentAs: aTypeLabel) ifTrue: [
 		^ GtRemotePhlowTextAttributeRunsStylerSpecification  ].
			
	(GtRemotePhlowTextClassStylerSpecification typeLabel sameContentAs: aTypeLabel) ifTrue: [
 		^ GtRemotePhlowTextClassStylerSpecification  ].
			
	(GtRemotePhlowTextParserStylerSpecification typeLabel sameContentAs: aTypeLabel) ifTrue: [
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

{ #category : #testing }
GtRemotePhlowTextStylerSpecification >> canAffectText [
	^ true
]

{ #category : #converting }
GtRemotePhlowTextStylerSpecification >> convertToSerializableSpecificationForText: aText [
	^ self
]

{ #category : #initialization }
GtRemotePhlowTextStylerSpecification >> initializeFromJSONDictionary: aTextStylerSpecificationData [ 
	
]
