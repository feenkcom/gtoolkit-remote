Extension { #name : #GtPhlowExplicitColumn }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowExplicitColumn >> asGtDeclarativeColumnDataType [
	^ [ dataBinder asRemotePhlowDeclarativeListingType ]
		on: MessageNotUnderstood
		do: [ :anError | GtPhlowDeclarativeListingType unknown ]
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowExplicitColumn >> computeItemValuesFor: anObject rowIndex: rowIndex columnIndex: columnIndex [
	| cellValue itemValue |
	cellValue := GtRemotePhlowItemTextualValue new.
	
	itemValue := self itemComputation 
		phlowValue: anObject
		withEnoughArguments: { rowIndex . columnIndex }.

	cellValue 
		itemText: (self phlowTextOrStringFrom: itemValue).

	self hasBackgroundComputation ifTrue: [
		cellValue 
			background: (self backgroundComputation
				phlowValue: itemValue 
				withEnoughArguments: { anObject . rowIndex . columnIndex }) ].
	
	^ cellValue
]
