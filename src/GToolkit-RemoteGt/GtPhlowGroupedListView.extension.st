Extension { #name : #GtPhlowGroupedListView }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowGroupedListView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^ GtPhlowListViewSpecification new 
		phlowDataSource: (GtRemotePhlowDeclarativeViewListDataSource forPhlowView: self);
		title: self title;
		priority: self priority;
		dataTransport: GtPhlowViewSpecification dataLazy.
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowGroupedListView >> asRemotePhlowDeclarativeListingType [
	^ [ itemDataBinder asRemotePhlowDeclarativeListingType ]
		on: MessageNotUnderstood
		do: [ :anError | GtPhlowDeclarativeListingType unknown ]
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowGroupedListView >> canBeGtDeclarativeView [
	"Answer a boolean indicating whether the receiver can be represented as a GtDeclarativeView"

	^ self asRemotePhlowDeclarativeListingType isUnknown not
]
