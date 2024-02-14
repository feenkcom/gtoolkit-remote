Class {
	#name : #GtPhlowRuns,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #'instance creation' }
GtPhlowRuns class >> fromJSONDictionary: aRunsData [ 
	| typeLabel runsClass |
 	typeLabel := aRunsData at: '__typeLabel'.
			
	typeLabel = GtPhlowRunsGroup typeLabel ifTrue: [
 		runsClass := GtPhlowRunsGroup ].
		
	^ runsClass 
		ifNil: [ nil ]
		ifNotNil: [
			runsClass new  
				initializeFromJSONDictionary: aRunsData ]
]

{ #category : #accessing }
GtPhlowRuns class >> typeLabel [
	^ '<missing>'
]

{ #category : #styling }
GtPhlowRuns >> applyStyleToText: aText [
	self runsDo: [ :aRun |
		aRun applyStyleToText: aText ]
]

{ #category : #converting }
GtPhlowRuns >> asDictionaryForExport [
	"Answer the receiver as a dictionary ready for JSON serialisation.
	Subclasses will override and add to the dictionary"

	^ Dictionary new 
		at: '__typeLabel' put: self class typeLabel;
		yourself
]

{ #category : #'gt - extensions' }
GtPhlowRuns >> gtViewIntervalsFor: aView [
	<gtView>
	
	^ aView columnedList 
		title: 'Intervals';
		priority: 10;
		items: [ 
			| collectedRuns |
			collectedRuns := OrderedCollection new.
			self runsDo: [ :aRun |
				collectedRuns add: aRun ].
			collectedRuns ];
		column: 'Interval' 
			text: [ :aRun | aRun rangeDescription ]
			width: 150;
		column: 'Attributes' 
			text: [ :aRun | aRun attributesDescription ]
]

{ #category : #'initialization ' }
GtPhlowRuns >> initializeFromJSONDictionary: aRunsData [
]

{ #category : #testing }
GtPhlowRuns >> isEmpty [
	^ self subclassResponsibility
]

{ #category : #testing }
GtPhlowRuns >> notEmpty [
	^ self isEmpty not
]

{ #category : #enumerating }
GtPhlowRuns >> runsDo: aBlock [
	self subclassResponsibility 
]
