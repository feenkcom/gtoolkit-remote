"
GtPharoDeclarativeTree maps to GtPhlowTreeView in Gt.

When transporting the data, each node in the tree is represented as an Array with three slots:
1. The item's textual representation
2. The index.  This is an array of indices to the nodes location.
3. An Array of child nodes.

"
Class {
	#name : #GtRemotePhlowTreeView,
	#superclass : #GtRemotePhlowListingView,
	#instVars : [
		'itemTextBlock',
		'childrenBuilder'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #converting }
GtRemotePhlowTreeView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView."

	^ GtPhlowTreeViewSpecification new 
		title: self title;
		priority: self priority;
		phlowDataSource: (GtRemotePhlowDeclarativeViewTreeDataSource 
			forPhlowView: self);
		dataTransport: GtPhlowViewSpecification dataLazy
]

{ #category : #accessing }
GtRemotePhlowTreeView >> children: aBlock [

	childrenBuilder := aBlock
]

{ #category : #accessing }
GtRemotePhlowTreeView >> childrenBuilder [

	^ childrenBuilder
]

{ #category : #accessing }
GtRemotePhlowTreeView >> defaultItemsComputation [
	^ [ #() ]
]

{ #category : #accessing }
GtRemotePhlowTreeView >> expandAll [
	"To implement"
]

{ #category : #accessing }
GtRemotePhlowTreeView >> itemComputation [
	^ self itemText
]

{ #category : #accessing }
GtRemotePhlowTreeView >> itemText [

	^ itemTextBlock ifNil: [ 
		itemTextBlock := [ :item | item ] ]
]

{ #category : #'api - scripting' }
GtRemotePhlowTreeView >> itemText: aBlock [

	itemTextBlock := aBlock
]

{ #category : #accessing }
GtRemotePhlowTreeView >> itemsBuilder [
	^ self itemsProviderComputation
]
