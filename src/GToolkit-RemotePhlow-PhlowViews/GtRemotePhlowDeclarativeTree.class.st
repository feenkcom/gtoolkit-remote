"
GtPharoDeclarativeTree maps to GtPhlowTreeView in Gt.

When transporting the data, each node in the tree is represented as an Array with three slots:
1. The item's textual representation
2. The index.  This is an array of indices to the nodes location.
3. An Array of child nodes.

"
Class {
	#name : #GtRemotePhlowDeclarativeTree,
	#superclass : #GtRemotePhlowView,
	#instVars : [
		'itemsBuilder',
		'itemTextBlock',
		'childrenBlock'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #private }
GtRemotePhlowDeclarativeTree >> add: item index: anArray to: stream [
	"Add the supplied item, index and the item's children to the stream"

	stream nextPut: { 
		(self itemText value: item) asString. 
		anArray.
		Array streamContents: [ :childStream | 
			(childrenBlock value: item) doWithIndex: [ :child :i |
				self add: child index: anArray, { i } to: childStream ] ] }
]

{ #category : #converting }
GtRemotePhlowDeclarativeTree >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^ GtPhlowDeclarativeTreeView new 
		title: self title;
		priority: self priority;
		items: (Array streamContents: [ :stream |
			self itemsBuilder value doWithIndex: [ :item :i |
				self add: item index: { i } to: stream ] ]);
		dataTransport: GtPhlowDeclarativeView dataIncluded.

]

{ #category : #accessing }
GtRemotePhlowDeclarativeTree >> children [

	^ childrenBlock
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTree >> children: aBlock [

	childrenBlock := aBlock
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
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTree >> itemText [

	^ itemTextBlock ifNil: [ 
		itemTextBlock := [ :item | item ] ]
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTree >> itemText: aBlock [

	itemTextBlock := aBlock
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTree >> items: aBlock [

	itemsBuilder := aBlock
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTree >> itemsBuilder [
	^ itemsBuilder ifNil: [ 
		itemsBuilder := [ #() ] ]
]
