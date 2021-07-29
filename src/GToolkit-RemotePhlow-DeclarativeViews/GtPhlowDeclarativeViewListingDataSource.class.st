Class {
	#name : 'GtPhlowDeclarativeViewListingDataSource',
	#superclass : 'GtPhlowDeclarativeViewDataSource',
	#instVars : [
		'cachedItems'
	],
	#category : 'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : 'accessing' }
GtPhlowDeclarativeViewListingDataSource >> formatItem: anObject [ 
	self subclassResponsibility
]

{ #category : 'api' }
GtPhlowDeclarativeViewListingDataSource >> retrieveItems: anItemsCount fromIndex: anIndex [
	| viewItems |
	viewItems := self viewItems.
	^ ((viewItems 
			copyFrom: anIndex
			to: ((anIndex + anItemsCount - 1) min: viewItems size))
	 			collect: [ :each | 
					self formatItem: each ]) asArray
]

{ #category : 'api' }
GtPhlowDeclarativeViewListingDataSource >> retrieveTotalItemsCount [
	^ self viewItems size
]

{ #category : 'api' }
GtPhlowDeclarativeViewListingDataSource >> retriveSentItemAtIndex: aSelectionIndex [
	^ self viewItems at: aSelectionIndex
]

{ #category : 'accessing' }
GtPhlowDeclarativeViewListingDataSource >> viewItems [
	^ cachedItems ifNil: [ 
		cachedItems := self phlowView itemsBuilder value ]
]
