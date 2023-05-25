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
	#name : #GtRemotePhlowDeclarativeColumnedList,
	#superclass : #GtRemotePhlowDeclarativeListingView,
	#instVars : [
		'columns'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #converting }
GtRemotePhlowDeclarativeColumnedList >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^ GtPhlowDeclarativeColumnedListView new 
		phlowDataSource: (GtRemotePhlowDeclarativeViewColumnedListDataSource forPhlowView: self);
		title: self title;
		priority: self priority;
		columnSpecifications: (columns collect: [ :aColumn | 
			GtRemotePhlowColumnSpecification new
				title: aColumn title;
				cellWidth: aColumn cellWidth;
				type: aColumn asGtDeclarativeColumnDataType asString;
				spawnsObjects: aColumn isSpawningObject;
				in: [ :aColumnSpecification |
					aColumn hasBackgroundComputation ifTrue: [ 
						aColumnSpecification  markAsHavingBackground ].
					aColumnSpecification ] ] as: Array) ;
		dataTransport: GtPhlowDeclarativeView dataLazy
]

{ #category : #accessing }
GtRemotePhlowDeclarativeColumnedList >> column [
	<return: #GtRemotePhlowColumn>
	| aColumn |
	
	aColumn := GtRemotePhlowColumn new index: self columns size + 1.
	self columns add: aColumn.
	^ aColumn
]

{ #category : #'api - scripting column' }
GtRemotePhlowDeclarativeColumnedList >> column: aTitleString do: aBlock [
	| aColumn |
	aColumn := self column.
	aColumn title: aTitleString.
	aBlock value: aColumn
]

{ #category : #'api - scripting column' }
GtRemotePhlowDeclarativeColumnedList >> column: columnName iconName: anIconNameComputation [
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn iconName: anIconNameComputation
]

{ #category : #'api - scripting column' }
GtRemotePhlowDeclarativeColumnedList >> column: columnName iconName: anIconNameComputation spawn: aSpawnBlock [
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn iconName: anIconNameComputation.
	aColumn spawnObject: aSpawnBlock.
]

{ #category : #'api - scripting column' }
GtRemotePhlowDeclarativeColumnedList >> column: columnName iconName: anIconNameComputation spawn: aSpawnBlock width: aNumberOrNil [
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn iconName: anIconNameComputation.
	aColumn spawnObject: aSpawnBlock.
	aColumn width: aNumberOrNil.
]

{ #category : #'api - scripting column' }
GtRemotePhlowDeclarativeColumnedList >> column: columnName iconName: anIconNameComputation width: aNumberOrNil [
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn iconName: anIconNameComputation.
	aColumn width: aNumberOrNil.
]

{ #category : #'api - scripting column' }
GtRemotePhlowDeclarativeColumnedList >> column: columnName text: aBlockClosure [
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn text: aBlockClosure
]

{ #category : #'api - scripting column' }
GtRemotePhlowDeclarativeColumnedList >> column: columnName text: aBlockClosure spawn: aSpawnBlock [
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn text: aBlockClosure.
	aColumn spawnObject: aSpawnBlock.
]

{ #category : #'api - scripting column' }
GtRemotePhlowDeclarativeColumnedList >> column: columnName text: aBlockClosure spawn: aSpawnBlock width: aNumberOrNil [
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn text: aBlockClosure.
	aColumn spawnObject: aSpawnBlock.
	aColumn width: aNumberOrNil.
]

{ #category : #'api - scripting column' }
GtRemotePhlowDeclarativeColumnedList >> column: columnName text: aBlockClosure width: aNumberOrNil [
 	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn text: aBlockClosure.
	aColumn width: aNumberOrNil.
]

{ #category : #accessing }
GtRemotePhlowDeclarativeColumnedList >> columns [
	^ columns ifNil: [
		columns := OrderedCollection new ]
]
