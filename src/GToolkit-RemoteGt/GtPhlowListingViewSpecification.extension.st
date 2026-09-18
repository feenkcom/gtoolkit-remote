Extension { #name : #GtPhlowListingViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowListingViewSpecification >> configureListingView: aView [
	self hasMultipleSelection
		ifTrue: [ aView withMultipleSelection ] 
		ifFalse: [ aView withoutMultipleSelection ].
		
	self configureViewContextMenuActionsFor: aView.
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowListingViewSpecification >> configureViewActionsFor: aView [
	super configureViewActionsFor: aView.
	
	self configureDefaultRefreshActionFor: aView.
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowListingViewSpecification >> configureViewContextMenuActionsFor: aView [
	self hasContextActionSpecifications ifFalse: [ ^ self ].

	self hasMultipleSelection 
	
		ifTrue: [
			aView dynamicContextItems: [ :anElement :anObject :aMultipleSelection |
				| currentSelection currentSpecifications |
				currentSelection := GtPhlowListingViewSelection forMultipleListIndexes:aMultipleSelection.
				currentSpecifications := self retriveContextActionSpecificationsForPhlowSelection: currentSelection.
				
				currentSpecifications collect: [ :anActionSpecification | 
					anActionSpecification 
						actionFor: GtPhlowAction noAction]  ] ] 
				
		ifFalse: [
			aView dynamicContextItems: [ :anElement :anObject :aSingleSelection |
				| currentSelection currentSpecifications |
				
				currentSelection := GtPhlowListingViewSelection forSingleListIndex:aSingleSelection.
				currentSpecifications := self 
					retriveContextActionSpecificationsForPhlowSelection: currentSelection.
			
				currentSpecifications collect: [ :anActionSpecification | 
					anActionSpecification 
						actionFor: GtPhlowAction noAction] ] ].
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowListingViewSpecification >> configureViewSendFor: aView [
	aView
		send: [ :aListingNode :anIndexSelection | 
			(anIndexSelection size > 1)
				ifTrue: [ self halt. 
					"For multiple selection we do not store the object returned by the send logic"
					(self 
							extractRemoteSendObjectFromNodePath: (aListingNode 
								collect: [ :each | each value nodePath ]) 
							atPhlowSelection: (self 
								createMultipleSelectionForSelectionIndex: anIndexSelection)
							indexSelection: anIndexSelection)
									asGtBareProxyObject]
				ifFalse: [ 
					"Even for multiple selection we handle the case 
					of a single selection the same way."
					self halt.
					aListingNode targetObject
						ifNil: [ 
							aListingNode
								targetObject: (self 
									extractRemoteSendObjectFromNode: aListingNode 
									atSelectionIndex: anIndexSelection) asGtBareProxyObject ].
					aListingNode targetObject ] ]
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowListingViewSpecification >> configureViewSendFor: aView withLocalTransformation: aBlock [
	aView send: [ :aTreeNode :aSelectionIndices | 
		aTreeNode targetObject ifNil: [
			aTreeNode targetObject: (self 
				extractRemoteSendObjectFromNode: aTreeNode 
				atSelectionIndex: aSelectionIndices) asGtBareProxyObject ].
		(aBlock 
			cull: aTreeNode targetObject
			cull: aSelectionIndices) asGtBareProxyObject ]
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowListingViewSpecification >> extractRemoteSendObjectFromNode: aNode atSelectionIndex: aSelectionIndex [ 
	self subclassResponsibility
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowListingViewSpecification >> extractRemoteSendObjectFromNodePath: aNodePath atPhlowSelection: aPhlowSelection indexSelection: anIndexSelection [
 
	^ self 
			retriveSentItemAtPath: aNodePath
			forPhlowSelection: aPhlowSelection
			indexSelection: anIndexSelection
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
