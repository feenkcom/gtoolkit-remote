Extension { #name : #GtPhlowTypedColumn }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTypedColumn >> computeItemValuesFor: anObject rowIndex: rowIndex columnIndex: columnIndex [
	| cellValue itemValue |

	cellValue := self createRemotePhlowCellValue.

	itemValue := self itemComputation 
		phlowValue: anObject
		withEnoughArguments: { 
			rowIndex . columnIndex }.

	self 
		updateValue: cellValue 
		forComputedItem: itemValue 
		rowIndex: rowIndex 
		columnIndex: columnIndex.
	
	self hasBackgroundComputation ifTrue: [
		cellValue 
			background: (self backgroundComputation
				phlowValue: itemValue 
				withEnoughArguments: { 
					anObject . rowIndex . columnIndex }) ].
	
	^ cellValue
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTypedColumn >> createRemotePhlowCellValue [
	^ GtRemotePhlowItemTextualValue new
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTypedColumn >> updateValue: aCellValue forComputedItem: aComputedItem rowIndex: rowIndex columnIndex: columnIndex [
	self subclassResponsibility
]
