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

{ #category : #initialization }
GtPhlowTextRunWithAttributes >> initializeFromJSONDictionary: aTextStylerData [
	aTextStylerData at: 'run' ifPresent: [ :aRunData |
		run := Interval  
			from: aRunData first to: aRunData second ].
	attributes := ((aTextStylerData at: 'attributes') collect: [ :anAttributeData |
		 GtPhlowTextAttribute fromJSONDictionary: anAttributeData ]) asArray
]

{ #category : #accessing }
GtPhlowTextRunWithAttributes >> run [
	^ run
]

{ #category : #accessing }
GtPhlowTextRunWithAttributes >> run: anInterval [
	^ run := anInterval
]
