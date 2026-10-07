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
	^ targetClassName = anObject targetClassName
]

{ #category : #serialization }
GtRemotePhlowForwardActionTarget >> asDictionaryForExport [
	^ super asDictionaryForExport
		at: 'targetClassName' put: targetClassName;
		yourself
]

{ #category : #comparing }
GtRemotePhlowForwardActionTarget >> hash [
	^ self class hash bitXor: targetClassName hash
]

{ #category : #serialization }
GtRemotePhlowForwardActionTarget >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	targetClassName := aDictionary at: 'targetClassName'
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
