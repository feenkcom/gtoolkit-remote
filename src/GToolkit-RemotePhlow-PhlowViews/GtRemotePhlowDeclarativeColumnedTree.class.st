Class {
	#name : #GtRemotePhlowDeclarativeColumnedTree,
	#superclass : #GtRemotePhlowDeclarativeTree,
	#instVars : [
		'columns'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #accessing }
GtRemotePhlowDeclarativeColumnedTree >> column [
	<return: #GtRemotePhlowColumn>
	| aColumn |
	
	aColumn := GtRemotePhlowColumn new index: self columns size + 1.
	self columns add: aColumn.
	^ aColumn
]

{ #category : #accessing }
GtRemotePhlowDeclarativeColumnedTree >> column: columnName iconName: anIconNameComputation [
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn iconName: anIconNameComputation
]

{ #category : #accessing }
GtRemotePhlowDeclarativeColumnedTree >> column: columnName iconName: anIconNameComputation spawn: aSpawnBlock [
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn iconName: anIconNameComputation.
	aColumn spawnObject: aSpawnBlock.
]

{ #category : #accessing }
GtRemotePhlowDeclarativeColumnedTree >> column: columnName iconName: anIconNameComputation spawn: aSpawnBlock width: aNumberOrNil [
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn iconName: anIconNameComputation.
	aColumn spawnObject: aSpawnBlock.
	aColumn width: aNumberOrNil.
]

{ #category : #accessing }
GtRemotePhlowDeclarativeColumnedTree >> column: columnName iconName: anIconNameComputation width: aNumberOrNil [
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn iconName: anIconNameComputation.
	aColumn width: aNumberOrNil.
]

{ #category : #accessing }
GtRemotePhlowDeclarativeColumnedTree >> column: columnName text: aBlockClosure [
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn text: aBlockClosure
]

{ #category : #accessing }
GtRemotePhlowDeclarativeColumnedTree >> column: columnName text: aBlockClosure spawn: aSpawnBlock [
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn text: aBlockClosure.
	aColumn spawnObject: aSpawnBlock.
]

{ #category : #accessing }
GtRemotePhlowDeclarativeColumnedTree >> column: columnName text: aBlockClosure spawn: aSpawnBlock width: aNumberOrNil [
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn text: aBlockClosure.
	aColumn spawnObject: aSpawnBlock.
	aColumn width: aNumberOrNil.
]

{ #category : #accessing }
GtRemotePhlowDeclarativeColumnedTree >> column: columnName text: aBlockClosure width: aNumberOrNil [
 	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn text: aBlockClosure.
	aColumn width: aNumberOrNil.
]

{ #category : #accessing }
GtRemotePhlowDeclarativeColumnedTree >> columns [
	^ columns ifNil: [
		columns := OrderedCollection new ]
]
