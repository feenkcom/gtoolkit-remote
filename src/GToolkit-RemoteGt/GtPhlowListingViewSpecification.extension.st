Extension { #name : #GtPhlowListingViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowListingViewSpecification >> configureViewSendFor: aView [ 
	aView send: [ :aTreeNode :aSelection  | 
		aTreeNode targetObject ifNil: [
			aTreeNode targetObject: (self 
				extractRemoteSendObjectFromNode: aTreeNode 
				atSelection: aSelection) asGtBareProxyObject ].
		aTreeNode targetObject ]
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowListingViewSpecification >> configureViewSendFor: aView withLocalTransformation: aBlock [
	aView send: [ :aTreeNode :aSelectionIndices | 
		aTreeNode targetObject ifNil: [
			aTreeNode targetObject: (self 
				extractRemoteSendObjectFromNode: aTreeNode 
				atSelection: aSelectionIndices) asGtBareProxyObject ].
		aBlock 
			cull: aTreeNode targetObject
			cull: aSelectionIndices ]
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowListingViewSpecification >> extractRemoteSendObjectFromNode: aTreeNode atSelection: aSelection [ 
	self subclassResponsibility
]
