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
		| computedObject aValueString |
	
		computedObject := column itemComputation 
			cull: anObject cull: rowIndex cull: columnIndex.
	
		aValueString := computedObject gtDisplayString.
	
		formattedColumnItems 
			at: columnIndex
			put: aValueString ].

	^ formattedColumnItems
]

{ #category : #api }
GtRemotePhlowDeclarativeViewColumnedListDataSource >> retriveSpawnedObjectAtRow: aRowIndex column: aColumnIndex [	
	self itemsIterator 
		forElementsFrom: aRowIndex 
		to: aRowIndex 
		withIndexDo: [ :aRowObject :anItemIndex |
			| aColumn aSpawnedObject |
			
			aColumn := self phlowView columns at: aColumnIndex.
			aSpawnedObject := aColumn isSpawningObject
				ifTrue: [ aColumn spawnObjectComputation cull: aRowObject cull: anItemIndex  ]
				ifFalse: [ aRowObject ].
			^ aSpawnedObject ].
	^ nil
]
