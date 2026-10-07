Class {
	#name : #GtRemotePhlowCompositeActionTarget,
	#superclass : #GtRemotePhlowActionTarget,
	#instVars : [
		'targets'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtRemotePhlowCompositeActionTarget class >> new [
	^ super new initialize
]

{ #category : #accessing }
GtRemotePhlowCompositeActionTarget class >> typeLabel [
	^ 'composite'
]

{ #category : #composing }
GtRemotePhlowCompositeActionTarget >> , aTarget [
	^ GtRemotePhlowCompositeActionTarget new
		targets: (targets copyWith: aTarget)
]

{ #category : #comparing }
GtRemotePhlowCompositeActionTarget >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ targets = anObject targets
]

{ #category : #actions }
GtRemotePhlowCompositeActionTarget >> actionsForObject: anObject do: aBlock [
	targets do: [ :eachTarget |
		eachTarget actionsForObject: anObject do: aBlock ]
]

{ #category : #serialization }
GtRemotePhlowCompositeActionTarget >> asDictionaryForExport [
	^ super asDictionaryForExport
		at: 'targets' put: (targets collect: [ :each | each asDictionaryForExport ]);
		yourself
]

{ #category : #printing }
GtRemotePhlowCompositeActionTarget >> descriptionOn: aStream [
	super descriptionOn: aStream.
	aStream nextPutAll: ': '.
	targets
		do: [ :each | aStream print: each ]
		separatedBy: [ aStream nextPutAll: ', ' ]
]

{ #category : #comparing }
GtRemotePhlowCompositeActionTarget >> hash [
	^ self class hash bitXor: targets hash
]

{ #category : #initialization }
GtRemotePhlowCompositeActionTarget >> initialize [
	super initialize.
	targets := #()
]

{ #category : #serialization }
GtRemotePhlowCompositeActionTarget >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	targets := (aDictionary at: 'targets') collect: [ :each |
		GtPhlowDeclarativeSpecification fromDictionary: each ]
]

{ #category : #testing }
GtRemotePhlowCompositeActionTarget >> isForTarget: aTarget [
	^ targets anySatisfy: [ :each | each isForTarget: aTarget ]
]

{ #category : #testing }
GtRemotePhlowCompositeActionTarget >> isForViewDefinedIn: aSymbol [
	^ self targets anySatisfy: [ :eachTarget | 
		eachTarget isForViewDefinedIn: aSymbol ]
]

{ #category : #accessing }
GtRemotePhlowCompositeActionTarget >> targets [
	^ targets
]

{ #category : #accessing }
GtRemotePhlowCompositeActionTarget >> targets: anArray [
	targets := anArray
]

{ #category : #enumerating }
GtRemotePhlowCompositeActionTarget >> targetsDo: aBlock [
	targets do: [ :each | each targetsDo: aBlock ]
]
