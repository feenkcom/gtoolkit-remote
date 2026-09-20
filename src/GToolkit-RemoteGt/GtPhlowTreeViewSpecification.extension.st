Extension { #name : #GtPhlowTreeViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTreeViewSpecification >> configureItemsFor: aView [
	aView
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
			aTreeNode childNodes ]
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
GtPhlowTreeViewSpecification >> extractRemoteSendObjectFromNode: aNode atSelectionIndex: aSelectionIndex [ 
	^ self retrieveSentItemAtPath: aNode nodePath
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTreeViewSpecification >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"
	| treeView |
	
	treeView := aView tree.
	
	self configureBasicLocalView: treeView for: aView. 
	self configureListingView: treeView. 
	self configureItemsFor: treeView.
	self configureViewActionsFor: treeView.
	self configureViewSendFor: treeView.
	
	self expander ifNotNil: [ :anExpander |
		anExpander configurePhlowView: treeView].
	
	^ treeView
]
