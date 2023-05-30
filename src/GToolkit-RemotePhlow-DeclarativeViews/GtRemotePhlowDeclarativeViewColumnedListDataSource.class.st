Class {
	#name : #GtRemotePhlowDeclarativeViewColumnedListDataSource,
	#superclass : #GtRemotePhlowDeclarativeViewListingDataSource,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtRemotePhlowDeclarativeViewColumnedListDataSource >> formatItem: anObject atIndex: rowIndex [
	| phlowColumns columnItems |

	phlowColumns := self phlowView columns.

	columnItems := Array new: phlowColumns size.

	phlowColumns withIndexDo: [ :column :columnIndex | 
		| computedValues |
	
		computedValues := column 
			computeItemValuesFor: anObject
			rowIndex: rowIndex
			columnIndex: columnIndex.
	
		columnItems 
			at: columnIndex
			put: computedValues ].

	^ columnItems collect: [ :anItemValues |
		anItemValues asDictionaryForExport ]
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
				ifTrue: [ aColumn spawnObjectComputation 
					cull: aRowObject cull: anItemIndex  ]
				ifFalse: [ aRowObject ].
			^ aSpawnedObject ].
	^ nil
]
