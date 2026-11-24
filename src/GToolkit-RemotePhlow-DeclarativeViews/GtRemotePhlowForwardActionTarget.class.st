Class {
	#name : #GtRemotePhlowForwardActionTarget,
	#superclass : #GtRemotePhlowActionTarget,
	#instVars : [
		'targetClassName'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtRemotePhlowForwardActionTarget class >> forClassName: aClassName [
	^ self new targetClassName: aClassName
]

{ #category : #accessing }
GtRemotePhlowForwardActionTarget class >> typeLabel [
	^ 'forwardAction'
]

{ #category : #comparing }
GtRemotePhlowForwardActionTarget >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	"The class name is a String or a Symbol, depending on the side that wrote it"
	^ targetClassName sameContentAs: anObject targetClassName
]

{ #category : #serialization }
GtRemotePhlowForwardActionTarget >> asDictionaryForExport [
	^ super asDictionaryForExport
		at: 'targetClassName' put: targetClassName;
		yourself
]

{ #category : #comparing }
GtRemotePhlowForwardActionTarget >> hash [
	^ self class hash bitXor: targetClassName asString hash
]

{ #category : #serialization }
GtRemotePhlowForwardActionTarget >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	"A class name, also when the other side sent it as a String"
	targetClassName := (aDictionary at: 'targetClassName') ifNotNil: [ :aName | aName asSymbol ]
]

{ #category : #printing }
GtRemotePhlowForwardActionTarget >> printOn: aStream [
	aStream parenthesize: [
		aStream
			nextPutAll: self class typeLabel;
			nextPutAll: ': ';
			nextPutAll: targetClassName ]
]

{ #category : #accessing }
GtRemotePhlowForwardActionTarget >> targetClassName [
	^ targetClassName
]

{ #category : #accessing }
GtRemotePhlowForwardActionTarget >> targetClassName: aClassName [
	targetClassName := aClassName
]
