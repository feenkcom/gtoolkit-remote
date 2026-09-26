Class {
	#name : #GtRemotePhlowViewActionTarget,
	#superclass : #GtRemotePhlowActionTarget,
	#instVars : [
		'definingMethodSelector'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtRemotePhlowViewActionTarget class >> forSelector: aSelector [
	^ self new definingMethodSelector: aSelector
]

{ #category : #accessing }
GtRemotePhlowViewActionTarget class >> typeLabel [
	^ 'viewAction'
]

{ #category : #comparing }
GtRemotePhlowViewActionTarget >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ definingMethodSelector = anObject definingMethodSelector
]

{ #category : #serialization }
GtRemotePhlowViewActionTarget >> asDictionaryForExport [
	^ super asDictionaryForExport
		at: 'definingMethodSelector' put: definingMethodSelector;
		yourself
]

{ #category : #accessing }
GtRemotePhlowViewActionTarget >> definingMethodSelector [
	^ definingMethodSelector
]

{ #category : #accessing }
GtRemotePhlowViewActionTarget >> definingMethodSelector: aSelector [
	definingMethodSelector := aSelector
]

{ #category : #comparing }
GtRemotePhlowViewActionTarget >> hash [
	^ self class hash bitXor: definingMethodSelector hash
]

{ #category : #serialization }
GtRemotePhlowViewActionTarget >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	definingMethodSelector := aDictionary at: 'definingMethodSelector'
]

{ #category : #testing }
GtRemotePhlowViewActionTarget >> isForViewDefinedIn: aSymbol [
	^ self definingMethodSelector = aSymbol
]

{ #category : #printing }
GtRemotePhlowViewActionTarget >> printOn: aStream [
	aStream parenthesize: [
		aStream
			nextPutAll: self class typeLabel;
			nextPutAll: ': ';
			print: definingMethodSelector ]
]
