Extension { #name : #GtPhlowNumberColumn }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowNumberColumn >> asGtDeclarativeColumnDataType [
	^ GtPhlowDeclarativeListingType number
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowNumberColumn >> updateValue: aCellValue forComputedItem: aComputedItem rowIndex: rowIndex columnIndex: columnIndex [
	| itemText |
	
	itemText := self formatComputation 
		ifNil: [ aComputedItem ]
		ifNotNil: [ :aFormattingComputation |
			aFormattingComputation
				phlowValue: aComputedItem
				withEnoughArguments: { rowIndex . columnIndex } ].

	aCellValue 
		itemText: (self phlowTextOrStringFrom: itemText).
]
