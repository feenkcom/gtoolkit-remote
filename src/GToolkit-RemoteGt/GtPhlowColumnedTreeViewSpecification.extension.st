Extension { #name : #GtPhlowColumnedTreeViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColumnedTreeViewSpecification >> configureTreeViewFor: aTreeView [ 
	aTreeView 
		children: [ :aTreeNode |
			self ensureChildrenLoadedForNode: aTreeNode.
			aTreeNode childNodes ]
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColumnedTreeViewSpecification >> ensureChildrenLoadedForNode: aTreeNode [ 
	aTreeNode childNodes ifNotNil: [ :currentChildren |
		^ self ].
		
	aTreeNode childNodes: ((self 
		retrieveChildrenForNodeAtPath: aTreeNode nodePath) 
			collect: [ :aNodeValueDictionary |
				GtRemotePhlowTreeNode 
					fromJSONDictionary: aNodeValueDictionary ])
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColumnedTreeViewSpecification >> retrieveChildrenForNodeAtPath: aNodePath [
	^ self phlowDataSource 
		retrieveChildrenForNodeAtPath: aNodePath
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColumnedTreeViewSpecification >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"
	| currentView |
	
	currentView := aView columnedTree.
	currentView items: [
		((GtRemoteInspectorListingBufferedStream declarativeView: self)
			collect: [ :cellValuesDictionary |
				{cellValuesDictionary} collect: [ :aCellValueDictionary |
					GtRemotePhlowTreeNode 
						fromJSONDictionary: aCellValueDictionary ] ]) toArray wait ].
	
	self configureColumnedViewFor: currentView.
	self configureTreeViewFor: currentView.
	
	"currentView send: [ :arg :selection | self retriveSentItemAt: selection first ]."
	
	^ currentView
]
