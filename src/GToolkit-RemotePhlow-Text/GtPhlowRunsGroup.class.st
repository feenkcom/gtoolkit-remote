Class {
	#name : #GtPhlowRunsGroup,
	#superclass : #GtPhlowRuns,
	#instVars : [
		'items'
	],
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #accessing }
GtPhlowRunsGroup class >> typeLabel [
	^ 'phlowRunsGroup'
]

{ #category : #initialization }
GtPhlowRunsGroup class >> withRuns: aCollectionOfRuns [
	^ self new 
		initializeWithRuns: aCollectionOfRuns
]

{ #category : #accessing }
GtPhlowRunsGroup >> = anObject [
	
	self == anObject
		ifTrue: [ ^ true ].
	(anObject class = self class)
		ifFalse: [ ^ false ].

	^ self items = anObject items
]

{ #category : #adding }
GtPhlowRunsGroup >> add: aRun [
	self addRun: aRun
]

{ #category : #adding }
GtPhlowRunsGroup >> addRun: aRun [
	self items add: aRun
]

{ #category : #converting }
GtPhlowRunsGroup >> asDictionaryForExport [

	^ super asDictionaryForExport
		at: 'items' put: (self items collect: [ :aRun |
			aRun asDictionaryForExport ]) asArray;
		yourself
]

{ #category : #accessing }
GtPhlowRunsGroup >> copyFrom: aStartIndex to: anEndIndex [
	^ self class withRuns: ((self items 
		reject: [ :aRun |
			(anEndIndex < aRun startIndex) or: [ aStartIndex > aRun endIndex]])
		collect: [ :aRun |
			aRun copyFrom: aStartIndex to: anEndIndex ])
]

{ #category : #enumerating }
GtPhlowRunsGroup >> detect: aBlock ifNone: exceptionBlock [
	^ self items detect: aBlock ifNone: exceptionBlock
]

{ #category : #accessing }
GtPhlowRunsGroup >> hash [

	^ self items hash
]

{ #category : #initialization }
GtPhlowRunsGroup >> initializeFromJSONDictionary: aRunsData [
	items := ((aRunsData at: 'items') collect: [ :aRunData |
		GtPhlowBasicRun fromJSONDictionary:  aRunData ]) asOrderedCollection
]

{ #category : #initialization }
GtPhlowRunsGroup >> initializeWithRuns: aCollectionOfRuns [
	items := aCollectionOfRuns
]

{ #category : #testing }
GtPhlowRunsGroup >> isEmpty [
	^ items isNil or: [ items isEmpty ]
]

{ #category : #accessing }
GtPhlowRunsGroup >> items [
	^ items ifNil: [
		items := OrderedCollection new ]	
]

{ #category : #enumerating }
GtPhlowRunsGroup >> itemsDo: aBlock [
	items ifNil: [ ^ self ].
	
	items do: aBlock
]

{ #category : #printing }
GtPhlowRunsGroup >> printOn: aStream [
	super printOn:  aStream.
	aStream parenthesize: [
		aStream
			print: items size;
			<< ' runs' ]
]

{ #category : #enumerating }
GtPhlowRunsGroup >> reject: aBlock [
	^ self class 
		withRuns: (self items reject: aBlock)
]

{ #category : #enumerating }
GtPhlowRunsGroup >> runsDo: aBlock [
	self itemsDo: aBlock
]

{ #category : #accessing }
GtPhlowRunsGroup >> size [
	^ self isEmpty 
		ifTrue: [0] 
		ifFalse: [ self items size ]
]
