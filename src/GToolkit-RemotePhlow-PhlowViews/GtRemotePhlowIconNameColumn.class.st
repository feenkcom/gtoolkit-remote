Class {
	#name : #GtRemotePhlowIconNameColumn,
	#superclass : #GtRemotePhlowTypedColumn,
	#instVars : [
		'iconNameComputation'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #testing }
GtRemotePhlowIconNameColumn class >> isAbstract [
	^ self name = #GtRemotePhlowIconNameColumn
]

{ #category : #accessing }
GtRemotePhlowIconNameColumn >> iconName: anIconNameComputation [
	iconNameComputation := anIconNameComputation
]

{ #category : #accessing }
GtRemotePhlowIconNameColumn >> iconNameComputation [
	^ iconNameComputation
]

{ #category : #computation }
GtRemotePhlowIconNameColumn >> updateValue: aCellValue forComputedItem: aComputedItem rowIndex: rowIndex columnIndex: columnIndex [
	| itemText |
	
	itemText := self iconNameComputation 
		ifNil: [ aComputedItem ]
		ifNotNil: [ :anIconNameComputation |
			anIconNameComputation
				cull: aComputedItem
				cull: rowIndex 
				cull: columnIndex ].
				
	aCellValue 
		itemText: itemText gtDisplayString.
]
