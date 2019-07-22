Extension { #name : #GtPhlowListView }

{ #category : #'*GToolkit-Remote' }
GtPhlowListView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^GtDeclarativeList new 
		title: self title;
		priority: self priority;
		items: (self itemsBuilder value collect: [ :each | (itemStencil value: each) gtDisplayString ]) asArray;
		dataTransport: GtDeclarativeView dataLazy.

]
