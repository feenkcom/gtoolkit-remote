Class {
	#name : #GtPhlowTextAttributeWithRuns,
	#superclass : #GtPhlowTextAttributedRuns,
	#instVars : [
		'attribute',
		'runs'
	],
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #'instance creation' }
GtPhlowTextAttributeWithRuns class >> fromJSONDictionary: anAttributeData [ 
	^ self new  
		initializeFromJSONDictionary: anAttributeData
]

{ #category : #accessing }
GtPhlowTextAttributeWithRuns class >> typeLabel [
	^ 'phlowTextAttributeWithRuns'
]

{ #category : #styling }
GtPhlowTextAttributeWithRuns >> applyStyleToText: aText [
	runs do: [ :aRun |
		attribute applyStyleToText: (aText from: aRun first to: aRun last) ]
]

{ #category : #converting }
GtPhlowTextAttributeWithRuns >> asDictionaryForExport [

	^ super asDictionaryForExport
		at: 'attribute' put: attribute asDictionaryForExport;
		at: 'runs' put: (runs collect: [ :aRun |
			(Array with: aRun first with: aRun last)]);
		yourself
]

{ #category : #accessing }
GtPhlowTextAttributeWithRuns >> attribute [
	^ attribute
]

{ #category : #accessing }
GtPhlowTextAttributeWithRuns >> attribute: aTextAttribute [
	attribute := aTextAttribute
]

{ #category : #'gt - extensions' }
GtPhlowTextAttributeWithRuns >> gtViewRunsFor: aView [ 
	<gtView>
	
	^ aView columnedList 
		title: 'Runs';
		items: [ runs ];
		column: 'Attribute' text: [ :_ | attribute ];
		column: 'Run' text: [ :anInterval | anInterval printString ]
]

{ #category : #'initialization ' }
GtPhlowTextAttributeWithRuns >> initializeFromJSONDictionary: aTextStylerData [
	attribute := GtPhlowTextAttribute fromJSONDictionary: (aTextStylerData at: 'attribute').
	runs := ((aTextStylerData at: 'runs') collect: [ :anArray |
		Interval  
			from: anArray first to: anArray second ]) asArray
]

{ #category : #accessing }
GtPhlowTextAttributeWithRuns >> runs [
	^ runs
]

{ #category : #accessing }
GtPhlowTextAttributeWithRuns >> runs: aCollectionOfRuns [
	runs := aCollectionOfRuns
]
