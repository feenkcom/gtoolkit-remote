Class {
	#name : #GtPhlowTextRunWithAttributes,
	#superclass : #GtPhlowTextAttributedRuns,
	#instVars : [
		'run',
		'attributes'
	],
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #'instance creation' }
GtPhlowTextRunWithAttributes class >> fromJSONDictionary: anAttributeData [ 
	^ self new  
		initializeFromJSONDictionary: anAttributeData
]

{ #category : #accessing }
GtPhlowTextRunWithAttributes class >> typeLabel [
	^ 'phlowTextRunWithAttributes'
]

{ #category : #accessing }
GtPhlowTextRunWithAttributes >> addAttribute: anAttribute [
	self attributes add: anAttribute
]

{ #category : #styling }
GtPhlowTextRunWithAttributes >> applyStyleToText: aText [
	| subText |
	subText := aText from: run first to: run last.
	attributes do: [ :anAttribute |
		anAttribute applyStyleToText: subText ]
]

{ #category : #converting }
GtPhlowTextRunWithAttributes >> asDictionaryForExport [

	^ super asDictionaryForExport
		at: 'run' put: (Array with: run first with: run last);
		at: 'attributes' put: (attributes collect: [ :anAttribute |
			anAttribute asDictionaryForExport ]);
		yourself
]

{ #category : #accessing }
GtPhlowTextRunWithAttributes >> attributes [
	^ attributes
]

{ #category : #accessing }
GtPhlowTextRunWithAttributes >> attributes: aCollection [
	attributes := aCollection
]

{ #category : #printing }
GtPhlowTextRunWithAttributes >> attributesDescription [
	^ String streamContents: [ :aStream |
		self attributesDescriptionOn: aStream ]
]

{ #category : #printing }
GtPhlowTextRunWithAttributes >> attributesDescriptionOn: aStream [ 
	self attributes 
		do: [ :anAttribute |
			aStream << anAttribute printString ] 
		separatedBy: [ aStream << ' ']
]

{ #category : #accessing }
GtPhlowTextRunWithAttributes >> gtViewAttributesFor: aView [ 
	<gtView>
	
	^ aView columnedList 
		title: 'Attributes';
		items: [ self attributes ];
		column: 'Attribute' text: [ :anAttribute | anAttribute printString];
		column: 'Run ' text: [ :_ | self runDescription ]
]

{ #category : #initialization }
GtPhlowTextRunWithAttributes >> initializeFromJSONDictionary: aTextStylerData [
	aTextStylerData at: 'run' ifPresent: [ :aRunData |
		run := Interval  
			from: aRunData first to: aRunData second ].
	attributes := ((aTextStylerData at: 'attributes') collect: [ :anAttributeData |
		 GtPhlowTextAttribute fromJSONDictionary: anAttributeData ]) asArray
]

{ #category : #printing }
GtPhlowTextRunWithAttributes >> printOn: aStream [
	self runDescriptionOn:  aStream.
	aStream << ': '.
	self attributesDescriptionOn: aStream 
]

{ #category : #accessing }
GtPhlowTextRunWithAttributes >> run [
	^ run
]

{ #category : #accessing }
GtPhlowTextRunWithAttributes >> run: anInterval [
	^ run := anInterval
]

{ #category : #printing }
GtPhlowTextRunWithAttributes >> runDescription [
	^ String streamContents: [ :aStream |
		 self runDescriptionOn: aStream ]
]

{ #category : #printing }
GtPhlowTextRunWithAttributes >> runDescriptionOn: aStream [
	aStream 
		print: self run first;
		<< '-';
		print: self run last
]
