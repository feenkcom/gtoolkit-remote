Extension { #name : #GtPhlowTextDeclarativeListingType }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextDeclarativeListingType >> createColumnWithSpecification: aColumnSpecification atIndex: aColumnIndex inViewSpecification: aViewSpecification for: aColumnedView [

	^ aColumnedView textColumn
		format: [ :aColumnedNode | 
			(aColumnedNode columnValueAt: aColumnIndex) itemText ];
		yourself
]
