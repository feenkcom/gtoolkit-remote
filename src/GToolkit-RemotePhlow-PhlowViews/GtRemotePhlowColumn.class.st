Class {
	#name : #GtRemotePhlowColumn,
	#superclass : #Object,
	#instVars : [
		'index',
		'title',
		'width',
		'itemComputation',
		'backgroundComputation'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #testing }
GtRemotePhlowColumn class >> isAbstract [
	^ self name = #GtRemotePhlowColumn
]

{ #category : #converting }
GtRemotePhlowColumn >> asGtDeclarativeColumnDataType [
	^ self subclassResponsibility
]

{ #category : #'api - scripting' }
GtRemotePhlowColumn >> background: aComputation [
	backgroundComputation := aComputation
]

{ #category : #accessing }
GtRemotePhlowColumn >> backgroundComputation [
	^ backgroundComputation
]

{ #category : #accessing }
GtRemotePhlowColumn >> cellWidth [
	^ width
]

{ #category : #computation }
GtRemotePhlowColumn >> computeItemValuesFor: anObject rowIndex: rowIndex columnIndex: columnIndex [
	| cellValue itemValue |
	cellValue := self createRemotePhlowCellValue.
	
	itemValue := self itemComputation 
		cull: anObject cull: rowIndex cull: columnIndex.
		
	self 
		updateValue: cellValue 
		forComputedItem: itemValue 
		rowIndex: rowIndex 
		columnIndex: columnIndex.
	
	self hasBackgroundComputation ifTrue: [
		cellValue 
			background: (self backgroundComputation
				cull: itemValue cull: anObject cull: rowIndex cull: columnIndex) ].
	
	^ cellValue
]

{ #category : #computation }
GtRemotePhlowColumn >> createRemotePhlowCellValue [
	^ GtRemotePhlowItemTextualValue new
]

{ #category : #testing }
GtRemotePhlowColumn >> hasBackgroundComputation [
	^ backgroundComputation notNil
]

{ #category : #accessing }
GtRemotePhlowColumn >> index [
	^ index
]

{ #category : #accessing }
GtRemotePhlowColumn >> index: aColumnIndex [
	index := aColumnIndex
]

{ #category : #testing }
GtRemotePhlowColumn >> isSpawningObject [
	^ false
]

{ #category : #accessing }
GtRemotePhlowColumn >> item: anItemComputation [
	itemComputation := anItemComputation
]

{ #category : #accessing }
GtRemotePhlowColumn >> itemComputation [
	^ itemComputation ifNil: [ 
		itemComputation := [ :item | item ] ]
]

{ #category : #computation }
GtRemotePhlowColumn >> phlowTextOrStringFrom: aComputedItem [ 
	^ aComputedItem isString
		ifTrue: [ aComputedItem ]
		ifFalse: [ aComputedItem gtDisplayText ]
]

{ #category : #'private - accessing' }
GtRemotePhlowColumn >> rowStencil [
	^ nil
]

{ #category : #accessing }
GtRemotePhlowColumn >> title [
	^ title
]

{ #category : #'api - scripting' }
GtRemotePhlowColumn >> title: anObject [
	title := anObject
]

{ #category : #computation }
GtRemotePhlowColumn >> updateValue: aCellValue forComputedItem: aComputedItem rowIndex: rowIndex columnIndex: columnIndex [
	aCellValue 
		itemText: (self phlowTextOrStringFrom: aComputedItem).
]

{ #category : #accessing }
GtRemotePhlowColumn >> width: aCellWidth [
	width := aCellWidth
]
