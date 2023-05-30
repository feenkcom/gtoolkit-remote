"
GtPharoDeclarativeTree maps to GtPhlowTreeView in Gt.

When transporting the data, each node in the tree is represented as an Array with three slots:
1. The item's textual representation
2. The index.  This is an array of indices to the nodes location.
3. An Array of child nodes.

"
Class {
	#name : #GtRemotePhlowTreeView,
	#superclass : #GtRemotePhlowView,
	#instVars : [
		'itemsBuilder',
		'itemTextBlock',
		'childrenBlock'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #private }
GtRemotePhlowTreeView >> add: item index: anArray to: stream [
	"Add the supplied item, index and the item's children to the stream"

	stream nextPut: { 
		(self itemText value: item) asString. 
		anArray.
		Array streamContents: [ :childStream | 
			(childrenBlock value: item) doWithIndex: [ :child :i |
				self add: child index: anArray, { i } to: childStream ] ] }
]

{ #category : #converting }
GtRemotePhlowTreeView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^ GtPhlowTreeViewSpecification new 
		title: self title;
		priority: self priority;
		items: (Array streamContents: [ :stream |
			self itemsBuilder value doWithIndex: [ :item :i |
				self add: item index: { i } to: stream ] ]);
		dataTransport: GtPhlowViewSpecification dataIncluded.

]

{ #category : #accessing }
GtRemotePhlowTreeView >> children [

	^ childrenBlock
]

{ #category : #accessing }
GtRemotePhlowTreeView >> children: aBlock [

	childrenBlock := aBlock
]

{ #category : #private }
GtRemotePhlowTreeView >> expand: anOrderedCollection to: selection from: aCollection [

	selection <= anOrderedCollection size ifTrue: [ ^ self ].
	aCollection do: [ :each |
		anOrderedCollection add: each.
		selection <= anOrderedCollection size ifTrue: [ ^ self ].
		self expand: anOrderedCollection to: selection from: (childrenBlock value: each).
		selection <= anOrderedCollection size ifTrue: [ ^ self ] ].

]

{ #category : #initialization }
GtRemotePhlowTreeView >> initialize [

	super initialize.
]

{ #category : #accessing }
GtRemotePhlowTreeView >> itemText [

	^ itemTextBlock ifNil: [ 
		itemTextBlock := [ :item | item ] ]
]

{ #category : #accessing }
GtRemotePhlowTreeView >> itemText: aBlock [

	itemTextBlock := aBlock
]

{ #category : #accessing }
GtRemotePhlowTreeView >> items: aBlock [

	itemsBuilder := aBlock
]

{ #category : #accessing }
GtRemotePhlowTreeView >> itemsBuilder [
	^ itemsBuilder ifNil: [ 
		itemsBuilder := [ #() ] ]
]
