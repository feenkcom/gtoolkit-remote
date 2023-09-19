Extension { #name : #GtPhlowNumberDeclarativeListingType }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowNumberDeclarativeListingType >> createColumnWithSpecification: aColumnSpecification atIndex: aColumnIndex inViewSpecification: aViewSpecification for: aColumnedView [

	^ aColumnedView numberColumn
		format: [ :aColumnedNode | 
			(aColumnedNode columnValueAt: aColumnIndex) itemText ];
		yourself
]
