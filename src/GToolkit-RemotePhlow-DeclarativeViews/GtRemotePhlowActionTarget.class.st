Class {
	#name : #GtRemotePhlowActionTarget,
	#superclass : #GtPhlowDeclarativeSpecification,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #converting }
GtRemotePhlowActionTarget class >> asPhlowTarget [
	^ self new
]

{ #category : #accessing }
GtRemotePhlowActionTarget class >> default [
	^ self new
]

{ #category : #testing }
GtRemotePhlowActionTarget class >> isAbstract [
	^ self name = #GtRemotePhlowActionTarget
]

{ #category : #composing }
GtRemotePhlowActionTarget >> + aTarget [
	^ self , aTarget
]

{ #category : #composing }
GtRemotePhlowActionTarget >> , aTarget [
	^ GtRemotePhlowCompositeActionTarget new
		targets: { self . aTarget }
]

{ #category : #comparing }
GtRemotePhlowActionTarget >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ true
]

{ #category : #actions }
GtRemotePhlowActionTarget >> actionsForObject: anObject do: aBlock [
	anObject gtDeclarativePhlowActions do: [ :anAction |
		(anAction target notNil and: [
			anAction target isForTarget: self ])
				ifTrue: [ aBlock value: anAction ] ]
]

{ #category : #serialization }
GtRemotePhlowActionTarget >> asDictionaryForExport [
	^ super asDictionaryForExport
]

{ #category : #converting }
GtRemotePhlowActionTarget >> asLocalPhlowTarget [
	^ self
]

{ #category : #converting }
GtRemotePhlowActionTarget >> asPhlowTarget [
	^ self
]

{ #category : #converting }
GtRemotePhlowActionTarget >> asRemotePhlowActionTarget [
	^ self
]

{ #category : #actions }
GtRemotePhlowActionTarget >> contextPhlowActionsForObject: anObject [
	^ (self phlowActionsForObject: anObject)
		collect: [ :each | each asItemBoundActionToItem: anObject viewSelection: nil ]
]

{ #category : #converting }
GtRemotePhlowActionTarget >> default [
	^ self
]

{ #category : #printing }
GtRemotePhlowActionTarget >> descriptionOn: aStream [
	aStream nextPutAll: self class typeLabel
]

{ #category : #comparing }
GtRemotePhlowActionTarget >> hash [
	^ self class hash
]

{ #category : #serialization }
GtRemotePhlowActionTarget >> initializeFromJSONDictionary: aDictionary [
]

{ #category : #testing }
GtRemotePhlowActionTarget >> isForTarget: aTarget [
	^ self = aTarget asPhlowTarget
]

{ #category : #testing }
GtRemotePhlowActionTarget >> isForViewDefinedIn: aSymbol [
	^ false
]

{ #category : #actions }
GtRemotePhlowActionTarget >> phlowActionsForObject: anObject [
	^ Array streamContents: [ :aStream |
		self actionsForObject: anObject do: [ :anAction |
			aStream nextPut: anAction ] ]
]

{ #category : #printing }
GtRemotePhlowActionTarget >> printOn: aStream [
	super printOn: aStream.
	aStream parenthesize: [
		self descriptionOn: aStream ]
]

{ #category : #enumerating }
GtRemotePhlowActionTarget >> targetsDo: aBlock [
	aBlock value: self
]
