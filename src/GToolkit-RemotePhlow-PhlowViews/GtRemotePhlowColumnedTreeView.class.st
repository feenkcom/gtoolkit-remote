"
I support a subset of the possible configurations of {{gtClass:name=GtPhlowColumnedTreeView}}.

I subclass from {{gtClass:GtRemotePhlowBasicColumnedListView}} to reuse the functionality for working with columns and duplicate the API for working with trees from {{gtClass:GtRemotePhlowTreeView}}. This happens in order to also work in GemStone where traits are not available.  Views in the Phlow version targeting the standard GT image  (subclassing {{gtClass:GtPhlowViewDecorator}}) use traits so share a common API. Since traits are not available in GemStone we rely on inheritance. We share the columns API through inheritance instead of the tree api, as the tree API is simpler and does not result in that much duplication.
"
Class {
	#name : #GtRemotePhlowColumnedTreeView,
	#superclass : #GtRemotePhlowBasicColumnedListView,
	#instVars : [
		'itemsBuilder',
		'itemTextBlock',
		'childrenBuilder'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #accessing }
GtRemotePhlowColumnedTreeView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView."

	| viewSpecification |
	
	viewSpecification := GtPhlowColumnedTreeViewSpecification new 
		title: self title;
		priority: self priority;
		phlowDataSource: (GtRemotePhlowDeclarativeViewColumnedTreeDataSource 
			forPhlowView: self);
		dataTransport: GtPhlowViewSpecification dataLazy.
		
	self configureColumnsSpecificationOn: viewSpecification.
	
	^ viewSpecification
]

{ #category : #accessing }
GtRemotePhlowColumnedTreeView >> children: aBlock [

	childrenBuilder := aBlock
]

{ #category : #accessing }
GtRemotePhlowColumnedTreeView >> childrenBuilder [

	^ childrenBuilder
]

{ #category : #accessing }
GtRemotePhlowColumnedTreeView >> expandAll [
	"To implement"
]

{ #category : #accessing }
GtRemotePhlowColumnedTreeView >> itemComputation [
	^ self itemText
]

{ #category : #accessing }
GtRemotePhlowColumnedTreeView >> itemText [

	^ itemTextBlock ifNil: [ 
		itemTextBlock := [ :item | item ] ]
]

{ #category : #accessing }
GtRemotePhlowColumnedTreeView >> itemText: aBlock [

	itemTextBlock := aBlock
]

{ #category : #accessing }
GtRemotePhlowColumnedTreeView >> items: aBlock [

	itemsBuilder := aBlock
]

{ #category : #accessing }
GtRemotePhlowColumnedTreeView >> itemsBuilder [
	^ itemsBuilder ifNil: [ 
		itemsBuilder := [ #() ] ]
]

{ #category : #accessing }
GtRemotePhlowColumnedTreeView >> itemsProviderComputation [
	^ self itemsBuilder
]
