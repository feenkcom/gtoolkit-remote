Extension { #name : #GtPhlowTextColumn }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextColumn >> asGtDeclarativeColumnDataType [
	^ GtPhlowDeclarativeListingType new beText
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextColumn >> computeItemValuesFor: anObject rowIndex: rowIndex columnIndex: columnIndex [
	| cellValues itemValue itemText |

	cellValues := GtRemotePhlowItemValue new.

	itemValue := self itemComputation 
		phlowValue: anObject
		withEnoughArguments: { rowIndex . columnIndex }.

	itemText := self formatComputation
		phlowValue: itemValue
		withEnoughArguments: { rowIndex . columnIndex }.

	cellValues 
		itemText: itemText gtDisplayString.

	self hasBackgroundComputation ifTrue: [
		cellValues 
			background: (self backgroundComputation
				phlowValue: itemValue withEnoughArguments: { anObject . rowIndex . columnIndex }) ].
	
	^ cellValues
]
