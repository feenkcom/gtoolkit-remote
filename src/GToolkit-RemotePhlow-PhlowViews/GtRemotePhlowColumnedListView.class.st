"
I support a subset of the possible configurations of {{gtClass:name=GtPhlowColumnedListView}}.

Current limitations:

- Only matchParent and fixed column widths are supported
"
Class {
	#name : #GtRemotePhlowColumnedListView,
	#superclass : #GtRemotePhlowBasicColumnedView,
	#instVars : [
		'horizontalScrollingEnabled'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #converting }
GtRemotePhlowColumnedListView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	| viewSpecification |
	viewSpecification := GtPhlowColumnedListViewSpecification new
		phlowDataSource: (GtRemotePhlowDeclarativeViewColumnedListDataSource
			forPhlowView: self);
		horizontalScrollingEnabled: horizontalScrollingEnabled;
		dataTransport: GtPhlowViewSpecification dataLazy.
	self configureGenericViewSpecificationOn: viewSpecification.
	self configureColumnsSpecificationOn: viewSpecification.
	^ viewSpecification
]

{ #category : #testing }
GtRemotePhlowColumnedListView >> isHorizontalScrollingEnabled [
	^ horizontalScrollingEnabled ifNil: [ false ]
]

{ #category : #'api - scripting' }
GtRemotePhlowColumnedListView >> withHorizontalScrolling [
	horizontalScrollingEnabled := true
]

{ #category : #'api - scripting' }
GtRemotePhlowColumnedListView >> withoutHorizontalScrolling [
	horizontalScrollingEnabled := false
]
