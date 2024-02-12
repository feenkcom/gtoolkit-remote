Class {
	#name : #GtRemotePhlowNumberColumn,
	#superclass : #GtRemotePhlowTypedColumn,
	#instVars : [
		'formatComputation'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #converting }
GtRemotePhlowNumberColumn >> asGtDeclarativeColumnDataType [
	^ GtPhlowDeclarativeListingType number
]

{ #category : #configuration }
GtRemotePhlowNumberColumn >> format: aBlock [
	formatComputation := aBlock
]

{ #category : #accessing }
GtRemotePhlowNumberColumn >> formatComputation [
	^ formatComputation
]

{ #category : #computation }
GtRemotePhlowNumberColumn >> updateValue: aCellValue forComputedItem: aComputedItem rowIndex: rowIndex columnIndex: columnIndex [
	| itemText |
	
	itemText := self formatComputation 
		ifNil: [ aComputedItem ]
		ifNotNil: [ :aFomattingComputation |
			aFomattingComputation
				cull: aComputedItem
				cull: rowIndex 
				cull: columnIndex ].
				
	aCellValue 
		itemText: (self phlowTextOrStringFrom: itemText).
]
