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
		at: 'attributedRuns' put: (attributedRuns 
			collect: [ :anAttributeRun | 
				anAttributeRun asDictionaryForExport ]) asArray;
		yourself
]

{ #category : #accessing }
GtRemotePhlowTextAttributeRunsStylerSpecification >> attributedRuns: aCollection [
	attributedRuns := aCollection
]

{ #category : #'gt - extensions' }
GtRemotePhlowTextAttributeRunsStylerSpecification >> gtViewRunWithAttributesFor: aView [ 
	<gtView>
	
	^ aView columnedList 
		title: 'Runs with attributes';
		items: [ attributedRuns ];
		column: 'Run' 
			text: [ :anAttributeRun | anAttributeRun run printString ]
			weight: 0.5;
		column: 'Attribute' 
			text: [ :anAttributeRun | anAttributeRun attributes ]
]

{ #category : #initialization }
GtRemotePhlowTextAttributeRunsStylerSpecification >> initializeFromJSONDictionary: aTextStylerSpecificationData [ 
	super initializeFromJSONDictionary: aTextStylerSpecificationData .
	
	attributedRuns := (aTextStylerSpecificationData at: 'attributedRuns') 
		collect: [ :anAttributeRunData |
			GtPhlowTextAttributedRuns fromJSONDictionary:  anAttributeRunData ]
]
