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
		| valueComputation computedObject |
		valueComputation := column isWithIcon 
			ifTrue: [ column iconNameComputation ]
			ifFalse: [ column textComputation ].
		computedObject := column itemComputation 
			cull: anObject cull: rowIndex cull: columnIndex.
		formattedColumnItems 
			at: columnIndex
			put:  (valueComputation
				cull: computedObject cull: rowIndex cull: columnIndex) gtDisplayString].
	^ formattedColumnItems
]
