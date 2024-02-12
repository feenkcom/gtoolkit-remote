Class {
	#name : #GtPhlowRunBasedText,
	#superclass : #GtPhlowText,
	#instVars : [
		'sourceString',
		'attributeRuns'
	],
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #'instance creation' }
GtPhlowRunBasedText class >> fromJSONDictionary: aDictionary [
	^ self new
		initializeFromJSONDictionary: aDictionary
]

{ #category : #accessing }
GtPhlowRunBasedText class >> typeLabel [
	^ 'gtPhlowRunBasedText'
]

{ #category : #attributes }
GtPhlowRunBasedText >> addAttribute: aPhlowAttribute from: aStartIndex to: anEndIndex [
	| targetRun | 
	targetRun := attributeRuns 
		detect: [ :aRunWithAttributes |
			aRunWithAttributes startIndex = aStartIndex and: [
				aRunWithAttributes endIndex = anEndIndex ] ] 
		ifNone: [
			| newRun |
			newRun := (GtPhlowRun 
				from: aStartIndex
				to: anEndIndex
				attributes: OrderedCollection new).
			attributeRuns addRun: newRun.
			newRun ].
	targetRun addAttribute: aPhlowAttribute
]

{ #category : #converting }
GtPhlowRunBasedText >> asDictionaryForExport [
	"Answer the receiver as a dictionary ready for JSON serialisation.
	Subclasses will override and add to the dictionary"
	| dataForExport|
	dataForExport := Dictionary new.
	dataForExport
		at: '__typeLabel' put: self class typeLabel;
		at: 'sourceString' put: sourceString.
	attributeRuns ifNotNil: [ :currentAttributeRuns | 
		dataForExport
			at: 'attributeRuns' 
			put: currentAttributeRuns asDictionaryForExport ].

	^ dataForExport
]

{ #category : #converting }
GtPhlowRunBasedText >> asRopedText [
	^ self 
		gtDo: [ 
			(#GtRemotePhlowLocalTextAttributeRunsStyler asClass new 
				attributeRuns: attributeRuns)
					style: sourceString asRopedText]
		gemstoneDo: [ self ]
]

{ #category : #converting }
GtPhlowRunBasedText >> asString [
	^ sourceString
]

{ #category : #accessing }
GtPhlowRunBasedText >> attributeRuns [
	^ attributeRuns
]

{ #category : #accessing }
GtPhlowRunBasedText >> attributeRuns: anAttributeRuns [
	attributeRuns := anAttributeRuns
]

{ #category : #'test - accessing' }
GtPhlowRunBasedText >> copyFrom: aStartIndex to: anEndIndex [
	"Create a copy of this text within a given indices interval.
	Note: I am different from ==#from:to:== in a sense that I don't create a sub-text that points
	to the original text, I create an independent copy which can be safely used in text editors and other tools."

	<return: #BlText>
	| result |
	aStartIndex > anEndIndex ifTrue: [ 
		^ self empty].
	
	result := self class
		forString: (sourceString copyFrom: aStartIndex to: anEndIndex).
		
	self attributeRuns size > 0 ifTrue: [ 
		result
			attributeRuns: (self attributeRuns 
				copyFrom: aStartIndex
				to: anEndIndex) ].
	^ result
]

{ #category : #'test - accessing' }
GtPhlowRunBasedText >> empty [
	"Return a similar (the same backend data structure) but empty text"
	<return: #BlText>
	
	^ self class forString: ''
]

{ #category : #accessing }
GtPhlowRunBasedText >> endIndex [
	^ sourceString size
]

{ #category : #accessing }
GtPhlowRunBasedText >> extractRemotePhlowRuns [
	^ self attributeRuns
]

{ #category : #accessing }
GtPhlowRunBasedText >> forString: aString [
	^ self
		initializeWithString: aString
]

{ #category : #'test - accessing' }
GtPhlowRunBasedText >> from: aStart to: anEnd [
	"Create and return a subtext of this text form aStart to anEnd."
	<return: #GtPhlowSubText>
	
	aStart <= (anEnd + 1) 
		ifFalse: [ Error signal: 'Start must not exceed end' ].
		
	(self notEmpty or: [ aStart = 1 and: [ anEnd isZero ] ]) 
		ifFalse: [ Error signal: 'If I am empty then start must be 1 and end must be zero' ].

	^ GtPhlowSubText text: self from: aStart to: anEnd
]

{ #category : #'gt - extensions' }
GtPhlowRunBasedText >> gtAttributeTreeFor: aView [
	<gtView>
	| attributes |
	attributes := Dictionary new.
	attributeRuns runsDo: [ :aRun | 
			aRun attributes
				do: [ :each | 
					| locations |
					locations := attributes at: each ifAbsentPut: [ OrderedCollection new ].
					(locations notEmpty and: [ locations last last + 1 = aRun startIndex ])
						ifTrue: [ locations at: locations size put: (locations last first to: aRun endIndex) ]
						ifFalse: [ locations add: (aRun startIndex to: aRun endIndex) ] ] ].
	^ aView columnedTree
		title: 'All attributes';
		priority: 20;
		items: [ attributes keys
				asSortedCollection: [ :a :b | (attributes at: a) first first < (attributes at: b) first first ] ];
		children: [ :each | attributes at: each ifAbsent: [ #() ] ];
		column: 'Text'
			text: [ :each | 
				each class = Interval
					ifTrue: [ (self copyFrom: each first to: each last) asRopedText ]
					ifFalse: [ each printString ] ];
		column: 'Interval'
			text: [ :each | 
				each class = Interval
					ifTrue: [ each first printString , '-' , each last printString ]
					ifFalse: [ '' ] ]
			width: 80;
		send: [ :each | 
			each class = Interval
				ifTrue: [ self from: (each first max: 1) to: each last ]
				ifFalse: [ each ] ]
]

{ #category : #'gt - extensions' }
GtPhlowRunBasedText >> gtStringFor: aView [
	<gtView>
	self isEmpty ifTrue: [ ^ aView empty ].
	
	^ aView forward 
		title: 'String';
		priority: 5;
		object: [ sourceString ];
		view: #gtLiveFor:
]

{ #category : #'gt - extensions' }
GtPhlowRunBasedText >> gtViewIntervalsFor: aView [
	<gtView>
	
	^ aView forward 
		title: 'Runs';
		priority: 10;
		object: [ attributeRuns ];
		view: #gtViewIntervalsFor: 
]

{ #category : #initialization }
GtPhlowRunBasedText >> initializeFromJSONDictionary: aDictionary [
	self initializeWithString: (aDictionary at: 'sourceString').
		
	(aDictionary includesKey: 'attributeRuns') ifTrue: [
		self attributeRuns: (GtPhlowRuns
				fromJSONDictionary: (aDictionary at: 'attributeRuns')) ]
]

{ #category : #initialization }
GtPhlowRunBasedText >> initializeWithString: aString [ 
	sourceString := aString.
	attributeRuns := GtPhlowRunsGroup new
]

{ #category : #printing }
GtPhlowRunBasedText >> printOn: aStream [
	aStream 
		<< 'Phlow Rope: ';
		<< sourceString
]

{ #category : #'test - accessing' }
GtPhlowRunBasedText >> size [
	^ sourceString size
]

{ #category : #accessing }
GtPhlowRunBasedText >> startIndex [
	^ 1
]
