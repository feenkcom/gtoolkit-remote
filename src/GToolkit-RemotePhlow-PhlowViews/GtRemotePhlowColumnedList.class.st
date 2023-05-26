"
{{gtClass:GtRemotePhlowDeclarativeColumnedList}} supports a subset of the possible configurations of {{gtClass:name=GtPhlowColumnedListView}}.

Current limitations:

- Only matchParent and fixed column widths are supported

## Internal Representation and Key Implementation Points.

### Instance Variables
	columnTitles:	<Array of String>
	columnWidths:	<Array of Integer|nil>
	items:				<Array of Array>	These are the formatted values to display, not the raw values to send


"
Class {
	#name : #GtRemotePhlowColumnedList,
	#superclass : #GtRemotePhlowListingView,
	#instVars : [
		'columns'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #converting }
GtRemotePhlowColumnedList >> asGtDeclarativeView [
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
GtRemotePhlowColumnedList >> column [
	<return: #GtRemotePhlowColumn>
	| aColumn |
	
	aColumn := GtRemotePhlowColumn new index: self columns size + 1.
	self columns add: aColumn.
	^ aColumn
]

{ #category : #'api - scripting column' }
GtRemotePhlowColumnedList >> column: aTitleString do: aBlock [
	| aColumn |
	aColumn := self column.
	aColumn title: aTitleString.
	aBlock value: aColumn
]

{ #category : #'api - scripting column' }
GtRemotePhlowColumnedList >> column: columnName iconName: anIconNameComputation [
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn iconName: anIconNameComputation
]

{ #category : #'api - scripting column' }
GtRemotePhlowColumnedList >> column: columnName iconName: anIconNameComputation spawn: aSpawnBlock [
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn iconName: anIconNameComputation.
	aColumn spawnObject: aSpawnBlock.
]

{ #category : #'api - scripting column' }
GtRemotePhlowColumnedList >> column: columnName iconName: anIconNameComputation spawn: aSpawnBlock width: aNumberOrNil [
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn iconName: anIconNameComputation.
	aColumn spawnObject: aSpawnBlock.
	aColumn width: aNumberOrNil.
]

{ #category : #'api - scripting column' }
GtRemotePhlowColumnedList >> column: columnName iconName: anIconNameComputation width: aNumberOrNil [
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn iconName: anIconNameComputation.
	aColumn width: aNumberOrNil.
]

{ #category : #'api - scripting column' }
GtRemotePhlowColumnedList >> column: columnName text: aBlockClosure [
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn text: aBlockClosure
]

{ #category : #'api - scripting column' }
GtRemotePhlowColumnedList >> column: columnName text: aBlockClosure spawn: aSpawnBlock [
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn text: aBlockClosure.
	aColumn spawnObject: aSpawnBlock.
]

{ #category : #'api - scripting column' }
GtRemotePhlowColumnedList >> column: columnName text: aBlockClosure spawn: aSpawnBlock width: aNumberOrNil [
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn text: aBlockClosure.
	aColumn spawnObject: aSpawnBlock.
	aColumn width: aNumberOrNil.
]

{ #category : #'api - scripting column' }
GtRemotePhlowColumnedList >> column: columnName text: aBlockClosure width: aNumberOrNil [
 	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn text: aBlockClosure.
	aColumn width: aNumberOrNil.
]

{ #category : #accessing }
GtRemotePhlowColumnedList >> columns [
	^ columns ifNil: [
		columns := OrderedCollection new ]
]
