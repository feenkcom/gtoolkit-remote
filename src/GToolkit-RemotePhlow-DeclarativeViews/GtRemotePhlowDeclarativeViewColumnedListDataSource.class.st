Class {
	#name : #GtRemotePhlowDeclarativeViewColumnedListDataSource,
	#superclass : #GtRemotePhlowDeclarativeViewListingDataSource,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #accessing }
GtRemotePhlowDeclarativeViewColumnedListDataSource >> instantiateNode [
	^ GtRemotePhlowColumnedTreeNode new
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewColumnedListDataSource >> instantiateValueBuilder [
	^ GtRemotePhlowRowBuilder new
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
