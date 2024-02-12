Extension { #name : #GtPhlowTextColumn }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextColumn >> asGtDeclarativeColumnDataType [
	^ GtPhlowDeclarativeListingType text
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextColumn >> updateValue: aCellValue forComputedItem: aComputedItem rowIndex: rowIndex columnIndex: columnIndex [
	| itemText |
	
	itemText := self formatComputation 
		ifNil: [ aComputedItem ]
		ifNotNil: [ :aFormattingComputation |
			aFormattingComputation
				phlowValue: aComputedItem
				withEnoughArguments: { rowIndex . columnIndex } ].

	aCellValue 
		itemText: itemText gtDisplayText.

	^ aCellValue
]
