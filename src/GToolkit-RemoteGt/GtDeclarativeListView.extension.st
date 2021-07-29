Extension { #name : 'GtDeclarativeListView' }

{ #category : '*GToolkit-RemoteGt' }
GtDeclarativeListView >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"

	| list |

	list := aView lazyList 
		title: title;
		priority: priority;
		itemsProvider: [ self "phlowDataSource" ];
		send: [ :arg :selection | 
			self "phlowDataSource" retriveSentItemAt: selection first ].
	^list
]
