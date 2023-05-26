Extension { #name : #GtPhlowListViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowListViewSpecification >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"

	| list |

	list := aView list 
		title: title;
		priority: priority;
		items: [ GtRemoteInspectorListingBufferedStream declarativeView: self ];
		send: [ :arg :selection | 
			self retriveSentItemAt: selection first ];
		actionButtonIcon: BrGlamorousVectorIcons refresh 
			tooltip: 'Update'
			action: [ :aButton :aTab | 
				phlowDataSource flushItemsIterator.
				aTab viewContentElement phlow update ].
	^list
]
