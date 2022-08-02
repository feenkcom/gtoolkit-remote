Class {
	#name : #GtRemotePhlowColumn,
	#superclass : #Object,
	#instVars : [
		'index',
		'title',
		'width',
		'itemComputation',
		'type',
		'spawnObjectComputation'
	],
	#classVars : [
		'IconType',
		'TextType'
	],
	#category : 'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #initialization }
GtRemotePhlowColumn class >> initialize [
	TextType := #text.
	IconType := #icon
]

{ #category : #converting }
GtRemotePhlowColumn >> asGtDeclarativeColumnDataType [
	^ self isWithIcon
		ifTrue: [ self isSpawningObject
			ifTrue: [ GtPhlowDeclarativeListingType new beIconLink ]
			ifFalse: [ GtPhlowDeclarativeListingType new beIcon ] ]
		ifFalse: [ self isSpawningObject
			ifTrue: [ GtPhlowDeclarativeListingType new beTextLink ]
			ifFalse: [ GtPhlowDeclarativeListingType new beText ] ]
]

{ #category : #accessing }
GtRemotePhlowColumn >> cellWidth [
	^ width
]

{ #category : #accessing }
GtRemotePhlowColumn >> iconName: aBlock [
	itemComputation := aBlock.
	type := IconType
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
	^ spawnObjectComputation notNil
]

{ #category : #testing }
GtRemotePhlowColumn >> isWithIcon [
	^ type = IconType
]

{ #category : #accessing }
GtRemotePhlowColumn >> itemComputation [
	^ itemComputation ifNil: [ 
		itemComputation := [ :item | item ] ]
]

{ #category : #'private - accessing' }
GtRemotePhlowColumn >> rowStencil [
	^ nil
]

{ #category : #accessing }
GtRemotePhlowColumn >> spawnObject: aBlock [
	"aBlock should return an Object that should be spawned when clicked on:
		- a link button if the column data type is #text
		- a link icon if the column data type is #icon.

	Setting a spawnObject influences how a cell is rendered"

	spawnObjectComputation := aBlock
]

{ #category : #accessing }
GtRemotePhlowColumn >> spawnObjectComputation [
	"If nil, the cell does not spawn an object"

	^ spawnObjectComputation
]

{ #category : #accessing }
GtRemotePhlowColumn >> text: aBlock [
	itemComputation := aBlock.
	type := TextType
]

{ #category : #accessing }
GtRemotePhlowColumn >> title [
	^ title
]

{ #category : #accessing }
GtRemotePhlowColumn >> title: anObject [
	title := anObject
]

{ #category : #accessing }
GtRemotePhlowColumn >> width: aCellWidth [
	width := aCellWidth
]
