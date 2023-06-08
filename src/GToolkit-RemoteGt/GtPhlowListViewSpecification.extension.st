Extension { #name : #GtPhlowListViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowListViewSpecification >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"

	| list |

	list := aView list 
		title: title;
		priority: priority;
		items: [ (GtRemoteInspectorListingBufferedStream declarativeView: self)
			collect: [ :aNodeDictionary |
				GtRemotePhlowDataNode fromJSONDictionary: aNodeDictionary ] ];
		itemText: [ :aDataNode | aDataNode nodeValue itemText ];
		send: [ :aNode :selection | 
			aNode targetObject ifNil: [
				aNode targetObject: (self 
					retriveSentItemAt: selection first) asGtBareProxyObject ].
			aNode targetObject ];
		actionButtonIcon: BrGlamorousVectorIcons refresh 
			tooltip: 'Update'
			action: [ :aButton :aTab | 
				phlowDataSource flushItemsIterator.
				aTab viewContentElement phlow update ].
	^list
]
