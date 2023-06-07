Extension { #name : #GtPhlowColumn }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColumn >> asGtDeclarativeColumnDataType [
	^ self subclassResponsibility
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColumn >> canBeForGtDeclarativeView [
	^ self asGtDeclarativeColumnDataType isUnknown not
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColumn >> computeItemValuesFor: anObject rowIndex: rowIndex columnIndex: columnIndex [
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
