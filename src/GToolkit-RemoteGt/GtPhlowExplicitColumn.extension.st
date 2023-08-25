Extension { #name : #GtPhlowExplicitColumn }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowExplicitColumn >> asGtDeclarativeColumnDataType [
	^ [ dataBinder asRemotePhlowDeclarativeListingType ]
		on: MessageNotUnderstood
		do: [ :anError | GtPhlowDeclarativeListingType unknown ]
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowExplicitColumn >> computeItemValuesFor: anObject rowIndex: rowIndex columnIndex: columnIndex [
	| cellValues itemValue |
	cellValues := GtRemotePhlowItemValue new.
	
	itemValue := self itemComputation 
		phlowValue: anObject
		withEnoughArguments: { rowIndex . columnIndex }.

	cellValues 
		itemText: itemValue gtDisplayString.

	self hasBackgroundComputation ifTrue: [
		cellValues 
			background: (self backgroundComputation
				phlowValue: itemValue withEnoughArguments: { anObject . rowIndex . columnIndex }) ].
	
	^ cellValues
]
