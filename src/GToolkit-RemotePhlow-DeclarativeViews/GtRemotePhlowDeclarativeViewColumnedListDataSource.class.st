Class {
	#name : 'GtRemotePhlowDeclarativeViewColumnedListDataSource',
	#superclass : 'GtRemotePhlowDeclarativeViewListingDataSource',
	#category : 'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : 'instance creation' }
GtRemotePhlowDeclarativeViewColumnedListDataSource >> formatItem: anObject atIndex: rowIndex [
	^ (self phlowView columns 
		withIndexCollect: [ :column :columnIndex | 
			(column rowStencil 
				ifNil: [ 
					column itemComputation 
						phlowValue: anObject 
						withEnoughArguments: { anObject. rowIndex. columnIndex. nil. self. } ]
				ifNotNil: [ :rowStencil |
					rowStencil
						cull: (column itemComputation 
							phlowValue: anObject  
							withEnoughArguments: { anObject . rowIndex })
						cull: column ]) gtDisplayString ]) asArray 
]
