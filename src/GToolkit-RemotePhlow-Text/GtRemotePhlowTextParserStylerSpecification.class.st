Class {
	#name : #GtRemotePhlowTextParserStylerSpecification,
	#superclass : #GtRemotePhlowTextNamedStylerSpecification,
	#instVars : [
		'parserClassName'
	],
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #accessing }
GtRemotePhlowTextParserStylerSpecification class >> typeLabel [
	^ 'remotePhlowTextParserStylerSpecification'
]

{ #category : #converting }
GtRemotePhlowTextParserStylerSpecification >> asDictionaryForExport [
	"Answer the receiver as a dictionary ready for JSON serialisation.
	Subclasses will override and add to the dictionary"

	^ super asDictionaryForExport
		at: 'parserClassName' put: parserClassName;
		yourself
]

{ #category : #accessing }
GtRemotePhlowTextParserStylerSpecification >> initializeFromJSONDictionary: aTextStylerSpecificationData [ 
	super initializeFromJSONDictionary: aTextStylerSpecificationData .
	
	parserClassName := (aTextStylerSpecificationData at: 'parserClassName') asSymbol
]

{ #category : #accessing }
GtRemotePhlowTextParserStylerSpecification >> parserClassName [
	^ parserClassName
]

{ #category : #accessing }
GtRemotePhlowTextParserStylerSpecification >> parserClassName: aClassName [
	parserClassName := aClassName
]
