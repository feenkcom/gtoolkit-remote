Class {
	#name : #GtRemotePhlowDeclarativeViewListDataSource,
	#superclass : #GtRemotePhlowDeclarativeViewListingDataSource,
	#category : 'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #api }
GtRemotePhlowDeclarativeViewListDataSource >> formatItem: anObject atIndex: rowIndex [
	^ (self phlowView itemComputation cull: anObject cull: rowIndex) gtDisplayString
]
