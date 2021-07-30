Class {
	#name : 'GtRemotePhlowDeclarativeViewListingDataSource',
	#superclass : 'GtRemotePhlowDeclarativeViewDataSource',
	#instVars : [
		'cachedItems'
	],
	#category : 'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : 'accessing' }
GtRemotePhlowDeclarativeViewListingDataSource >> formatItem: anObject [ 
	self subclassResponsibility
]

{ #category : 'api' }
GtRemotePhlowDeclarativeViewListingDataSource >> retrieveItems: anItemsCount fromIndex: anIndex [
	| viewItems |
	viewItems := self viewItems.
	^ ((viewItems 
			copyFrom: anIndex
			to: ((anIndex + anItemsCount - 1) min: viewItems size))
	 			collect: [ :each | 
					self formatItem: each ]) asArray
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
