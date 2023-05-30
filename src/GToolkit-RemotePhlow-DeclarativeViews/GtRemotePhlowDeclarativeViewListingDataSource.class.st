Class {
	#name : #GtRemotePhlowDeclarativeViewListingDataSource,
	#superclass : #GtRemotePhlowDeclarativeViewDataSource,
	#instVars : [
		'itemsIterator'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #api }
GtRemotePhlowDeclarativeViewListingDataSource >> flushItemsIterator [
	"Flush the items iterator to force the displayed values to be regenerated"

	itemsIterator := nil.
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewListingDataSource >> formatItem: anObject atIndex: anIndex [
	self subclassResponsibility
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewListingDataSource >> itemsIterator [
	^ itemsIterator ifNil: [ 
		itemsIterator := self phlowView 
			itemsProviderComputation value asGPhlowItemsIterator ]
]

{ #category : #api }
GtRemotePhlowDeclarativeViewListingDataSource >> retrieveItems: anItemsCount fromIndex: startIndex [
	| computedItemValues endIndex |

	computedItemValues := OrderedCollection new: anItemsCount.
	endIndex := startIndex + anItemsCount - 1.
	
	self itemsIterator 
		forElementsFrom: startIndex 
		to: endIndex 
		withIndexDo: [ :anObject :anItemIndex |
			computedItemValues add: (self 
				formatItem: anObject atIndex: anItemIndex)].
	
	^ computedItemValues asArray
]

{ #category : #api }
GtRemotePhlowDeclarativeViewListingDataSource >> retrieveTotalItemsCount [
	^ self itemsIterator totalItemsCount
]

{ #category : #api }
GtRemotePhlowDeclarativeViewListingDataSource >> retriveSentItemAt: aSelectionIndex [
	"Answer the raw value at the supplied index"
	
	self itemsIterator 
		forElementsFrom: aSelectionIndex 
		to: aSelectionIndex 
		withIndexDo: [ :anObject :anItemIndex |
			^ self phlowView transformation 
				transformedValueFrom: anObject
				selection: aSelectionIndex ].
	^ nil
]
