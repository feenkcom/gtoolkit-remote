Class {
	#name : #GtRemotePhlowDeclarativeViewColumnedListDataSource,
	#superclass : #GtRemotePhlowDeclarativeViewListingDataSource,
	#category : 'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtRemotePhlowDeclarativeViewColumnedListDataSource >> formatItem: anObject atIndex: rowIndex [
	| phlowColumns formattedColumnItems |
	phlowColumns := self phlowView columns.
	formattedColumnItems := Array new: phlowColumns size.
	phlowColumns withIndexDo: [ :column :columnIndex | 
		formattedColumnItems 
			at:columnIndex
			put: (column itemComputation 
				cull: anObject cull: rowIndex cull: columnIndex) gtDisplayString ].
	^ formattedColumnItems
]
