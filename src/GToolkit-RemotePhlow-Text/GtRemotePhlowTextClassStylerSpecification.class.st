Class {
	#name : #GtRemotePhlowTextClassStylerSpecification,
	#superclass : #GtRemotePhlowTextNamedStylerSpecification,
	#instVars : [
		'stylerClassName'
	],
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #accessing }
GtRemotePhlowTextClassStylerSpecification class >> typeLabel [
	^ 'remotePhlowTextClassStylerSpecification'
]

{ #category : #converting }
GtRemotePhlowTextClassStylerSpecification >> asDictionaryForExport [
	"Answer the receiver as a dictionary ready for JSON serialisation.
	Subclasses will override and add to the dictionary"

	^ super asDictionaryForExport
		at: 'stylerClassName' put: stylerClassName;
		yourself
]

{ #category : #initialization }
GtRemotePhlowTextClassStylerSpecification >> initializeFromJSONDictionary: aTextStylerSpecificationData [ 
	super initializeFromJSONDictionary: aTextStylerSpecificationData .
	
	stylerClassName := (aTextStylerSpecificationData at: 'stylerClassName') asSymbol
]

{ #category : #accessing }
GtRemotePhlowTextClassStylerSpecification >> stylerClassName [
	^ stylerClassName
]

{ #category : #accessing }
GtRemotePhlowTextClassStylerSpecification >> stylerClassName: aClassName [
	stylerClassName := aClassName
]
