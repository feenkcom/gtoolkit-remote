Class {
	#name : #GtRemotePhlowIndexNodeIdentifier,
	#superclass : #GtRemotePhlowNodeIdentifier,
	#instVars : [
		'nodeIndex'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #comparing }
GtRemotePhlowIndexNodeIdentifier >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ self nodeIndex = anObject nodeIndex
]

{ #category : #converting }
GtRemotePhlowIndexNodeIdentifier >> asDictionaryForExport [
	| specificationData |
	specificationData := super asDictionaryForExport.
	specificationData at: 'nodeIndex' put: self nodeIndex.
	^ specificationData
]

{ #category : #printing }
GtRemotePhlowIndexNodeIdentifier >> descriptionOn: aStream [
	aStream print: self nodeIndex
]

{ #category : #comparing }
GtRemotePhlowIndexNodeIdentifier >> hash [
	^ self nodeIndex hash
]

{ #category : #initialization }
GtRemotePhlowIndexNodeIdentifier >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	
	aDictionary
		at: 'nodeIndex' ifPresent: [ :aValue |
			self nodeIndex: aValue ].
]

{ #category : #accessing }
GtRemotePhlowIndexNodeIdentifier >> nodeIndex [
	^ nodeIndex
]

{ #category : #accessing }
GtRemotePhlowIndexNodeIdentifier >> nodeIndex: anObject [
	nodeIndex := anObject
]

{ #category : #printing }
GtRemotePhlowIndexNodeIdentifier >> printOn: aStream [
	super printOn: aStream.
	aStream parenthesize: [
		self descriptionOn: aStream ]
]
