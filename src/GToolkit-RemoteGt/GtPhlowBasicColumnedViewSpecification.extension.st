Extension { #name : #GtPhlowBasicColumnedViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowBasicColumnedViewSpecification >> configureColumnedViewFor: aColumnedView [

	aColumnedView 
		title: title;
		priority: priority;
		actionButtonIcon: BrGlamorousVectorIcons refresh
			tooltip: 'Update'
			action: [ :aButton :aTab | 
				phlowDataSource flushItemsIterator.
				aTab viewContentElement phlow update ].

	columnSpecifications
		withIndexDo: [ :aColumnSpecification :aColumnIndex | 
			aColumnSpecification 
				createColumnAtIndex: aColumnIndex 
				inViewSpecification: self 
				for: aColumnedView ].
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowBasicColumnedViewSpecification >> instantiateNodeFrom: aNodeValueDictionary [
	^ GtRemotePhlowColumnedTreeNode fromJSONDictionary: aNodeValueDictionary 
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowBasicColumnedViewSpecification >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"
	| currentView |
	
	currentView := aView columnedList
		items: [ (GtRemoteInspectorListingBufferedStream 
			declarativeView: self) collect: [ :cellValuesDictionary |
				cellValuesDictionary collect: [ :aCellValueDictionary |
					GtRemotePhlowItemValue 
						fromJSONDictionary: aCellValueDictionary ] ] ].
	
	self configureColumnedViewFor: currentView.
	
	^ currentView
]
