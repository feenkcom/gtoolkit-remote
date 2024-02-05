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

{ #category : #adding }
GtPhlowRunsGroup >> add: aRun [
	self addRun: aRun
]

{ #category : #adding }
GtPhlowRunsGroup >> addRun: aRun [
	self runs add: aRun
]

{ #category : #converting }
GtPhlowRunsGroup >> asDictionaryForExport [

	^ super asDictionaryForExport
		at: 'items' put: (self items collect: [ :aRun |
			aRun asDictionaryForExport ]) asArray;
		yourself
]

{ #category : #enumerating }
GtPhlowRunsGroup >> detect: aBlock ifNone: exceptionBlock [
	^ self runs detect: aBlock ifNone: exceptionBlock
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
		withRuns: (self runs reject: aBlock)
]

{ #category : #accessing }
GtPhlowRunsGroup >> runs [
	^ self items
]

{ #category : #enumerating }
GtPhlowRunsGroup >> runsDo: aBlock [
	self itemsDo: aBlock
]
