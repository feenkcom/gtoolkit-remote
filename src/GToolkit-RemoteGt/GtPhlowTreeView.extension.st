Extension { #name : #GtPhlowTreeView }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTreeView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView."

	^ GtPhlowTreeViewSpecification new 
		title: self title;
		priority: self priority;
		phlowDataSource: (GtRemotePhlowDeclarativeViewColumnedTreeDataSource 
			forPhlowView: self);
		dataTransport: GtPhlowViewSpecification dataLazy
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTreeView >> canBeGtDeclarativeView [
	"Answer a boolean indicating whether the receiver can be represented as a GtDeclarativeView"

	^ true
]
