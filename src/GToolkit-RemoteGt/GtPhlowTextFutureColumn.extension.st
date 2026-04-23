Extension { #name : #GtPhlowTextFutureColumn }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextFutureColumn >> asGtDeclarativeColumnDataType [
	self flag: #TODO.
	^ GtPhlowDeclarativeListingType text
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextFutureColumn >> updateValue: aCellValue forComputedItem: aComputedItem rowIndex: rowIndex columnIndex: columnIndex [
	| itemText |
	self flag: #TODO.
	true
		ifFalse: [ aCellValue itemText: ''.
			^ aCellValue ].

	itemText := self formatComputation
			ifNil: [ aComputedItem ]
			ifNotNil: [ :aFormattingComputation | 
				aFormattingComputation
					phlowValue: aComputedItem
					withEnoughArguments: {rowIndex.
							columnIndex} ].

	aCellValue itemText: (self phlowTextOrStringFrom: itemText).

	^ aCellValue
]
