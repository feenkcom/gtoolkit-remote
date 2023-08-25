Extension { #name : #GtPhlowColumnedTreeView }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColumnedTreeView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^ GtPhlowColumnedTreeViewSpecification new 
		phlowDataSource: (GtRemotePhlowDeclarativeViewColumnedTreeDataSource 
			forPhlowView: self);
		title: self title;
		priority: self priority;
		columnSpecifications: self buildRemoteColumnsSpecifications;
		dataTransport: GtPhlowViewSpecification dataLazy
]
