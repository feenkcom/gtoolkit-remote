Extension { #name : 'GtPhlowDeclarativeTableView' }

{ #category : '*GToolkit-RemoteGt' }
GtPhlowDeclarativeTableView >> viewFor: aView [
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
