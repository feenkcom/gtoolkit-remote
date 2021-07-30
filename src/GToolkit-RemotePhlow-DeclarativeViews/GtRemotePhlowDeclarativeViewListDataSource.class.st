Class {
	#name : 'GtRemotePhlowDeclarativeViewListDataSource',
	#superclass : 'GtRemotePhlowDeclarativeViewListingDataSource',
	#category : 'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : 'api' }
GtRemotePhlowDeclarativeViewListDataSource >> formatItem: anObject [ 
	^ (self phlowView itemText value: anObject) gtDisplayString
]
