Class {
	#name : #GtRemotePhlowCompositeNodeIdentifier,
	#superclass : #GtRemotePhlowNodeIdentifier,
	#instVars : [
		'nodeIdentifiers'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #comparing }
GtRemotePhlowCompositeNodeIdentifier >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ self nodeIdentifiers = anObject nodeIdentifiers
]

{ #category : #converting }
GtRemotePhlowCompositeNodeIdentifier >> asDictionaryForExport [
	| specificationData |
	specificationData := super asDictionaryForExport.
	specificationData at: 'nodeIdentifiers' put: (self nodeIdentifiers collect: [ :each | each asDictionaryForExport ]).
	^ specificationData
]

{ #category : #printing }
GtRemotePhlowCompositeNodeIdentifier >> descriptionOn: aStream [
	self nodeIdentifiers 
		do: [ :each | each descriptionOn: aStream ]
		separatedBy: [ aStream nextPutAll: ', ' ]
]

{ #category : #comparing }
GtRemotePhlowCompositeNodeIdentifier >> hash [
	^ self nodeIdentifiers hash
]

{ #category : #initialization }
GtRemotePhlowCompositeNodeIdentifier >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	
	aDictionary
		at: 'nodeIdentifiers' ifPresent: [ :anArray |
			self nodeIdentifiers: (anArray collect: [ :each |
				GtRemotePhlowNodeIdentifier fromDictionary: each ]) ].
]

{ #category : #testing }
GtRemotePhlowCompositeNodeIdentifier >> isCompositeNodeIdentifier [
	^ true
]

{ #category : #accessing }
GtRemotePhlowCompositeNodeIdentifier >> nodeIdentifiers [
	^ nodeIdentifiers ifNil: [ nodeIdentifiers := #() ]
]

{ #category : #accessing }
GtRemotePhlowCompositeNodeIdentifier >> nodeIdentifiers: anObject [
	nodeIdentifiers := anObject
]

{ #category : #enumerating }
GtRemotePhlowCompositeNodeIdentifier >> nodeIdentifiersDo: aBlock [
	nodeIdentifiers do: aBlock
]

{ #category : #printing }
GtRemotePhlowCompositeNodeIdentifier >> printOn: aStream [
	super printOn: aStream.
	aStream parenthesize: [
		self descriptionOn: aStream ]
]
