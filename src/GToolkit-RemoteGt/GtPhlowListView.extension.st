Extension { #name : 'GtPhlowListView' }

{ #category : '*GToolkit-RemoteGt' }
GtPhlowListView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^ GtDeclarativeList new 
		title: self title;
		priority: self priority;
		dataTransport: GtDeclarativeView dataLazy.
]

{ #category : '*GToolkit-RemoteGt' }
GtPhlowListView >> canBeGtDeclarativeView [
	"Answer a boolean indicating whether the receiver can be represented as a GtDeclarativeView"

	^true
]
