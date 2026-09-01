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
	
	self configureDefaultRefreshActionFor: aView.
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowBasicColumnedViewSpecification >> instantiateNodeFrom: aNodeValueDictionary [
	^ GtRemotePhlowColumnedTreeNode fromJSONDictionary: aNodeValueDictionary 
]
