Class {
	#name : #GtRemotePhlowTextAttributeRunsStylerSpecification,
	#superclass : #GtRemotePhlowTextStylerSpecification,
	#instVars : [
		'attributedRuns'
	],
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #accessing }
GtRemotePhlowTextAttributeRunsStylerSpecification class >> typeLabel [
	^ 'remotePhlowTextAttributeRunsStylerSpecification'
]

{ #category : #testing }
GtRemotePhlowTextAttributeRunsStylerSpecification >> affectsText [
	^ attributedRuns notNil and: [ attributedRuns notEmpty ]
]

{ #category : #converting }
GtRemotePhlowTextAttributeRunsStylerSpecification >> asDictionaryForExport [
	"Answer the receiver as a dictionary ready for JSON serialisation.
	Subclasses will override and add to the dictionary"

	^ super asDictionaryForExport
		at: 'attributedRuns' put: attributedRuns  asDictionaryForExport;
		yourself
]

{ #category : #accessing }
GtRemotePhlowTextAttributeRunsStylerSpecification >> attributedRuns: aCollection [
	attributedRuns := aCollection
]

{ #category : #'gt - extensions' }
GtRemotePhlowTextAttributeRunsStylerSpecification >> gtViewRunWithAttributesFor: aView [ 
	<gtView>
	
	^ aView forward 
		title: 'Runs';
		object: [ attributedRuns ];
		view: #gtViewIntervalsFor:
]

{ #category : #initialization }
GtRemotePhlowTextAttributeRunsStylerSpecification >> initializeFromJSONDictionary: aTextStylerSpecificationData [ 
	super initializeFromJSONDictionary: aTextStylerSpecificationData .
	
	attributedRuns := GtPhlowRuns fromJSONDictionary:   (aTextStylerSpecificationData at: 'attributedRuns')
]
