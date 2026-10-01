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

	aView dynamicContextItems: [ :anElement :aNodeOrNodesCollection :aPhlowSelection |
			| currentSelection currentSpecifications retrievedActions |
				
			currentSelection := aPhlowSelection asRemoteSelection.
			
			currentSpecifications := self 
				retriveContextActionSpecificationsForPhlowSelection: currentSelection.
			
			retrievedActions := (currentSpecifications collect: [ :anActionSpecification | 
				anActionSpecification 
					actionFor: GtPhlowAction noAction]) asOrderedCollection.
			GtPhlowUtility sortByPriority: retrievedActions.
			
			retrievedActions  ]
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowListingViewSpecification >> configureViewSendFor: aView [
	aView
		send: [ :aListingNode :anIndexSelection | 
			(anIndexSelection size > 1)
				ifTrue: [  
					"For multiple selection we do not store the sent object"
					self 
						extractRemoteSendObjectFromNode: aListingNode 
						indexSelection: anIndexSelection ]
				ifFalse: [ 
					aListingNode targetObject
						ifNil: [ 
							| targetObject|
							targetObject := self 
									extractRemoteSendObjectFromNode: aListingNode 
									atSelectionIndex: anIndexSelection.
							aListingNode targetObject: targetObject ].
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
GtPhlowListingViewSpecification >> createViewSelectionFromNode: aCollectionOfNodes indexSelection: aSelectionIndexes [
	^ self hasMultipleSelection 
		ifTrue: [ 
			self 
				createViewMultipleSelectionFromNodes: aCollectionOfNodes
				selectionIndices: aSelectionIndexes ] 
		ifFalse: [
			self 
				createViewSingleSelectionFromNode: aCollectionOfNodes
				selectionIndices: aSelectionIndexes]
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowListingViewSpecification >> createViewSingleSelectionFromNode: aPhlowDataNode selectionIndices: aPhlowSelection [ 
	| viewSelection selectionItem |
	
	selectionItem := aPhlowDataNode value createSelectionItem
 		selectionIndex: (aPhlowSelection first).
 		
	viewSelection:= GtRemotePhlowListingViewSingleSelection new
 		selectionItem: selectionItem.

	^ viewSelection
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowListingViewSpecification >> extractRemoteSendObjectFromNode: aNode atSelectionIndex: aSelectionIndex [ 
	self subclassResponsibility
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowListingViewSpecification >> extractRemoteSendObjectFromNode: aNodeOrNodesCollection indexSelection: anIndexSelection [
	| viewSelection |
	viewSelection := self 
 		createViewSelectionFromNode: aNodeOrNodesCollection 
 		indexSelection: anIndexSelection.
	
	^ self retrieveSentItemAtPhlowSelection: viewSelection
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
