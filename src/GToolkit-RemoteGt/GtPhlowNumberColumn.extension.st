Extension { #name : #GtPhlowNumberColumn }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowNumberColumn >> asGtDeclarativeColumnDataType [
	^ GtPhlowDeclarativeListingType number
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowNumberColumn >> computeItemValuesFor: anObject rowIndex: rowIndex columnIndex: columnIndex [
	| cellValues itemValue itemText |

	cellValues := GtRemotePhlowItemValue new.

	itemValue := self itemComputation 
		phlowValue: anObject
		withEnoughArguments: { rowIndex . columnIndex }.

	itemText := self formatComputation 
		ifNil: [ itemValue ]
		ifNotNil: [ :aComputation |
			aComputation
				phlowValue: itemValue
				withEnoughArguments: { rowIndex . columnIndex } ].

	cellValues 
		itemText: itemText gtDisplayString.

	self hasBackgroundComputation ifTrue: [
		cellValues 
			background: (self backgroundComputation
				phlowValue: itemValue withEnoughArguments: { anObject . rowIndex . columnIndex }) ].
	
	^ cellValues
]
