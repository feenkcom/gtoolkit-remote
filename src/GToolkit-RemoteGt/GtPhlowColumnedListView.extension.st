Extension { #name : #GtPhlowColumnedListView }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColumnedListView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^ GtPhlowColumnedListViewSpecification new 
		phlowDataSource: (GtRemotePhlowDeclarativeViewColumnedListDataSource 
			forPhlowView: self);
		title: self title;
		priority: self priority;
		columnSpecifications: self buildRemoteColumnsSpecifications;
		horizontalScrollingEnabled: horizontalScrollingEnabled;
		dataTransport: GtPhlowViewSpecification dataLazy
]
