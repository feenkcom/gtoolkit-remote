Extension { #name : 'GtDeclarativeTableView' }

{ #category : '*GToolkit-RemoteGt' }
GtDeclarativeTableView >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"

	| table |

	table := aView table 
		title: title;
		priority: priority;
		items: [ self items ];
		forCollectionOfCollection.
	"table
		send: [ :arg :selection | accessor gtSentItemFor: methodName at: selection from ]."
	^table
]
