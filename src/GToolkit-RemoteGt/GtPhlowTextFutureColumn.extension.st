Extension { #name : #GtPhlowTextFutureColumn }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextFutureColumn >> asGtDeclarativeColumnDataType [
	"Currently, we convert the column to a regular text column."

	^ GtPhlowDeclarativeListingType text
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextFutureColumn >> updateValue: aCellValue forComputedItem: aComputedItem rowIndex: rowIndex columnIndex: columnIndex [
	"Since we convert this text future column to a regular text future column in #asGtDeclarativeColumnDataType,
	this method will be called only in case of the following remote simulation: 
	- `GtRemotePlainInspectionSimulation openOn: GtPhlowColumnedListViewExamples new`.
	The method returns aCellValue, which is kind of `GtRemotePhlowItemTextualValue`."

	| aContext futureItem itemText |
	aContext := GtPhlowTextFutureColumnContext new
			rowItem: aComputedItem;
			rowIndex: rowIndex;
			columnIndex: columnIndex;
			theme: BlTheme default.
	futureItem := self futureComputation
			ifNil: [ aComputedItem ]
			ifNotNil: [ :aSuccessComputation | 
				aSuccessComputation phlowValue: aComputedItem withEnoughArguments: {rowIndex. aContext} ].
	aContext result: futureItem.

	itemText := self successComputation
			ifNil: [ futureItem ]
			ifNotNil: [ :aSuccessComputation | 
				aSuccessComputation phlowValue: futureItem withEnoughArguments: {aContext} ].

	aCellValue itemText: (self phlowTextOrStringFrom: itemText).

	^ aCellValue
]
