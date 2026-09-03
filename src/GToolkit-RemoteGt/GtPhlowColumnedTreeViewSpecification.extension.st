Extension { #name : #GtPhlowColumnedTreeViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColumnedTreeViewSpecification >> configureItemsFor: aView [
	aView
		items: [
			((GtRemoteInspectorListingBufferedStream declarativeView: self)
				collect: [ :aColumnedTreeNodeDictionary |
					self instantiateNodeFrom: aColumnedTreeNodeDictionary ]) toArray wait ]
]

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
	
	self configureBasicLocalView: currentView for: aView.
	self configureItemsFor: currentView.
	self configureColumnedViewFor: currentView.
	self configureTreeViewFor: currentView.
	self configureViewActionsFor: currentView.
	self configureViewSendFor: currentView.
	
	self expander ifNotNil: [ :anExpander |
		anExpander configurePhlowView: currentView ].
	
	^ currentView
]
