Class {
	#name : 'GtRemotePhlowColumn',
	#superclass : 'Object',
	#instVars : [
		'index',
		'title',
		'width',
		'itemComputation',
		'textComputation',
		'iconNameComputation',
		'spawnObjectComputation'
	],
	#category : 'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : 'converting' }
GtRemotePhlowColumn >> asGtDeclarativeColumnDataType [
	^ self isWithIcon
		ifTrue: [ self isSpawningObject
			ifTrue: [ GtPhlowDeclarativeListingType new beIconLink ]
			ifFalse: [ GtPhlowDeclarativeListingType new beIcon ] ]
		ifFalse: [ self isSpawningObject
			ifTrue: [ GtPhlowDeclarativeListingType new beTextLink ]
			ifFalse: [ GtPhlowDeclarativeListingType new beText ] ]
]

{ #category : 'converting' }
GtRemotePhlowColumn >> asRemotePhlowDeclarativeValueComputationFor: anItemObject index: anItemIndex [
	| aValueComputation |
	
	aValueComputation := self isWithIcon
		ifTrue: [ iconNameComputation ]
		ifFalse: [ textComputation ifNil: [ [ :item | item ] ] ].
	
	^ GtPhlowDeclarativeListingValueComputation new
		computation: aValueComputation
		arguments: { anItemObject . anItemIndex }
]

{ #category : 'accessing' }
GtRemotePhlowColumn >> cellWidth [
	^ width
]

{ #category : 'accessing' }
GtRemotePhlowColumn >> iconName: aBlock [
	iconNameComputation := aBlock
]

{ #category : 'accessing' }
GtRemotePhlowColumn >> index [
	^ index
]

{ #category : 'accessing' }
GtRemotePhlowColumn >> index: aColumnIndex [
	index := aColumnIndex
]

{ #category : 'testing' }
GtRemotePhlowColumn >> isSpawningObject [
	^ spawnObjectComputation notNil
]

{ #category : 'testing' }
GtRemotePhlowColumn >> isWithIcon [
	^ iconNameComputation notNil
]

{ #category : 'accessing' }
GtRemotePhlowColumn >> itemComputation [
	^ itemComputation ifNil: [ 
		itemComputation := [ :item | item ] ]
]

{ #category : 'private - accessing' }
GtRemotePhlowColumn >> rowStencil [
	^ nil
]

{ #category : 'accessing' }
GtRemotePhlowColumn >> spawnObject: aBlock [
	"aBlock should return an Object that should be spawned when clicked on:
		- a link button if the column data type is #text
		- a link icon if the column data type is #icon.

	Setting a spawnObject influences how a cell is rendered"

	spawnObjectComputation := aBlock
]

{ #category : 'accessing' }
GtRemotePhlowColumn >> spawnObjectComputation [
	"If nil, the cell does not spawn an object"

	^ spawnObjectComputation
]

{ #category : 'accessing' }
GtRemotePhlowColumn >> text: aBlock [
	textComputation := aBlock
]

{ #category : 'accessing' }
GtRemotePhlowColumn >> title [
	^ title
]

{ #category : 'accessing' }
GtRemotePhlowColumn >> title: anObject [
	title := anObject
]

{ #category : 'accessing' }
GtRemotePhlowColumn >> width: aCellWidth [
	width := aCellWidth
]
