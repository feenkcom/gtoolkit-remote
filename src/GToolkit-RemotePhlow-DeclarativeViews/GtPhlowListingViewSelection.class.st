Class {
	#name : #GtPhlowListingViewSelection,
	#superclass : #GtPhlowDeclarativeSpecification,
	#instVars : [
		'nodeIdentifier',
		'selectionIndex'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtPhlowListingViewSelection class >> forMultipleListIdentifiers: aCollectionOfListNodeIdentifiers [
	^ GtPhlowListingViewListSelection new
		nodeIdentifier: (GtRemotePhlowCompositeNodeIdentifier new
			nodeIdentifiers: aCollectionOfListNodeIdentifiers)
]

{ #category : #'instance creation' }
GtPhlowListingViewSelection class >> forMultipleListIndexes: aCollectionOfIntegers [
	^ self forMultipleListIdentifiers: (aCollectionOfIntegers collect: [ :each |
		GtRemotePhlowNodeIdentifier forListIndex: each ])
]

{ #category : #'instance creation' }
GtPhlowListingViewSelection class >> forMultipleTreeIdentifiers: aCollectionOfTreeNodeIdentifiers [
	^ GtPhlowListingViewTreeSelection new
		nodeIdentifier: (GtRemotePhlowCompositeNodeIdentifier new
			nodeIdentifiers: aCollectionOfTreeNodeIdentifiers)
]

{ #category : #'instance creation' }
GtPhlowListingViewSelection class >> forMultipleTreePaths: aCollectionOfArrays [
	^ self forMultipleTreeIdentifiers: (aCollectionOfArrays collect: [ :each |
		GtRemotePhlowNodeIdentifier forTreePath: each ])
]

{ #category : #'instance creation' }
GtPhlowListingViewSelection class >> forSingleListIdentifier: aListNodeIdentifier [
	^ GtPhlowListingViewListSelection new
		nodeIdentifier: aListNodeIdentifier
]

{ #category : #'instance creation' }
GtPhlowListingViewSelection class >> forSingleListIndex: anInteger [
	^ self forSingleListIdentifier: (GtRemotePhlowNodeIdentifier forListIndex: anInteger)
]

{ #category : #'instance creation' }
GtPhlowListingViewSelection class >> forSingleTreeIdentifier: aTreeNodeIdentifier [
	^ GtPhlowListingViewTreeSelection new
		nodeIdentifier: aTreeNodeIdentifier
]

{ #category : #'instance creation' }
GtPhlowListingViewSelection class >> forSingleTreePath: anArray [
	^ self forSingleTreeIdentifier: (GtRemotePhlowNodeIdentifier forTreePath: anArray)
]

{ #category : #testing }
GtPhlowListingViewSelection class >> isAbstract [
	^ self name = #GtPhlowListingViewSelection
]

{ #category : #comparing }
GtPhlowListingViewSelection >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ self nodeIdentifier = anObject nodeIdentifier
		and: [ self selectionIndex = anObject selectionIndex ]
]

{ #category : #converting }
GtPhlowListingViewSelection >> asDictionaryForExport [
	| specificationData |
	specificationData := super asDictionaryForExport.
	specificationData at: 'nodeIdentifier' put: self nodeIdentifier asDictionaryForExport.
	self selectionIndex ifNotNil: [ :anIndex |
		specificationData at: 'selectionIndex' put: anIndex ].
	^ specificationData
]

{ #category : #printing }
GtPhlowListingViewSelection >> description [
	^ String streamContents: [ :aStream |
		self descriptionOn: aStream ]
]

{ #category : #printing }
GtPhlowListingViewSelection >> descriptionOn: aStream [
	self nodeIdentifier descriptionOn: aStream.
	self selectionIndex ifNotNil: [ :anIndex |
		aStream nextPutAll: ' @ '.
		aStream print: anIndex ]
]

{ #category : #comparing }
GtPhlowListingViewSelection >> hash [
	^ self nodeIdentifier hash bitXor: self selectionIndex hash
]

{ #category : #initialization }
GtPhlowListingViewSelection >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	
	aDictionary
		at: 'nodeIdentifier' ifPresent: [ :aDict |
			self nodeIdentifier: (GtRemotePhlowNodeIdentifier fromDictionary: aDict) ].
	aDictionary
		at: 'selectionIndex' ifPresent: [ :anArray |
			self selectionIndex: anArray ].
]

{ #category : #testing }
GtPhlowListingViewSelection >> isMultipleSelection [
	^ self nodeIdentifier isCompositeNodeIdentifier
]

{ #category : #accessing }
GtPhlowListingViewSelection >> nodeIdentifier [
	^ nodeIdentifier
]

{ #category : #accessing }
GtPhlowListingViewSelection >> nodeIdentifier: aNodeIdentifier [
	nodeIdentifier := aNodeIdentifier
]

{ #category : #enumerating }
GtPhlowListingViewSelection >> nodeIdentifiersDo: aBlock [
	self nodeIdentifier nodeIdentifiersDo: aBlock
]

{ #category : #printing }
GtPhlowListingViewSelection >> printOn: aStream [
	super printOn: aStream.
	aStream parenthesize: [
		self descriptionOn: aStream ]
]

{ #category : #accessing }
GtPhlowListingViewSelection >> selectionIndex [
	^ selectionIndex
]

{ #category : #accessing }
GtPhlowListingViewSelection >> selectionIndex: anArrayOfIntegers [
	selectionIndex := anArrayOfIntegers
]
