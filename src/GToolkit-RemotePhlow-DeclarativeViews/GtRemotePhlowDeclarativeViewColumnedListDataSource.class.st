Class {
	#name : #GtRemotePhlowDeclarativeViewColumnedListDataSource,
	#superclass : #GtRemotePhlowDeclarativeViewListingDataSource,
	#category : 'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtRemotePhlowDeclarativeViewColumnedListDataSource >> formatItem: anObject [
	^ (self phlowView columns 
		withIndexCollect: [ :column :columnIndex | 
			(column rowStencil 
				ifNil: [ 
					column itemComputation 
						phlowValue: anObject 
						withEnoughArguments: { anObject. nil "rowIndex". columnIndex. nil. self. } ]
				ifNotNil: [ :rowStencil |
					rowStencil
						cull: (column itemComputation 
							phlowValue: anObject  
							withEnoughArguments: { anObject . nil "rowIndex" })
						cull: column ]) gtDisplayString ]) asArray 
]
