Extension { #name : #GtPhlowColumnedListViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColumnedListViewSpecification >> configureItemsFor: aView [
	aView
		items: [
			(GtRemoteInspectorListingBufferedStream declarativeView: self)
				collect: [ :aColumnedTreeNodeDictionary |
					self instantiateNodeFrom: aColumnedTreeNodeDictionary ] ]
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColumnedListViewSpecification >> extractRemoteSendObjectFromNode: aTreeNode atSelection: aSelection [ 
	^ self retriveSentItemAt: aSelection first
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColumnedListViewSpecification >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"
	| currentView |
	
	currentView := aView columnedList.
	
	self configureBasicLocalView: currentView for: aView.
	self configureItemsFor: currentView.
	self configureColumnedViewFor: currentView.
	self configureViewActionsFor: currentView.
	self configureViewSendFor: currentView.
	
	self isHorizontalScrollingEnabled
		ifTrue: [ currentView withHorizontalScrolling ]
		ifFalse: [ currentView withoutHorizontalScrolling ].

	^ currentView
]
