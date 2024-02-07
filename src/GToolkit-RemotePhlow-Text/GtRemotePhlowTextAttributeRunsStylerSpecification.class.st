Class {
	#name : #GtRemotePhlowTextAttributeRunsStylerSpecification,
	#superclass : #GtRemotePhlowTextStylerSpecification,
	#instVars : [
		'attributeRuns'
	],
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #accessing }
GtRemotePhlowTextAttributeRunsStylerSpecification class >> typeLabel [
	^ 'remotePhlowTextAttributeRunsStylerSpecification'
]

{ #category : #converting }
GtRemotePhlowTextAttributeRunsStylerSpecification >> asDictionaryForExport [
	"Answer the receiver as a dictionary ready for JSON serialisation.
	Subclasses will override and add to the dictionary"

	^ super asDictionaryForExport
		at: 'attributeRuns' put: attributeRuns  asDictionaryForExport;
		yourself
]

{ #category : #accessing }
GtRemotePhlowTextAttributeRunsStylerSpecification >> attributeRuns: aCollection [
	attributeRuns := aCollection
]

{ #category : #testing }
GtRemotePhlowTextAttributeRunsStylerSpecification >> canAffectText [
	^ attributeRuns notNil and: [ attributeRuns notEmpty ]
]

{ #category : #'gt - extensions' }
GtRemotePhlowTextAttributeRunsStylerSpecification >> gtViewRunWithAttributesFor: aView [ 
	<gtView>
	
	^ aView forward 
		title: 'Runs';
		object: [ attributeRuns ];
		view: #gtViewIntervalsFor:
]

{ #category : #initialization }
GtRemotePhlowTextAttributeRunsStylerSpecification >> initializeFromJSONDictionary: aTextStylerSpecificationData [ 
	super initializeFromJSONDictionary: aTextStylerSpecificationData .
	
	attributeRuns := GtPhlowRuns fromJSONDictionary:   (aTextStylerSpecificationData at: 'attributeRuns')
]
