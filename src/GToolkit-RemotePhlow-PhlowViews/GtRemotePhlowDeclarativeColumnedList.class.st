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
	#superclass : 'GtRemotePhlowDeclarativeView',
	#instVars : [
		'items',
		'itemsBuilder',
		'columns',
		'sendBlock'
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
		columnTitles: (columns collect: [ :each | each title ]) asArray;
		columnWidths: (columns collect: [ :each | each cellWidth ]) asArray;
		dataTransport: GtPhlowDeclarativeView dataLazy
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeColumnedList >> column [
	<return: #GtRemotePhlowColumn>
	| aColumn |
	
	aColumn := GtRemotePhlowColumn new index: columns size + 1.
	columns add: aColumn.
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

{ #category : 'accessing' }
GtRemotePhlowDeclarativeColumnedList >> items: aBlockClosure [

	itemsBuilder := aBlockClosure
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeColumnedList >> itemsBuilder [
	^ itemsBuilder ifNil: [ 
		itemsBuilder := [ { } ] ]
]

{ #category : 'instructions' }
GtRemotePhlowDeclarativeColumnedList >> send: aBlock [

	self
		assert: [ aBlock isNotNil ]
		description: [ 'Send transformation block must be non-nil'  ].
	aBlock isSymbol ifTrue: [ 
		self 
			assert: [ aBlock isUnary ]
			description: [ 'Send transformation symbol must be unary' ] ].
	sendBlock := aBlock.
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeColumnedList >> transformation [ 	
	^ sendBlock ifNil: [ 
		sendBlock := [ :object | object ] ]
]
