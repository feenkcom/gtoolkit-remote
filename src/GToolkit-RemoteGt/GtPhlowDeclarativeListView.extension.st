Extension { #name : #GtPhlowDeclarativeListView }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowDeclarativeListView >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"

	| list |

	list := aView list 
		title: title;
		priority: priority;
		items: [ GtRemoteInspectorListingBufferedStream declarativeView: self ];
		send: [ :arg :selection | 
			self retriveSentItemAt: selection first ].
	^list
]
