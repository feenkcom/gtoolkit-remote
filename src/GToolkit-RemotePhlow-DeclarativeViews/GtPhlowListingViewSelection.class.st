Class {
	#name : #GtPhlowListingViewSelection,
	#superclass : #GtPhlowDeclarativeSpecification,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtPhlowListingViewSelection class >> forMultipleListIdentifiers: aCollectionOfListNodeIdentifiers [
	^ GtPhlowListingViewMultipleListIndexSelection new
		selectionIdentifiers: aCollectionOfListNodeIdentifiers
]

{ #category : #'instance creation' }
GtPhlowListingViewSelection class >> forMultipleListIndexes: aCollectionOfIntegers [
	^ self forMultipleListIdentifiers: (aCollectionOfIntegers collect: [ :each |
		GtRemotePhlowNodeIdentifier forListIndex: each ])
]

{ #category : #'instance creation' }
GtPhlowListingViewSelection class >> forMultipleTreeIdentifiers: aCollectionOfTreeNodeIdentifiers [
	^ GtPhlowListingViewMultipleTreeIndexSelection new
		selectionIdentifiers: aCollectionOfTreeNodeIdentifiers
]

{ #category : #'instance creation' }
GtPhlowListingViewSelection class >> forMultipleTreePaths: aCollectionOfArrays [
	^ self forMultipleTreeIdentifiers: (aCollectionOfArrays collect: [ :each |
		GtRemotePhlowNodeIdentifier forTreePath: each ])
]

{ #category : #'instance creation' }
GtPhlowListingViewSelection class >> forSingleListIdentifier: aListNodeIdentifier [
	^ GtPhlowListingViewSingleListIndexSelection new
		selectionIdentifier: aListNodeIdentifier
]

{ #category : #'instance creation' }
GtPhlowListingViewSelection class >> forSingleListIndex: anInteger [
	^ self forSingleListIdentifier: (GtRemotePhlowNodeIdentifier forListIndex: anInteger)
]

{ #category : #'instance creation' }
GtPhlowListingViewSelection class >> forSingleTreeIdentifier: aTreeNodeIdentifier [
	^ GtPhlowListingViewSingleTreeIndexSelection new
		selectionIdentifier: aTreeNodeIdentifier
]

{ #category : #'instance creation' }
GtPhlowListingViewSelection class >> forSingleTreePath: anArray [
	^ self forSingleTreeIdentifier: (GtRemotePhlowNodeIdentifier forTreePath: anArray)
]
