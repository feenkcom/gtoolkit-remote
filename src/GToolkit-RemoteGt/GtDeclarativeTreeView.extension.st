Extension { #name : 'GtDeclarativeTreeView' }

{ #category : '*GToolkit-RemoteGt' }
GtDeclarativeTreeView >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"

	^ aView tree
		title: title;
		priority: priority;
		items: [ self items ];
		itemText: itemTextBlock;
		children: childrenBlock";
		send: [ :item :selection | accessor gtSentItemFor: methodName at: item second ]"
]
