Class {
	#name : #GtRemotePhlowDeclarativeViewColumnedListDataSource,
	#superclass : #GtRemotePhlowDeclarativeViewListingDataSource,
	#category : 'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtRemotePhlowDeclarativeViewColumnedListDataSource >> formatItem: anObject atIndex: rowIndex [
	^ (self phlowView columns 
		withIndexCollect: [ :column :columnIndex | 
			(column itemComputation 
				cull: anObject cull: rowIndex cull: columnIndex) gtDisplayString ]) asArray
]
