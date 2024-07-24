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
		(aBlock 
			cull: aTreeNode targetObject
			cull: aSelectionIndices) asGtBareProxyObject ]
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowListingViewSpecification >> extractRemoteSendObjectFromNode: aTreeNode atSelection: aSelection [ 
	self subclassResponsibility
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowListingViewSpecification >> gtViewDataJSONFor: aView [
	<gtView>
	
	^ aView forward
		title: 'Data';
		priority: 15;
		object: [ GtJson
			forJsonString: (NeoJSONWriter 
				toStringPretty:  self retriveFormattedItems) ];
		view: #gtJsonStringFor:;
		actionButtonIcon: BrGlamorousVectorIcons inspect 
			label: 'Json'
			tooltip: 'Inspect the JSON object'
			action: [ :aButton |
				aButton phlow 
					spawnObject: aButton phlow forwardViewObjectFromViewAction ]
]
