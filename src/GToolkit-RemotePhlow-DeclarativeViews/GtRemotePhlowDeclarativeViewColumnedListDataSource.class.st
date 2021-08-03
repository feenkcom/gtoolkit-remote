Class {
	#name : 'GtRemotePhlowDeclarativeViewColumnedListDataSource',
	#superclass : 'GtRemotePhlowDeclarativeViewListingDataSource',
	#category : 'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : 'instance creation' }
GtRemotePhlowDeclarativeViewColumnedListDataSource >> formatItem: anObject atIndex: rowIndex [
	| phlowColumns formattedColumnItems |
	phlowColumns := self phlowView columns.
	formattedColumnItems := Array new: phlowColumns size.
	phlowColumns withIndexDo: [ :column :columnIndex | 
		| valueComputation |
		valueComputation := column isWithIcon 
			ifTrue: [ column iconNameComputation ]
			ifFalse: [ column itemComputation ].
		formattedColumnItems 
			at: columnIndex
			put:  (valueComputation
				cull: anObject cull: rowIndex cull: columnIndex) gtDisplayString].
	^ formattedColumnItems
]
