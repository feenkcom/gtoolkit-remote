"
I provide functionality for working with columns.
"
Class {
	#name : #GtRemotePhlowBasicColumnedListView,
	#superclass : #GtRemotePhlowListingView,
	#instVars : [
		'columns'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #converting }
GtRemotePhlowBasicColumnedListView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^ GtPhlowColumnedListViewSpecification new 
		phlowDataSource: (GtRemotePhlowDeclarativeViewColumnedListDataSource forPhlowView: self);
		title: self title;
		priority: self priority;
		columnSpecifications: (columns asArray collect: [ :aColumn | 
			| columnSpecification|
			columnSpecification := GtRemotePhlowColumnSpecification new
				title: aColumn title;
				cellWidth: aColumn cellWidth;
				type: aColumn asGtDeclarativeColumnDataType asString;
				spawnsObjects: aColumn isSpawningObject.
			
			aColumn hasBackgroundComputation ifTrue: [ 
				columnSpecification  markAsHavingBackground ].
			columnSpecification ] ) ;
		dataTransport: GtPhlowViewSpecification dataLazy
]

{ #category : #accessing }
GtRemotePhlowBasicColumnedListView >> column [
	<return: #GtRemotePhlowColumn>
	| aColumn |
	
	aColumn := GtRemotePhlowColumn new index: self columns size + 1.
	self columns add: aColumn.
	^ aColumn
]

{ #category : #'api - scripting column' }
GtRemotePhlowBasicColumnedListView >> column: aTitleString do: aBlock [
	| aColumn |
	aColumn := self column.
	aColumn title: aTitleString.
	aBlock value: aColumn
]

{ #category : #'api - scripting column' }
GtRemotePhlowBasicColumnedListView >> column: columnName iconName: anIconNameComputation [
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn iconName: anIconNameComputation
]

{ #category : #'api - scripting column' }
GtRemotePhlowBasicColumnedListView >> column: columnName iconName: anIconNameComputation spawn: aSpawnBlock [
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn iconName: anIconNameComputation.
	aColumn spawnObject: aSpawnBlock.
]

{ #category : #'api - scripting column' }
GtRemotePhlowBasicColumnedListView >> column: columnName iconName: anIconNameComputation spawn: aSpawnBlock width: aNumberOrNil [
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn iconName: anIconNameComputation.
	aColumn spawnObject: aSpawnBlock.
	aColumn width: aNumberOrNil.
]

{ #category : #'api - scripting column' }
GtRemotePhlowBasicColumnedListView >> column: columnName iconName: anIconNameComputation width: aNumberOrNil [
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn iconName: anIconNameComputation.
	aColumn width: aNumberOrNil.
]

{ #category : #'api - scripting column' }
GtRemotePhlowBasicColumnedListView >> column: columnName text: aBlockClosure [
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn text: aBlockClosure
]

{ #category : #'api - scripting column' }
GtRemotePhlowBasicColumnedListView >> column: columnName text: aBlockClosure spawn: aSpawnBlock [
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn text: aBlockClosure.
	aColumn spawnObject: aSpawnBlock.
]

{ #category : #'api - scripting column' }
GtRemotePhlowBasicColumnedListView >> column: columnName text: aBlockClosure spawn: aSpawnBlock width: aNumberOrNil [
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn text: aBlockClosure.
	aColumn spawnObject: aSpawnBlock.
	aColumn width: aNumberOrNil.
]

{ #category : #'api - scripting column' }
GtRemotePhlowBasicColumnedListView >> column: columnName text: aBlockClosure width: aNumberOrNil [
 	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn text: aBlockClosure.
	aColumn width: aNumberOrNil.
]

{ #category : #accessing }
GtRemotePhlowBasicColumnedListView >> columns [
	^ columns ifNil: [
		columns := OrderedCollection new ]
]

{ #category : #accessing }
GtRemotePhlowBasicColumnedListView >> configureColumnsSpecificationOn: aViewSpecification [
	aViewSpecification
		columnSpecifications: (columns asArray collect: [ :aColumn | 
			| columnSpecification|
			columnSpecification := GtRemotePhlowColumnSpecification new
				title: aColumn title;
				cellWidth: aColumn cellWidth;
				type: aColumn asGtDeclarativeColumnDataType asString;
				spawnsObjects: aColumn isSpawningObject.
			
			aColumn hasBackgroundComputation ifTrue: [ 
				columnSpecification  markAsHavingBackground ].
			columnSpecification ] )
]
