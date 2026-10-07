Class {
	#name : #GtRemotePhlowListingViewSelectionItem,
	#superclass : #GtPhlowDeclarativeSpecification,
	#instVars : [
		'nodeIdentifier',
		'selectionIndex'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #testing }
GtRemotePhlowListingViewSelectionItem class >> isAbstract [
	^ self name = #GtRemotePhlowListingViewSelectionItem
]

{ #category : #comparing }
GtRemotePhlowListingViewSelectionItem >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ self nodeIdentifier = anObject nodeIdentifier
		and: [ self selectionIndex = anObject selectionIndex ]
]

{ #category : #converting }
GtRemotePhlowListingViewSelectionItem >> asDictionaryForExport [
	| specificationData |
	specificationData := super asDictionaryForExport.
	specificationData at: 'nodeIdentifier' put: self nodeIdentifier asDictionaryForExport.
	self selectionIndex ifNotNil: [ :anIndex |
		specificationData at: 'selectionIndex' put: anIndex ].
	^ specificationData
]

{ #category : #printing }
GtRemotePhlowListingViewSelectionItem >> description [
	^ String streamContents: [ :aStream |
		self descriptionOn: aStream ]
]

{ #category : #printing }
GtRemotePhlowListingViewSelectionItem >> descriptionOn: aStream [
	self nodeIdentifier descriptionOn: aStream.
	self selectionIndex ifNotNil: [ :anIndex |
		aStream nextPutAll: ' @ '.
		aStream print: anIndex ]
]

{ #category : #comparing }
GtRemotePhlowListingViewSelectionItem >> hash [
	^ self nodeIdentifier hash bitXor: self selectionIndex hash
]

{ #category : #initialization }
GtRemotePhlowListingViewSelectionItem >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	
	aDictionary
		at: 'nodeIdentifier' ifPresent: [ :aDict |
			self nodeIdentifier: (GtRemotePhlowNodeIdentifier fromDictionary: aDict) ].
	aDictionary
		at: 'selectionIndex' ifPresent: [ :aValue |
			self selectionIndex: aValue ].
]

{ #category : #accessing }
GtRemotePhlowListingViewSelectionItem >> nodeIdentifier [
	^ nodeIdentifier
]

{ #category : #accessing }
GtRemotePhlowListingViewSelectionItem >> nodeIdentifier: aNodeIdentifier [
	nodeIdentifier := aNodeIdentifier
]

{ #category : #printing }
GtRemotePhlowListingViewSelectionItem >> printOn: aStream [
	super printOn: aStream.
	aStream parenthesize: [
		self descriptionOn: aStream ]
]

{ #category : #accessing }
GtRemotePhlowListingViewSelectionItem >> selectionIndex [
	^ selectionIndex
]

{ #category : #accessing }
GtRemotePhlowListingViewSelectionItem >> selectionIndex: anInteger [
	selectionIndex := anInteger
]
