Extension { #name : #GtPhlowIconNameDeclarativeListingType }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowIconNameDeclarativeListingType >> createColumnWithSpecification: aColumnSpecification atIndex: aColumnIndex inViewSpecification: aViewSpecification for: aColumnedView [

	^ aColumnedView explicitColumn
		iconName: [ :aColumnedNode | 
						(aColumnedNode columnValueAt: aColumnIndex) itemText ];
		yourself
]
