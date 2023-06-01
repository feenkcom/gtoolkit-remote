Extension { #name : #GtPhlowColumnedListViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColumnedListViewSpecification >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"
	| currentView |
	
	currentView := aView columnedList.
	currentView items: [
		((GtRemoteInspectorListingBufferedStream declarativeView: self)
			collect: [ :aColumnedTreeNodeDictionary |
				self instantiateNodeFrom: aColumnedTreeNodeDictionary ]) ].
	
	self configureColumnedViewFor: currentView.
	
	currentView send: [ :aNode :selection | 
		aNode targetObject ifNil: [
			aNode targetObject: (self retriveSentItemAt: selection first) ].
		aNode targetObject ].
	
	^ currentView
]
