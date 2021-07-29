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
		'columnValues',
		'columnTitles',
		'columnWidths',
		'sendBlock'
	],
	#category : 'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : 'instance creation' }
GtRemotePhlowDeclarativeColumnedList class >> fromJSONDictionary: aDictionary [

	| list |

	list := super fromJSONDictionary: aDictionary.
	list
		columnTitles: (aDictionary at: #columnTitles);
		columnWidths: (aDictionary at: #columnWidths).
	list dataTransport = self dataIncluded ifTrue: 
		[ list items: (aDictionary at: #items) ].
	^list
]

{ #category : 'converting' }
GtRemotePhlowDeclarativeColumnedList >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^GtDeclarativeColumnedListView new 
		phlowDataSource: (GtPhlowDeclarativeViewColumnedListDataSource forPhlowView: self);
		title: self title;
		priority: self priority;
		columnTitles: self columnTitles asArray;
		columnWidths: self columnWidths asArray;
		dataTransport: GtDeclarativeView dataLazy
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeColumnedList >> column: columnName item: aBlockClosure [

	^ self column: columnName item: aBlockClosure width: nil
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeColumnedList >> column: columnName item: aBlockClosure width: aNumberOrNil [
 
	columnTitles add: columnName.
	columnValues add: aBlockClosure.
	columnWidths add: aNumberOrNil. 
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeColumnedList >> columnTitles [
	^ columnTitles
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeColumnedList >> columnTitles: anObject [
	columnTitles := anObject
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeColumnedList >> columnWidths [
	^ columnWidths
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeColumnedList >> columnWidths: anObject [
	columnWidths := anObject
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeColumnedList >> initialize [

	super initialize.
	columnValues := OrderedCollection new.
	columnTitles := OrderedCollection new.
	columnWidths := OrderedCollection new.
	sendBlock := [ :object | object ].
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeColumnedList >> items: aBlockClosure [

	itemsBuilder := aBlockClosure
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
