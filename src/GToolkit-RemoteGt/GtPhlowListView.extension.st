Extension { #name : #GtPhlowListView }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowListView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^ GtPhlowDeclarativeListView new 
		phlowDataSource: (GtRemotePhlowDeclarativeViewListDataSource forPhlowView: self);
		title: self title;
		priority: self priority;
		dataTransport: GtPhlowDeclarativeView dataLazy.
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowListView >> asRemotePhlowDeclarativeListingType [
	^ [ itemDataBinder asRemotePhlowDeclarativeListingType ]
		on: MessageNotUnderstood
		do: [ :anError | GtPhlowDeclarativeListingType new beUnknown ]
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowListView >> canBeGtDeclarativeView [
	"Answer a boolean indicating whether the receiver can be represented as a GtDeclarativeView"

	^ self asRemotePhlowDeclarativeListingType isUnknown not
]
