Extension { #name : #GtPhlowIconNameColumn }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowIconNameColumn >> updateValue: aCellValue forComputedItem: aComputedItem rowIndex: rowIndex columnIndex: columnIndex [
	| iconName |
	
	iconName := self iconNameComputation 
		ifNil: [ aComputedItem ]
		ifNotNil: [ :anIconNameComputation |
			anIconNameComputation
				phlowValue: aComputedItem
				withEnoughArguments: { rowIndex . columnIndex } ].

	aCellValue 
		itemText: iconName gtDisplayString asSymbol.

	^ aCellValue
]
