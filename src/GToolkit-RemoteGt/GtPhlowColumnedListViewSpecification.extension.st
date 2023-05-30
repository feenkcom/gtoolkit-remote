Extension { #name : #GtPhlowColumnedListViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColumnedListViewSpecification >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"
	| currentView |
	
	currentView := aView columnedList
		items: [ (GtRemoteInspectorListingBufferedStream declarativeView: self)
			collect: [ :cellValuesDictionary |
				cellValuesDictionary collect: [ :aCellValueDictionary |
					GtRemotePhlowItemValue fromJSONDictionary: aCellValueDictionary ] ] ].
	
	self configureColumnedViewFor: currentView.
	
	currentView send: [ :arg :selection | self retriveSentItemAt: selection first ].
	
	^ currentView
]
