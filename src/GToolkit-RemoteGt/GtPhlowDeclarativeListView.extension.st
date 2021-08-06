Extension { #name : #GtPhlowDeclarativeListView }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowDeclarativeListView >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"

	| list |

	list := aView lazyList 
		title: title;
		priority: priority;
		itemsProvider: [ self ];
		send: [ :arg :selection | 
			self retriveSentItemAt: selection first ].
	^list
]
