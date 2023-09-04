Class {
	#name : #GtRemotePhlowTextColumn,
	#superclass : #GtRemotePhlowTypedColumn,
	#instVars : [
		'formatComputation'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #converting }
GtRemotePhlowTextColumn >> asGtDeclarativeColumnDataType [
	^ GtPhlowDeclarativeListingType text
]

{ #category : #configuration }
GtRemotePhlowTextColumn >> format: aBlock [
	formatComputation := aBlock
]

{ #category : #accessing }
GtRemotePhlowTextColumn >> formatComputation [
	^ formatComputation
]

{ #category : #computation }
GtRemotePhlowTextColumn >> updateValue: aCellValue forComputedItem: aComputedItem rowIndex: rowIndex columnIndex: columnIndex [
	| itemText |
	
	itemText := self formatComputation 
		ifNil: [ aComputedItem ]
		ifNotNil: [ :aFomattingComputation |
			aFomattingComputation
				cull: aComputedItem
				cull: rowIndex 
				cull: columnIndex ].
	
	aCellValue 
		itemText: itemText gtDisplayString.
]
