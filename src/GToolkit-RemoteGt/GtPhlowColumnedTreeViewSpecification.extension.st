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
			collect: [ :aColumnedTreeNodeDictionary |
				self instantiateNodeFrom: aColumnedTreeNodeDictionary ])
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColumnedTreeViewSpecification >> extractRemoteSendObjectFromNode: aTreeNode atSelection: aSelection [ 
	^ self retriveSentItemAtPath: aTreeNode nodePath
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColumnedTreeViewSpecification >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"
	| currentView |
	
	currentView := aView columnedTree.
	currentView items: [
		((GtRemoteInspectorListingBufferedStream declarativeView: self)
			collect: [ :aColumnedTreeNodeDictionary |
				self instantiateNodeFrom: aColumnedTreeNodeDictionary ]) toArray wait ].
	
	self configureColumnedViewFor: currentView.
	self configureTreeViewFor: currentView.
	self configureViewSendFor: currentView.
	
	^ currentView
]
