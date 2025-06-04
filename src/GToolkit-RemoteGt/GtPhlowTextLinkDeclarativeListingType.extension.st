Extension { #name : #GtPhlowTextLinkDeclarativeListingType }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextLinkDeclarativeListingType >> createColumnWithSpecification: aColumnSpecification atIndex: aColumnIndex inViewSpecification: aViewSpecification for: aColumnedView [
	| column |
	column := aColumnedView explicitColumn.
	column
		text: [ :aColumnedNode | 
			(aColumnedNode columnValueAt: aColumnIndex) itemText ]
		spawn: [ :anArray :aRowIndex | 
			(aViewSpecification 
				retriveSpawnedObjectAtRow: aRowIndex 
				column: aColumnIndex)asGtBareProxyObject ].
	^ column
]
