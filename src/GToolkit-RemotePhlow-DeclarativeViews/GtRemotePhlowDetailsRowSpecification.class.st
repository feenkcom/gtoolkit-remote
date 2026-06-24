Class {
	#name : #GtRemotePhlowDetailsRowSpecification,
	#superclass : #Object,
	#instVars : [
		'name',
		'index'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtRemotePhlowDetailsRowSpecification class >> fromJSONDictionary: aDictionary [
	^self new
		initializeFromJSONDictionary: aDictionary
]

{ #category : #'instance creation' }
GtRemotePhlowDetailsRowSpecification class >> fromPhlowRow: aPhlowRow withIndex: anIndex [
	^ self new 
			initializeFromPhlowRow: aPhlowRow withIndex: anIndex
]

{ #category : #comparing }
GtRemotePhlowDetailsRowSpecification >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ self name = anObject name
		and: [ self index = anObject index ]
]

{ #category : #converting }
GtRemotePhlowDetailsRowSpecification >> asDictionaryForExport [
	^ Dictionary new
			at: 'name' put: name;
			at: 'index' put: index;
			yourself
]

{ #category : #'gt extensions' }
GtRemotePhlowDetailsRowSpecification >> gtViewJSONFor: aView [
	<gtView>
	
	^ aView textEditor
		title: 'JSON';
		priority: 10;
		text: [
			STONJSON toStringPretty:  self asDictionaryForExport ];
		stylerParserClassName: #JSONParser";
		actionButtonIcon: BrGlamorousVectorIcons inspect 
			label: 'Json'
			tooltip: 'Inspect the JSON object'
			action: [ :aButton |
				aButton phlow 
					spawnObject: self asDictionaryForExport ]"
]

{ #category : #'gt extensions' }
GtRemotePhlowDetailsRowSpecification >> gtViewSpecificationDataFor: aView [
	<gtView>

	^ aView forward
		title: 'Specification data';
		priority: 10.4;
		object: [ self asDictionaryForExport ];
		view: #gtItemsFor:
]

{ #category : #comparing }
GtRemotePhlowDetailsRowSpecification >> hash [
	^ self name hash bitXor: self index hash
]

{ #category : #accessing }
GtRemotePhlowDetailsRowSpecification >> index [
	^ index
]

{ #category : #accessing }
GtRemotePhlowDetailsRowSpecification >> index: anInteger [
	index := anInteger
]

{ #category : #initialization }
GtRemotePhlowDetailsRowSpecification >> initializeFromJSONDictionary: aDictionary [
	self name: (aDictionary at: 'name').
	self index: (aDictionary at: 'index').
]

{ #category : #initialization }
GtRemotePhlowDetailsRowSpecification >> initializeFromPhlowRow: aPhlowRow withIndex: anIndex [
	self name: aPhlowRow name.
	self index: anIndex.
]

{ #category : #accessing }
GtRemotePhlowDetailsRowSpecification >> name [
	^ name
]

{ #category : #accessing }
GtRemotePhlowDetailsRowSpecification >> name: anObject [
	name := anObject
]

{ #category : #printing }
GtRemotePhlowDetailsRowSpecification >> printOn: aStream [
	super printOn: aStream.
	
	aStream parenthesize: [
		aStream 
			nextPutAll: 'index: ';
			print: self index;
			nextPutAll: '; name: ';
			nextPutAll: (self name ifNil: [ '<missing>' ]) ]
]
