Extension { #name : #GtPhlowColumnedListViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColumnedListViewSpecification >> extractRemoteSendObjectFromNode: aTreeNode atSelection: aSelection [ 
	^ self retriveSentItemAt: aSelection first
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColumnedListViewSpecification >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"
	| currentView |
	
	currentView := aView columnedList.
	currentView 
		items: [
			(GtRemoteInspectorListingBufferedStream declarativeView: self)
				collect: [ :aColumnedTreeNodeDictionary |
					self instantiateNodeFrom: aColumnedTreeNodeDictionary ] ].
	self isHorizontalScrollingEnabled 
		ifTrue: [ currentView withHorizontalScrolling ]
		ifFalse: [ currentView withoutHorizontalScrolling ].
	
	self configureColumnedViewFor: currentView.
	self configureViewSendFor: currentView.

	^ currentView
]
