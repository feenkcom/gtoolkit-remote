Class {
	#name : #GtRemotePhlowPathNodeIdentifier,
	#superclass : #GtRemotePhlowNodeIdentifier,
	#instVars : [
		'nodeIndexPath'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #comparing }
GtRemotePhlowPathNodeIdentifier >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ self nodeIndexPath = anObject nodeIndexPath
]

{ #category : #converting }
GtRemotePhlowPathNodeIdentifier >> asDictionaryForExport [
	| specificationData |
	specificationData := super asDictionaryForExport.
	specificationData at: 'nodeIndexPath' put: self nodeIndexPath.
	^ specificationData
]

{ #category : #printing }
GtRemotePhlowPathNodeIdentifier >> descriptionOn: aStream [
	aStream print: self nodeIndexPath
]

{ #category : #comparing }
GtRemotePhlowPathNodeIdentifier >> hash [
	^ self nodeIndexPath hash
]

{ #category : #initialization }
GtRemotePhlowPathNodeIdentifier >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	
	aDictionary
		at: 'nodeIndexPath' ifPresent: [ :aValue |
			self nodeIndexPath: aValue ].
]

{ #category : #accessing }
GtRemotePhlowPathNodeIdentifier >> nodeIndexPath [
	^ nodeIndexPath
]

{ #category : #accessing }
GtRemotePhlowPathNodeIdentifier >> nodeIndexPath: anObject [
	nodeIndexPath := anObject
]

{ #category : #printing }
GtRemotePhlowPathNodeIdentifier >> printOn: aStream [
	super printOn: aStream.
	aStream parenthesize: [
		self descriptionOn: aStream ]
]
