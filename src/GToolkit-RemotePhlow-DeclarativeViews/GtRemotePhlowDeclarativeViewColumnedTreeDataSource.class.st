Class {
	#name : #GtRemotePhlowDeclarativeViewColumnedTreeDataSource,
	#superclass : #GtRemotePhlowDeclarativeViewListingDataSource,
	#instVars : [
		'cachedNodes'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #accessing }
GtRemotePhlowDeclarativeViewColumnedTreeDataSource >> buildChildNodesFor: aNode [ 
	| childNodes |
	
	childNodes := OrderedCollection new.
	(self phlowView 
		childrenBuilder cull: aNode targetObject) 
			withIndexDo: [ :anObject :anIndex | 
				childNodes add: (self 
					buildNodeForObject: anObject 
					atIndex: anIndex) ].
		
	^ childNodes asArray
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewColumnedTreeDataSource >> buildChildrenForNode: aNode atPath: aNodePath [
	self ensureChildrenForNode: aNode.
	aNodePath isEmpty ifTrue: [ 
		^ aNode childNodes ].
		
	^ self 
		buildChildrenForNode: (aNode childNodes at: aNodePath first)
		atPath: aNodePath copyWithoutFirst
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewColumnedTreeDataSource >> buildNodeForObject: anObject atIndex: anIndex [ 
	^ GtRemotePhlowTreeNode new 
		targetObject: anObject;
		nodeId: anIndex;
		nodeValue: (self 
			computeNodeValueForObject: anObject 
			atIndex: anIndex)
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewColumnedTreeDataSource >> buildNodeWithChildrenForObject: anObject atIndex: anIndex [ 
	^ self buildNodeForObject: anObject atIndex: anIndex 
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewColumnedTreeDataSource >> cachedNodes [
	^ cachedNodes ifNil: [
		cachedNodes := OrderedCollection new ]
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewColumnedTreeDataSource >> computeNodeValueForObject: anObject atIndex: anIndex [ 
	^ GtRemotePhlowItemValue new 
		itemText: (self 
			formatItem: anObject 
			atIndex: anIndex)
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewColumnedTreeDataSource >> ensureChildrenForNode: aNode [ 
	aNode childNodes ifNotNil: [ ^ self ].
	
	aNode childNodes: (self buildChildNodesFor: aNode)
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewColumnedTreeDataSource >> forNodesFrom: aStartIndex to: anEndIndex withIndexDo: aBlock [
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
						buildNodeWithChildrenForObject: anObject atIndex: anIndex.
					self cachedNodes at: anIndex put: newValueNode ].
			aBlock cull: (self cachedNodes at: anIndex) cull: anIndex ]
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewColumnedTreeDataSource >> formatItem: anObject atIndex: rowIndex [
	^ (self phlowView 
		itemComputation cull: anObject cull: rowIndex) gtDisplayString
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewColumnedTreeDataSource >> gtViewCachedNodesFor: aView [ 
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

{ #category : #accessing }
GtRemotePhlowDeclarativeViewColumnedTreeDataSource >> retrieveChildrenForNodeAtPath: aNodePath [
	self 
		forNodesFrom: aNodePath first 
		to: aNodePath first 
		withIndexDo: [ :aNode |
			^ (self 
				buildChildrenForNode: aNode 
				atPath: aNodePath copyWithoutFirst)
					collect: [ :aNodeValue |
						aNodeValue asDictionaryForExport ] ].
	^ #()
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewColumnedTreeDataSource >> retrieveItems: anItemsCount fromIndex: startIndex [
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
