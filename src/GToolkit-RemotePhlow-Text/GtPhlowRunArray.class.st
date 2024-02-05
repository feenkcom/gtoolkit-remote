Class {
	#name : #GtPhlowRunArray,
	#superclass : #GtPhlowRuns,
	#instVars : [
		'runs'
	],
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #accessing }
GtPhlowRunArray class >> typeLabel [
	^ 'phlowRunArray'
]

{ #category : #initialization }
GtPhlowRunArray class >> withRuns: aCollectionOfRuns [
	^ self new 
		initializeWithRuns: aCollectionOfRuns
]

{ #category : #accessing }
GtPhlowRunArray >> addRun: aRun [
	self runs add: aRun
]

{ #category : #converting }
GtPhlowRunArray >> asDictionaryForExport [

	^ super asDictionaryForExport
		at: 'runs' put: (self runs collect: [ :aRun |
			aRun asDictionaryForExport ]) asArray;
		yourself
]

{ #category : #enumerating }
GtPhlowRunArray >> detect: aBlock ifNone: exceptionBlock [
	^ self runs detect: aBlock ifNone: exceptionBlock
]

{ #category : #initialization }
GtPhlowRunArray >> initializeFromJSONDictionary: aRunsData [
	runs := ((aRunsData at: 'runs') collect: [ :aRunData |
		GtPhlowBasicRun fromJSONDictionary:  aRunData ]) asOrderedCollection
]

{ #category : #initialization }
GtPhlowRunArray >> initializeWithRuns: aCollectionOfRuns [
	runs := aCollectionOfRuns
]

{ #category : #accessing }
GtPhlowRunArray >> printOn: aStream [
	super printOn:  aStream.
	aStream parenthesize: [
		aStream
			print: runs size;
			<< ' runs' ]
]

{ #category : #enumerating }
GtPhlowRunArray >> reject: aBlock [
	^ self class 
		withRuns: (self runs reject: aBlock)
]

{ #category : #accessing }
GtPhlowRunArray >> runs [
	^ runs ifNil: [
		runs := OrderedCollection new ]	
]

{ #category : #enumerating }
GtPhlowRunArray >> runsDo: aBlock [
	runs ifNil: [ ^ self ].
	
	runs do: aBlock
]
