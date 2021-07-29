Class {
	#name : 'GtPhlowDeclarativeViewListDataSource',
	#superclass : 'GtPhlowDeclarativeViewListingDataSource',
	#category : 'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : 'api' }
GtPhlowDeclarativeViewListDataSource >> formatItem: anObject [ 
	^ (self phlowView itemText value: anObject) gtDisplayString
]
