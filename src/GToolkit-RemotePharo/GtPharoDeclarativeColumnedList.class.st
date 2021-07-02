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
	#name : #GtPharoDeclarativeColumnedList,
	#superclass : #GtPharoDeclarativeView,
	#instVars : [
		'items',
		'itemsBuilder',
		'columnValues',
		'columnTitles',
		'columnWidths',
		'sendBlock'
	],
	#category : #'GToolkit-RemotePharo-Server'
}

{ #category : #'instance creation' }
GtPharoDeclarativeColumnedList class >> fromJSONDictionary: aDictionary [

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
GtPharoDeclarativeColumnedList >> asDictionaryForExport [ 

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
GtPharoDeclarativeColumnedList >> column: columnName item: aBlockClosure [

	^ self column: columnName item: aBlockClosure width: nil
]

{ #category : #accessing }
GtPharoDeclarativeColumnedList >> column: columnName item: aBlockClosure width: aNumberOrNil [

	columnTitles add: columnName.
	columnValues add: aBlockClosure.
	columnWidths add: aNumberOrNil.
]

{ #category : #accessing }
GtPharoDeclarativeColumnedList >> columnTitles [
	^ columnTitles
]

{ #category : #accessing }
GtPharoDeclarativeColumnedList >> columnTitles: anObject [
	columnTitles := anObject
]

{ #category : #accessing }
GtPharoDeclarativeColumnedList >> columnWidths [
	^ columnWidths
]

{ #category : #accessing }
GtPharoDeclarativeColumnedList >> columnWidths: anObject [
	columnWidths := anObject
]

{ #category : #accessing }
GtPharoDeclarativeColumnedList >> data [ 

	^ items ifNil: [ items := itemsBuilder value collect: [ :item |
			columnValues collect: [ :columnValue | columnValue value: item ] as: Array ] as: Array ]
]

{ #category : #accessing }
GtPharoDeclarativeColumnedList >> initialize [

	super initialize.
	columnValues := OrderedCollection new.
	columnTitles := OrderedCollection new.
	columnWidths := OrderedCollection new.
	sendBlock := [ :object | object ].
]

{ #category : #accessing }
GtPharoDeclarativeColumnedList >> items: aBlockClosure [

	itemsBuilder := aBlockClosure
]

{ #category : #instructions }
GtPharoDeclarativeColumnedList >> send: aBlock [

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
GtPharoDeclarativeColumnedList >> sentItemAt: selection [ 
	"Answer the raw value at the supplied index"

	^ sendBlock cull: (itemsBuilder value at: selection) cull: selection
]

{ #category : #accessing }
GtPharoDeclarativeColumnedList >> viewName [ 

	^ #GtDeclarativeColumnedList
]
