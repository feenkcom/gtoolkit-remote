"
GtDeclarativeColumnedList supports a subset of the possible configurations of ${class:name=GtPhlowColumnedListView}.

Current limitations:

- Only matchParent and fixed column widths are supported

!!Internal Representation and Key Implementation Points.

!!!Instance Variables
	columnTitles:	<Array of String>
	columnWidths:	<Array of Integer|nil>
	items:				<Array of Array>	These are the formatted values to display, not the raw values to send

"
Class {
	#name : 'GtRemotePhlowDeclarativeColumnedList',
	#superclass : 'GtRemotePhlowDeclarativeListingView',
	#instVars : [
		'columns'
	],
	#category : 'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : 'converting' }
GtRemotePhlowDeclarativeColumnedList >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^GtPhlowDeclarativeColumnedListView new 
		phlowDataSource: (GtRemotePhlowDeclarativeViewColumnedListDataSource forPhlowView: self);
		title: self title;
		priority: self priority;
		columnTitles: (self columns collect: [ :each | each title ]) asArray;
		columnWidths: (self columns collect: [ :each | each cellWidth ]) asArray;
		dataTransport: GtPhlowDeclarativeView dataLazy
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeColumnedList >> column [
	<return: #GtRemotePhlowColumn>
	| aColumn |
	
	aColumn := GtRemotePhlowColumn new index: self columns size + 1.
	self columns add: aColumn.
	^ aColumn
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeColumnedList >> column: columnName item: aBlockClosure [
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn item: aBlockClosure
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeColumnedList >> column: columnName item: aBlockClosure width: aNumberOrNil [
 	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn item: aBlockClosure.
	aColumn width: aNumberOrNil.
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeColumnedList >> columns [
	^ columns ifNil: [
		columns := OrderedCollection new ]
]
