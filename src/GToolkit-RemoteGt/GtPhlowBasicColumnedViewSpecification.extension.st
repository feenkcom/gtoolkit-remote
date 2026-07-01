Extension { #name : #GtPhlowBasicColumnedViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowBasicColumnedViewSpecification >> configureColumnedViewFor: aColumnedView [

	columnSpecifications
		withIndexDo: [ :aColumnSpecification :aColumnIndex | 
			aColumnSpecification 
				createColumnAtIndex: aColumnIndex 
				inViewSpecification: self 
				for: aColumnedView ].
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowBasicColumnedViewSpecification >> configureViewActionsFor: aView [
	super configureViewActionsFor: aView.
	
	aView
		actionButtonIcon: BrGlamorousVectorIcons refresh
		id: GtPhlowViewRefreshContentButtonId
		tooltip: 'Update'
		action: [ :aButton :aTab | 
			phlowDataSource flushItemsIterator.
			aTab phlow fireViewUpdateWish ]
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowBasicColumnedViewSpecification >> instantiateNodeFrom: aNodeValueDictionary [
	^ GtRemotePhlowColumnedTreeNode fromJSONDictionary: aNodeValueDictionary 
]
