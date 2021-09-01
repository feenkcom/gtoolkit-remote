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

{ #category : 'api' }
GtRemotePhlowDeclarativeViewColumnedListDataSource >> retriveSpawnedObjectAtRow: aRowIndex column: aColumnIndex [	
	self itemsIterator 
		forElementsFrom: aRowIndex 
		to: aRowIndex 
		withIndexDo: [ :aRowObject :anItemIndex |
			| aColumn aCellObject aSpawnedObject |
			
			aColumn := self phlowView columns at: aColumnIndex.
			aCellObject := aColumn itemComputation value: aRowObject.
			aSpawnedObject := aColumn isSpawningObject
				ifTrue: [ aColumn spawnObjectComputation cull: aCellObject cull: anItemIndex  ]
				ifFalse: [ aCellObject ].
			^ aSpawnedObject ].
	^ nil
]
