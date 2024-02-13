Class {
	#name : #GtPhlowRun,
	#superclass : #GtPhlowBasicRun,
	#instVars : [
		'attributes',
		'startIndex',
		'endIndex'
	],
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #'instance creation' }
GtPhlowRun class >> fromJSONDictionary: anAttributeData [ 
	^ self new  
		initializeFromJSONDictionary: anAttributeData
]

{ #category : #accessing }
GtPhlowRun class >> typeLabel [
	^ 'phlowRun'
]

{ #category : #comparing }
GtPhlowRun >> = anObject [
	
	self == anObject
		ifTrue: [ ^ true ].
	(anObject class = self class)
		ifFalse: [ ^ false ].

	^ (self startIndex = anObject startIndex) and: [
		self endIndex = anObject endIndex and: [ 
			self attributes = anObject attributes ] ]
]

{ #category : #accessing }
GtPhlowRun >> addAttribute: anAttribute [
	self attributes add: anAttribute
]

{ #category : #styling }
GtPhlowRun >> applyStyleToText: aText [
	| subText |
	subText := aText from: startIndex to: endIndex.
	attributes do: [ :anAttribute |
		anAttribute applyStyleToText: subText ]
]

{ #category : #converting }
GtPhlowRun >> asDictionaryForExport [

	^ super asDictionaryForExport
		at: 'startIndex' put: startIndex;
		at: 'endIndex' put: endIndex;
		at: 'attributes' put: (attributes collect: [ :anAttribute |
			anAttribute asDictionaryForExport ]) asArray;
		yourself
]

{ #category : #accessing }
GtPhlowRun >> attributes [
	^ attributes
]

{ #category : #accessing }
GtPhlowRun >> attributes: aCollection [
	attributes := aCollection asOrderedCollection
]

{ #category : #printing }
GtPhlowRun >> attributesDescription [
	^ String streamContents: [ :aStream |
		self attributesDescriptionOn: aStream ]
]

{ #category : #printing }
GtPhlowRun >> attributesDescriptionOn: aStream [ 
	self attributes 
		do: [ :anAttribute |
			aStream << anAttribute printString ] 
		separatedBy: [ aStream << ' ']
]

{ #category : #copying }
GtPhlowRun >> copyFrom: aStartIndex to: anEndIndex [
	^ self class
		from: (aStartIndex max: startIndex) - aStartIndex + 1
		to: (anEndIndex min: endIndex) - aStartIndex + 1
		attributes: attributes  copy
]

{ #category : #accessing }
GtPhlowRun >> endIndex [
	^ endIndex
]

{ #category : #accessing }
GtPhlowRun >> gtViewAttributesFor: aView [ 
	<gtView>
	
	^ aView columnedList 
		title: 'Attributes';
		items: [ self attributes ];
		column: 'Attribute' text: [ :anAttribute | anAttribute printString];
		column: 'Range ' text: [ :_ | self rangeDescription ]
]

{ #category : #comparing }
GtPhlowRun >> hash [

	^ (self startIndex hash 
		bitXor: self endIndex hash)
		bitXor: self attributes hash
]

{ #category : #initialization }
GtPhlowRun >> initializeFrom: aStartIndex to: aEndIndex attributes: aCollectionOfAttributes [ 
	startIndex := aStartIndex.
	endIndex := aEndIndex.
	self attributes: aCollectionOfAttributes.
]

{ #category : #initialization }
GtPhlowRun >> initializeFromJSONDictionary: aRunData [
	self 
		initializeFrom: (aRunData at: 'startIndex')
		to: (aRunData at: 'endIndex')
		attributes: ((aRunData at: 'attributes') collect: [ :anAttributeData |
			GtPhlowTextAttribute fromJSONDictionary: anAttributeData ]) 
]

{ #category : #printing }
GtPhlowRun >> printOn: aStream [
	self rangeDescriptionOn:  aStream.
	aStream << ': '.
	self attributesDescriptionOn: aStream 
]

{ #category : #printing }
GtPhlowRun >> rangeDescription [
	^ String streamContents: [ :aStream |
		 self rangeDescriptionOn: aStream ]
]

{ #category : #printing }
GtPhlowRun >> rangeDescriptionOn: aStream [
	aStream 
		print: startIndex;
		<< '-';
		print: endIndex
]

{ #category : #accessing }
GtPhlowRun >> startIndex [
	^ startIndex
]
