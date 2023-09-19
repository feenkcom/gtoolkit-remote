Extension { #name : #GtPhlowListViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowListViewSpecification >> extractRemoteSendObjectFromNode: aTreeNode atSelection: aSelection [ 
	^ self retriveSentItemAt: aSelection first
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowListViewSpecification >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"

	| listView |

	listView := aView list 
		title: title;
		priority: priority;
		items: [ (GtRemoteInspectorListingBufferedStream declarativeView: self)
			collect: [ :aNodeDictionary |
				GtRemotePhlowDataNode fromJSONDictionary: aNodeDictionary ] ];
		itemType: [ :anItemTypeFactory :aDataNode :aDataNodeIndex | 
			aDataNode nodeValue isErrorItemValue
				ifTrue: [
					GtPhlowExceptionItemType 
						exception: aDataNode nodeValue remoteExceptionWrapper ]
				ifFalse: [ anItemTypeFactory default ] ];
		itemText: [ :aDataNode | aDataNode nodeValue itemText ];
		actionButtonIcon: BrGlamorousVectorIcons refresh 
			tooltip: 'Update'
			action: [ :aButton :aTab | 
				phlowDataSource flushItemsIterator.
				aTab viewContentElement phlow update ].
				
	self configureViewSendFor: listView.
	
	^listView
]
