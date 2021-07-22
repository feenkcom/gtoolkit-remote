"
GtPharoDeclarativeTree maps to GtPhlowTreeView in Gt.

When transporting the data, each node in the tree is represented as an Array with three slots:
1. The item's textual representation
2. The index.  This is an array of indices to the nodes location.
3. An Array of child nodes.

"
Class {
	#name : #GtRemotePhlowDeclarativeTree,
	#superclass : #GtRemotePhlowDeclarativeView,
	#instVars : [
		'itemsBuilder',
		'itemTextBlock',
		'childrenBlock'
	],
	#category : #'GToolkit-RemotePhlow'
}

{ #category : #private }
GtRemotePhlowDeclarativeTree >> add: item index: anArray to: stream [
	"Add the supplied item, index and the item's children to the stream"

	stream nextPut: { 
		(itemTextBlock value: item) asString. 
		anArray.
		Array streamContents: [ :childStream | 
			(childrenBlock value: item) doWithIndex: [ :child :i |
				self add: child index: anArray, { i } to: childStream ] ] }
]

{ #category : #converting }
GtRemotePhlowDeclarativeTree >> asDictionaryForExport [ 

	| dictionary |

	dictionary := super asDictionaryForExport.
	self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #items put: self data ].
	^ dictionary
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTree >> children [

	^ childrenBlock
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTree >> children: aBlock [

	childrenBlock := aBlock
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTree >> data [
	"Answer the entire tree as an Array of Arrays.
	Each array is { item. index. children. }.
	index is an Array of the nested indices."

	^ Array streamContents: [ :stream |
		itemsBuilder value doWithIndex: [ :item :i |
			self add: item index: { i } to: stream ] ]
]

{ #category : #private }
GtRemotePhlowDeclarativeTree >> expand: anOrderedCollection to: selection from: aCollection [

	selection <= anOrderedCollection size ifTrue: [ ^ self ].
	aCollection do: [ :each |
		anOrderedCollection add: each.
		selection <= anOrderedCollection size ifTrue: [ ^ self ].
		self expand: anOrderedCollection to: selection from: (childrenBlock value: each).
		selection <= anOrderedCollection size ifTrue: [ ^ self ] ].

]

{ #category : #initialization }
GtRemotePhlowDeclarativeTree >> initialize [

	super initialize.
	itemTextBlock := [ :item | item ].
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTree >> itemText [

	^ itemTextBlock
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTree >> itemText: aBlock [

	itemTextBlock := aBlock
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTree >> items [

	^ itemsBuilder
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTree >> items: aBlock [

	itemsBuilder := aBlock
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTree >> sentItemAt: anArray [
	"Answer the item at the supplied index"
	| value |

	value := itemsBuilder value at: anArray first.
	anArray allButFirstDo: [ :index |
		value := (childrenBlock value: value) at: index ].
	^ value

]

{ #category : #accessing }
GtRemotePhlowDeclarativeTree >> viewName [

	^ #GtDeclarativeTree
]
