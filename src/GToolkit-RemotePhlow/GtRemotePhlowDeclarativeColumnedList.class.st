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
	#name : #GtRemotePhlowDeclarativeColumnedList,
	#superclass : #GtRemotePhlowDeclarativeView,
	#instVars : [
		'items',
		'itemsBuilder',
		'columnValues',
		'columnTitles',
		'columnWidths',
		'sendBlock'
	],
	#category : 'GToolkit-RemotePhlow'
}

{ #category : #'instance creation' }
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

{ #category : #converting }
GtRemotePhlowDeclarativeColumnedList >> asDictionaryForExport [ 

	| dictionary |

	dictionary := super asDictionaryForExport 
		at: #columnTitles put: columnTitles asArray;
		at: #columnWidths put: columnWidths asArray;
		yourself.
	self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #items put: self data asArray ].
	^dictionary
]

{ #category : #accessing }
GtRemotePhlowDeclarativeColumnedList >> column: columnName item: aBlockClosure [

	^ self column: columnName item: aBlockClosure width: nil
]

{ #category : #accessing }
GtRemotePhlowDeclarativeColumnedList >> column: columnName item: aBlockClosure width: aNumberOrNil [

	columnTitles add: columnName.
	columnValues add: aBlockClosure.
	columnWidths add: aNumberOrNil.
]

{ #category : #accessing }
GtRemotePhlowDeclarativeColumnedList >> columnTitles [
	^ columnTitles
]

{ #category : #accessing }
GtRemotePhlowDeclarativeColumnedList >> columnTitles: anObject [
	columnTitles := anObject
]

{ #category : #accessing }
GtRemotePhlowDeclarativeColumnedList >> columnWidths [
	^ columnWidths
]

{ #category : #accessing }
GtRemotePhlowDeclarativeColumnedList >> columnWidths: anObject [
	columnWidths := anObject
]

{ #category : #accessing }
GtRemotePhlowDeclarativeColumnedList >> data [ 

	^ items ifNil: [ items := (itemsBuilder value collect: [ :item |
			(columnValues collect: [ :columnValue | columnValue value: item ]) asArray ]) asArray ]
]

{ #category : #accessing }
GtRemotePhlowDeclarativeColumnedList >> initialize [

	super initialize.
	columnValues := OrderedCollection new.
	columnTitles := OrderedCollection new.
	columnWidths := OrderedCollection new.
	sendBlock := [ :object | object ].
]

{ #category : #accessing }
GtRemotePhlowDeclarativeColumnedList >> items: aBlockClosure [

	itemsBuilder := aBlockClosure
]

{ #category : #instructions }
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

{ #category : #accessing }
GtRemotePhlowDeclarativeColumnedList >> sentItemAt: selection [ 
	"Answer the raw value at the supplied index"

	^ sendBlock cull: (itemsBuilder value at: selection) cull: selection
]

{ #category : #accessing }
GtRemotePhlowDeclarativeColumnedList >> viewName [ 

	^ #GtDeclarativeColumnedList
]
