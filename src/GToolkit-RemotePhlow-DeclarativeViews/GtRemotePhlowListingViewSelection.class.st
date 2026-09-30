Class {
	#name : #GtRemotePhlowListingViewSelection,
	#superclass : #GtPhlowDeclarativeSpecification,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtRemotePhlowListingViewSelection class >> forMultipleListIdentifiers: aCollectionOfListNodeIdentifiers [
	^ GtRemotePhlowListingViewMultipleSelection new
		selectionItems: (aCollectionOfListNodeIdentifiers collect: [ :each |
			GtRemotePhlowListingViewListSelectionItem new
				nodeIdentifier: each ])
]

{ #category : #'instance creation' }
GtRemotePhlowListingViewSelection class >> forMultipleListIndexes: aCollectionOfIntegers [
	^ GtRemotePhlowListingViewMultipleSelection new
		selectionItems: (aCollectionOfIntegers collect: [ :each |
			GtRemotePhlowListingViewListSelectionItem new
				nodeIdentifier: (GtRemotePhlowNodeIdentifier forListIndex: each) ])
]

{ #category : #'instance creation' }
GtRemotePhlowListingViewSelection class >> forMultipleTreeIdentifiers: aCollectionOfTreeNodeIdentifiers [
	^ GtRemotePhlowListingViewMultipleSelection new
		selectionItems: (aCollectionOfTreeNodeIdentifiers collect: [ :each |
			GtRemotePhlowListingViewTreeSelectionItem new
				nodeIdentifier: each ])
]

{ #category : #'instance creation' }
GtRemotePhlowListingViewSelection class >> forMultipleTreePaths: aCollectionOfArrays [
	^ GtRemotePhlowListingViewMultipleSelection new
		selectionItems: (aCollectionOfArrays collect: [ :each |
			GtRemotePhlowListingViewTreeSelectionItem new
				nodeIdentifier: (GtRemotePhlowNodeIdentifier forTreePath: each) ])
]

{ #category : #'instance creation' }
GtRemotePhlowListingViewSelection class >> forSingleListIdentifier: aListNodeIdentifier [
	^ GtRemotePhlowListingViewSingleSelection new
		selectionItem: (GtRemotePhlowListingViewListSelectionItem new
			nodeIdentifier: aListNodeIdentifier)
]

{ #category : #'instance creation' }
GtRemotePhlowListingViewSelection class >> forSingleListIndex: anInteger [
	^ GtRemotePhlowListingViewSingleSelection new
		selectionItem: (GtRemotePhlowListingViewListSelectionItem new
			nodeIdentifier: (GtRemotePhlowNodeIdentifier forListIndex: anInteger))
]

{ #category : #'instance creation' }
GtRemotePhlowListingViewSelection class >> forSingleListIndex: anInteger selectionIndex: aSelectionIndex [
	^ GtRemotePhlowListingViewSingleSelection new
		selectionItem: (GtRemotePhlowListingViewListSelectionItem new
			nodeIdentifier: (GtRemotePhlowNodeIdentifier forListIndex: anInteger);
			selectionIndex: aSelectionIndex)
]

{ #category : #'instance creation' }
GtRemotePhlowListingViewSelection class >> forSingleTreeIdentifier: aTreeNodeIdentifier [
	^ GtRemotePhlowListingViewSingleSelection new
		selectionItem: (GtRemotePhlowListingViewTreeSelectionItem new
			nodeIdentifier: aTreeNodeIdentifier)
]

{ #category : #'instance creation' }
GtRemotePhlowListingViewSelection class >> forSingleTreePath: anArray [
	^ GtRemotePhlowListingViewSingleSelection new
		selectionItem: (GtRemotePhlowListingViewTreeSelectionItem new
			nodeIdentifier: (GtRemotePhlowNodeIdentifier forTreePath: anArray))
]

{ #category : #testing }
GtRemotePhlowListingViewSelection class >> isAbstract [
	^ self name = #GtRemotePhlowListingViewSelection
]

{ #category : #comparing }
GtRemotePhlowListingViewSelection >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ self selectionItems = anObject selectionItems
]

{ #category : #converting }
GtRemotePhlowListingViewSelection >> asDictionaryForExport [
	^ super asDictionaryForExport
]

{ #category : #printing }
GtRemotePhlowListingViewSelection >> descriptionOn: aStream [
	self selectionItems 
		do: [ :each | each descriptionOn: aStream ]
		separatedBy: [ aStream nextPutAll: ', ' ]
]

{ #category : #'gt - extensions' }
GtRemotePhlowListingViewSelection >> gtViewSelectionItemsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Selection items';
		items: [ self selectionItems ];
		column: 'Index' text: [ :each | each selectionIndex ] width: 80;
		column: 'Node identifier' text: [ :each | each nodeIdentifier ]
]

{ #category : #comparing }
GtRemotePhlowListingViewSelection >> hash [
	^ self selectionItems hash
]

{ #category : #initialization }
GtRemotePhlowListingViewSelection >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary
]

{ #category : #testing }
GtRemotePhlowListingViewSelection >> isMultipleSelection [
	^ false
]

{ #category : #enumerating }
GtRemotePhlowListingViewSelection >> nodeIdentifiersDo: aBlock [
	self selectionItemsDo: [ :each | aBlock value: each nodeIdentifier ]
]

{ #category : #printing }
GtRemotePhlowListingViewSelection >> printOn: aStream [
	super printOn: aStream.
	aStream parenthesize: [
		self descriptionOn: aStream ]
]

{ #category : #accessing }
GtRemotePhlowListingViewSelection >> selectionIndex [
	^ self selectionIndices
]

{ #category : #accessing }
GtRemotePhlowListingViewSelection >> selectionIndices [
	^ Array withAll: (self selectionItems 
			collect: [ :each | each selectionIndex ])
]

{ #category : #accessing }
GtRemotePhlowListingViewSelection >> selectionItems [
	^ self subclassResponsibility
]

{ #category : #enumerating }
GtRemotePhlowListingViewSelection >> selectionItemsDo: aBlock [
	self selectionItems do: aBlock
]

{ #category : #accessing }
GtRemotePhlowListingViewSelection >> size [
	^ self subclassResponsibility
]
