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

{ #category : 'accessing' }
GtRemotePhlowColumn >> cellWidth [
	^ width
]

{ #category : 'accessing' }
GtRemotePhlowColumn >> columnDataType [
	^ self isWithIcon
		ifTrue: [ #icon ]
		ifFalse: [ #text ]
]

{ #category : 'accessing' }
GtRemotePhlowColumn >> iconName: aBlock [
	iconNameComputation := aBlock
]

{ #category : 'accessing' }
GtRemotePhlowColumn >> iconNameComputation [
	^ iconNameComputation
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
GtRemotePhlowColumn >> textComputation [
	^ textComputation ifNil: [ 
		textComputation := [ :item | item ] ]
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
