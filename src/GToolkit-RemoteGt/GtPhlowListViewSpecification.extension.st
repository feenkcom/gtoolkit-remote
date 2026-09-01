Extension { #name : #GtPhlowListViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowListViewSpecification >> configureViewActionsFor: aView [
	super configureViewActionsFor: aView.
	
	self configureDefaultRefreshActionFor: aView.
]

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
		phlowViewSpecification: self;
		items: [ (GtRemoteInspectorListingBufferedStream declarativeView: self)
			collect: [ :aNodeDictionary |
				GtRemotePhlowDataNode fromJSONDictionary: aNodeDictionary ] ];
		itemType: [ :anItemTypeFactory :aDataNode :aDataNodeIndex |
			aDataNode nodeValue isErrorItemValue
				ifTrue: [
					GtPhlowExceptionItemType
						exception: aDataNode nodeValue remoteExceptionWrapper ]
				ifFalse: [ anItemTypeFactory default ] ];
		itemText: [ :aDataNode | aDataNode nodeValue itemText ].

	self configureViewActionsFor: listView.
	self configureViewSendFor: listView.

	^ listView
]
