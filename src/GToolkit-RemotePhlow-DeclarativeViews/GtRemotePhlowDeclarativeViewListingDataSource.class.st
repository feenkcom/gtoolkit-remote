Class {
	#name : 'GtRemotePhlowDeclarativeViewListingDataSource',
	#superclass : 'GtRemotePhlowDeclarativeViewDataSource',
	#instVars : [
		'cachedItems'
	],
	#category : 'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : 'accessing' }
GtRemotePhlowDeclarativeViewListingDataSource >> formatItem: anObject atIndex: anIndex [
	self subclassResponsibility
]

{ #category : 'api' }
GtRemotePhlowDeclarativeViewListingDataSource >> retrieveItems: anItemsCount fromIndex: anIndex [
	| viewItems targetItems formattedItems |
	viewItems := self viewItems.
	targetItems := (viewItems 
			copyFrom: anIndex
			to: ((anIndex + anItemsCount - 1) min: viewItems size)).
	formattedItems := Array new: targetItems size.
	targetItems withIndexDo: [ :each :itemIndex | 
		formattedItems 
			at: itemIndex
			put: (self formatItem: each atIndex: anIndex + itemIndex - 1) ].
	^ formattedItems
]

{ #category : 'api' }
GtRemotePhlowDeclarativeViewListingDataSource >> retrieveTotalItemsCount [
	^ self viewItems size
]

{ #category : 'api' }
GtRemotePhlowDeclarativeViewListingDataSource >> retriveSentItemAt: aSelectionIndex [
	"Answer the raw value at the supplied index"
	
	^ self phlowView transformation 
		transformedValueFrom: (self viewItems at: aSelectionIndex)
		selection: aSelectionIndex
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeViewListingDataSource >> viewItems [
	^ cachedItems ifNil: [ 
		cachedItems := self phlowView itemsBuilder value ]
]
