Class {
	#name : 'GtRemotePhlowDeclarativeViewListDataSource',
	#superclass : 'GtRemotePhlowDeclarativeViewListingDataSource',
	#category : 'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : 'api' }
GtRemotePhlowDeclarativeViewListDataSource >> formatItem: anObject atIndex: rowIndex [
	^ (self phlowView
		asRemotePhlowDeclarativeValueComputationFor: anObject
		index: rowIndex) computeValue gtDisplayString
]
