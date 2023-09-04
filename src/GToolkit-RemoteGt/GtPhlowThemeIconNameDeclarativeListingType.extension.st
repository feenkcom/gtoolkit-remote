Extension { #name : #GtPhlowThemeIconNameDeclarativeListingType }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowThemeIconNameDeclarativeListingType >> createColumnWithSpecification: aColumnSpecification atIndex: aColumnIndex inViewSpecification: aViewSpecification for: aColumnedView [

	^ aColumnedView iconNameColumn
		iconName: [ :aColumnedNode | 
			(aColumnedNode columnValueAt: aColumnIndex) itemText ];
		yourself
]
