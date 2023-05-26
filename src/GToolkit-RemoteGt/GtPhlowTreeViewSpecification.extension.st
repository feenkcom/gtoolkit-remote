Extension { #name : #GtPhlowTreeViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTreeViewSpecification >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"

	^ aView tree
		title: title;
		priority: priority;
		items: [ self items ];
		itemText: itemTextBlock;
		children: childrenBlock";
		send: [ :item :selection | accessor gtSentItemFor: methodName at: item second ]"
]
