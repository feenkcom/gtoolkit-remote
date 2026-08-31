Extension { #name : #GtPhlowTreeViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTreeViewSpecification >> configureViewActionsFor: aView [
	super configureViewActionsFor: aView.
	
	self configureDefaultRefreshActionFor: aView.
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTreeViewSpecification >> ensureChildrenLoadedForNode: aTreeNode [ 
	aTreeNode childNodes ifNotNil: [ :currentChildren |
		^ self ].
		
	aTreeNode childNodes: ((self 
		retrieveChildrenForNodeAtPath: aTreeNode nodePath) 
			collect: [ :aNodeValueDictionary |
				GtRemotePhlowTreeNode 
					fromJSONDictionary: aNodeValueDictionary ])
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTreeViewSpecification >> extractRemoteSendObjectFromNode: aTreeNode atSelection: aSelection [ 
	^ self retriveSentItemAtPath: aTreeNode nodePath
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTreeViewSpecification >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"
	| treeView |
	
	treeView := aView tree
		title: title;
		priority: priority;
		phlowViewSpecification: self;
		items: [ ((GtRemoteInspectorListingBufferedStream
			declarativeView: self) collect: [ :aNodeValueDictionary |
				GtRemotePhlowTreeNode
					fromJSONDictionary: aNodeValueDictionary ]) toArray wait ];
		itemType: [ :anItemTypeFactory :aDataNode :aDataNodeIndex |
			aDataNode value nodeValue isErrorItemValue
				ifTrue: [
					GtPhlowExceptionItemType
						exception: aDataNode value nodeValue remoteExceptionWrapper ]
				ifFalse: [ anItemTypeFactory default ] ];
		itemText: [ :aTreeNode | aTreeNode nodeValue itemText ];
		children: [ :aTreeNode |
			self ensureChildrenLoadedForNode: aTreeNode.
			aTreeNode childNodes ].

	self configureViewActionsFor: treeView.
	self configureViewSendFor: treeView.
	
	^ treeView
]
