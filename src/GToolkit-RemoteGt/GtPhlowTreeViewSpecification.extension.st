Extension { #name : #GtPhlowTreeViewSpecification }

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
GtPhlowTreeViewSpecification >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"
	| treeView |
	
	treeView := aView tree
		title: title;
		priority: priority;
		items: [ ((GtRemoteInspectorListingBufferedStream 
			declarativeView: self) collect: [ :aNodeValueDictionary |
				GtRemotePhlowTreeNode 
					fromJSONDictionary: aNodeValueDictionary ]) toArray wait ];
		itemText: [ :aTreeNode | aTreeNode nodeValue itemText ];
		children: [ :aTreeNode |
			self ensureChildrenLoadedForNode: aTreeNode.
			aTreeNode childNodes ];
		actionButtonIcon: BrGlamorousVectorIcons refresh
			tooltip: 'Update'
			action: [ :aButton :aTab | 
				phlowDataSource flushItemsIterator.
				aTab viewContentElement phlow update ].
	
	treeView send: [ :aTreeNode  | 
		aTreeNode targetObject ifNil: [
			aTreeNode targetObject: (self retriveSentItemAtPath: aTreeNode nodePath) ].
		aTreeNode targetObject ].
	
	^ treeView
]
