Class {
	#name : #GtRemotePhlowDeclarativeViewListingDataSource,
	#superclass : #GtRemotePhlowDeclarativeViewDataSource,
	#instVars : [
		'itemsIterator',
		'cachedNodes',
		'cachedValueBuilder'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'api - data retrival' }
GtRemotePhlowDeclarativeViewListingDataSource >> bareRetrieveSentItemAtPhlowSelectionData: aPhlowSelectionData [
	| phlowSelection |
	phlowSelection := GtRemotePhlowListingViewSelection fromDictionary: aPhlowSelectionData.
	^ self retrieveSentItemAtPhlowSelection: phlowSelection
]

{ #category : #'api - data retrival' }
GtRemotePhlowDeclarativeViewListingDataSource >> bareRetriveContextActionSpecificationsForPhlowSelectionData: aPhlowSelectionData [
	| phlowSelection |
	phlowSelection := GtRemotePhlowListingViewSelection fromDictionary: aPhlowSelectionData.
	^ (self retriveContextActionSpecificationsForPhlowSelection: phlowSelection)
			ifNotNil: [ :actions |
				actions collect: [ :anAction |
					anAction asDictionaryForExportWithPhlowDataSource ] ]
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewListingDataSource >> buildMainNodeForObject: anObject atIndex: anIndex [ 
	^ self buildNodeForObject: anObject atIndex: anIndex 
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewListingDataSource >> buildNodeForObject: anObject atIndex: anIndex [ 
	^ self instantiateNode
		targetObject: anObject;
		nodeId: anIndex;
		nodeValue: (self 
			computeNodeValueForObject: anObject 
			atIndex: anIndex)
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewListingDataSource >> cachedNodes [
	^ cachedNodes ifNil: [
		cachedNodes := OrderedCollection new ]
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewListingDataSource >> computeNodeValueForObject: anObject atIndex: anIndex [ 
	^ self valueBuilder 
		computeNodeValueForObject: anObject 
		atIndex: anIndex 
]

{ #category : #api }
GtRemotePhlowDeclarativeViewListingDataSource >> flushItemsIterator [
	"Flush the items iterator to force the displayed values to be regenerated"

	itemsIterator := nil.
	cachedNodes := nil.
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewListingDataSource >> forNodesFrom: aStartIndex to: anEndIndex withIndexDo: aBlock [
	| startIndex stopIndex |
	
	"The interval of nodes that need to be computed and send back to the client"
	startIndex := 1 max: aStartIndex.
	stopIndex  := self itemsIterator totalItemsCount min: anEndIndex.
	
	"Increase the size of the cache to ensure that it can hold all nodes, if required."
	self cachedNodes size + 1 to: stopIndex do: [ :index |
		self cachedNodes add: nil ].
	
	"Iterate over the given interval, 
	and create the nodes that do not have already a cached value."
	self itemsIterator 
		forElementsFrom: startIndex 
		to: stopIndex 
		withIndexDo: [ :anObject :anIndex | 
			(self cachedNodes at: anIndex) ifNil: [
					| newValueNode |
					newValueNode := self 
						buildMainNodeForObject: anObject atIndex: anIndex.
					self cachedNodes at: anIndex put: newValueNode ].
			aBlock cull: (self cachedNodes at: anIndex) cull: anIndex ]
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewListingDataSource >> formatItem: anObject atIndex: anIndex [
	self subclassResponsibility
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewListingDataSource >> gtViewCachedNodesFor: aView [ 
	<gtView>
	cachedNodes ifNil: [ ^ aView empty ].
	
	^ aView columnedTree
		title: 'Cached Nodes';
		items: [ cachedNodes ];
		children: [ :aNode | 
			aNode childNodes ifNil: [ #() ] ];
		column: 'Id' text: [ :aNode | aNode nodeId ];
		column: 'Value' text: [ :aNode | aNode nodeValue ]
]

{ #category : #'gt - extensions' }
GtRemotePhlowDeclarativeViewListingDataSource >> instantiateNode [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewListingDataSource >> instantiateValueBuilder [
	^ GtRemotePhlowItemBuilder new
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewListingDataSource >> itemsIterator [
	^ itemsIterator ifNil: [ 
		itemsIterator := self phlowView 
			itemsProviderComputation value asGPhlowItemsIterator ]
]

{ #category : #'api - data retrival' }
GtRemotePhlowDeclarativeViewListingDataSource >> retrieveItems: anItemsCount fromIndex: startIndex [
	| computedNodes endIndex |

	computedNodes := OrderedCollection new: anItemsCount.
	endIndex := startIndex + anItemsCount - 1.
	
	self 
		forNodesFrom: startIndex 
		to: endIndex 
		withIndexDo: [ :aNode |
			computedNodes add: aNode ].
	
	^ computedNodes asArray collect: [ :aNodeValue |
		aNodeValue asDictionaryForExport ]
]

{ #category : #'api - data retrival' }
GtRemotePhlowDeclarativeViewListingDataSource >> retrieveSentItemAt: aSelectionIndex [
	"Answer the raw value at the supplied index"
	
	self  
		forNodesFrom: aSelectionIndex 
		to: aSelectionIndex 
		withIndexDo: [ :aNode :anItemIndex |
			^ self phlowView transformation 
				transformedValueFrom: aNode targetObject
				selection: aSelectionIndex ].
	^ nil
]

{ #category : #'api - data retrival' }
GtRemotePhlowDeclarativeViewListingDataSource >> retrieveSentItemAtPhlowSelection: aPhlowSelection [ 
	| targetNodes targetObjects |
	
	targetNodes := OrderedCollection new.
	self withNodesInPhlowSelection: aPhlowSelection do: [ :aNode |
		targetNodes add: aNode ].
	targetNodes ifEmpty: [ ^ nil ].
	
	targetObjects := targetNodes collect: [ :aNode | aNode targetObject ].
	
	^ self phlowView transformation 
			transformedValueFrom: ((targetObjects size > 1)
				ifTrue: [ Array withAll: targetObjects ]
				ifFalse: [ targetObjects first ])
			selection: (aPhlowSelection selectionIndex) 
]

{ #category : #'api - data retrival' }
GtRemotePhlowDeclarativeViewListingDataSource >> retrieveTotalItemsCount [
	^ self itemsIterator totalItemsCount
]

{ #category : #'api - data retrival' }
GtRemotePhlowDeclarativeViewListingDataSource >> retriveContextActionSpecificationsForPhlowSelection: aPhlowSelection [
	| targetNodes targetObjects |
	
	targetNodes := OrderedCollection new.
	self withNodesInPhlowSelection: aPhlowSelection do: [ :aNode |
		targetNodes add: aNode ].
	targetNodes ifEmpty: [ ^ nil ].
	
	targetObjects := targetNodes collect: [ :aNode | aNode targetObject ].
	
	^ (self phlowView 	
			collectIndividualContextMenuActionsForElement: nil 
			item: (aPhlowSelection isMultipleSelection
				ifTrue: [ Array withAll: targetObjects ]
				ifFalse: [ targetObjects first  ])
			viewSelection: aPhlowSelection) collect: [ :anAction |
				anAction asGtDeclarativeAction ].
]

{ #category : #'api - data retrival' }
GtRemotePhlowDeclarativeViewListingDataSource >> retriveSentItemAt: aSelectionIndex [
	"Answer the raw value at the supplied index"
	
	self  
		forNodesFrom: aSelectionIndex 
		to: aSelectionIndex 
		withIndexDo: [ :aNode :anItemIndex |
			^ self phlowView transformation 
				transformedValueFrom: aNode targetObject
				selection: (Array with: aSelectionIndex) ].
	^ nil
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewListingDataSource >> valueBuilder [
	^ cachedValueBuilder ifNil: [
		cachedValueBuilder := self instantiateValueBuilder
			phlowView:  self phlowView]
]

{ #category : #'api - data retrival' }
GtRemotePhlowDeclarativeViewListingDataSource >> withNodeAtAtPath: aNodePath ifPresent: aPresentBlock ifAbsent: anAbsentBlock [
	self 
		forNodesFrom: aNodePath first 
		to: aNodePath first 
		withIndexDo: [ :aNode :aSelectionIndex |
			^ aPresentBlock cull: aNode cull: aSelectionIndex ].
	^ anAbsentBlock value
]

{ #category : #'api - data retrival' }
GtRemotePhlowDeclarativeViewListingDataSource >> withNodesInPhlowSelection: aPhlowSelection do: aBlock [
	aPhlowSelection selectionItemsDo: [ :aSelectionItem |
		self 
			withNodeAtAtPath: aSelectionItem nodeIdentifier nodeIndexPath 
			ifPresent: [ :targetNode :aSelectionIndex |
				aBlock cull: targetNode cull: aSelectionItem selectionIndex ]  
			ifAbsent: [  ]. ].
]
