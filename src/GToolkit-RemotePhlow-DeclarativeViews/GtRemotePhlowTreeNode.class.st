Class {
	#name : #GtRemotePhlowTreeNode,
	#superclass : #GtRemotePhlowDataNode,
	#instVars : [
		'childNodes',
		'parentNode'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtRemotePhlowTreeNode class >> fromJSONDictionary: aDictionary [
	| node |

	node := super fromJSONDictionary: aDictionary.
	
	(aDictionary at: 'childNodes' ifAbsent: [ nil ])
			ifNotNil: [ :childDataArray |
				node childNodes: (childDataArray collect: [ :aChildData |
					self fromJSONDictionary: aChildData ])].
	^ node
]

{ #category : #enumerating }
GtRemotePhlowTreeNode >> allChildrenNodesBreadthFirstDo: aBlock [
	| queue next |
	queue := LinkedList new.
	queue addAll: (self childNodes ifNil: [ #() ]).
	[ queue notEmpty ]
		whileTrue: [ next := queue removeFirst.
			aBlock value: next.
			queue addAll: (next childNodes ifNil: [ #() ]) ]
]

{ #category : #converting }
GtRemotePhlowTreeNode >> asDictionaryForExport [
	| exportDictionary  |
	exportDictionary := super asDictionaryForExport.

	self childNodes ifNotNil: [ :aCollection |
		exportDictionary 
			at: #childNodes 
			put: (aCollection
				collect: [ :aChildNode | aChildNode asDictionaryForExport ])].
	
	^ exportDictionary
]

{ #category : #accessing }
GtRemotePhlowTreeNode >> childNodes [
	^ childNodes
]

{ #category : #accessing }
GtRemotePhlowTreeNode >> childNodes: aCollectionOfNodes [
	aCollectionOfNodes do: [ :aChildNode | 
		aChildNode parentNode ifNotNil: [ 
			Error signal: 'Parent must be nil.' ].
		aChildNode parentNode: self ].
	
	childNodes := aCollectionOfNodes.
]

{ #category : #enumerating }
GtRemotePhlowTreeNode >> childrenNodesDo: aBlock [
	(self childNodes ifNil: [#()]) do: aBlock
]

{ #category : #accessing }
GtRemotePhlowTreeNode >> depth [
	| depthValue |
	depthValue := 0.
	self parentNodesDo: [ depthValue := depthValue + 1].
	^ depthValue
]

{ #category : #expanding }
GtRemotePhlowTreeNode >> expandSuchThat: aBlock withDataSource: aTreeDataSource [
	"It stops expanding children if a parent node does not satisfy the condition."
	(aBlock cull: self cull: self targetObject) ifTrue: [ 
		aTreeDataSource ensureChildrenForNode: self.
		self childrenNodesDo: [ :eachNode | 
			eachNode expandSuchThat: aBlock withDataSource: aTreeDataSource ] ].
]

{ #category : #expanding }
GtRemotePhlowTreeNode >> expandUpTo: aLevelIndex withDataSource: aDataSource [
	self depth < aLevelIndex ifFalse: [ ^ self ].
	
	self 
		upToDepth: aLevelIndex
		do: [ :eachNode | 
			aDataSource ensureChildrenForNode: eachNode ]
]

{ #category : #'gt - extensions' }
GtRemotePhlowTreeNode >> gtViewChildrenFor: aView [ 
	<gtView>
	childNodes ifNil: [ ^ aView empty ].
	
	^ aView columnedTree
		title: 'Child Nodes';
		items: [ childNodes ];
		children: [ :aNode | 
			aNode childNodes ifNil: [ #() ] ];
		column: 'Path' text: [ :aNode | 
			aNode nodePathDescription  ] width: 100;
		column: 'Id' text: [ :aNode | aNode nodeId ] width: 100;
		column: 'Value' text: [ :aNode | aNode nodeValue ]
]

{ #category : #testing }
GtRemotePhlowTreeNode >> hasChildNodesData [
	^ childNodes notNil
]

{ #category : #comparing }
GtRemotePhlowTreeNode >> matchesNodeContentWith: aNode [
	(super matchesNodeContentWith: aNode) ifFalse: [ ^ false ].
	
	(self parentNode
		ifNil: [ aNode parentNode isNil ]
		ifNotNil: [ :aParentNode |
			aParentNode matchesNodeContentWith: aNode parentNode ]) ifFalse: [ ^ false ].
			
	self childNodes 
		ifNil: [ ^ aNode childNodes isNil ].
	self childNodes size = aNode childNodes size ifFalse: [ ^ false ].
	
	self childNodes withIndexDo: [ :aChildNode :anIndex |
		(aChildNode matchesNodeContentWith: (aNode childNodes at: anIndex))
			ifFalse: [ ^ false ] ].
			
	^ true
]

{ #category : #accessing }
GtRemotePhlowTreeNode >> nodePath [
	^ Array streamContents: [ :aStream | 
		  self withParentNodesDo: [ :eachNode | aStream nextPut: eachNode nodeId ] ] 
]

{ #category : #accessing }
GtRemotePhlowTreeNode >> nodePathDescription [
	^ String streamContents: [ :aStream |
		self printNodePathOn: aStream ]
]

{ #category : #accessing }
GtRemotePhlowTreeNode >> parentNode [
	^ parentNode
]

{ #category : #accessing }
GtRemotePhlowTreeNode >> parentNode: anObject [
	parentNode := anObject
]

{ #category : #enumerating }
GtRemotePhlowTreeNode >> parentNodesDo: aBlock [
	self parentNode ifNotNil: [ :aParentNode | 
		aParentNode withParentNodesDo: aBlock ].
]

{ #category : #printing }
GtRemotePhlowTreeNode >> printNodePathOn: aStream [
	self nodePath 
		do: [:elem | aStream nextPutAll: elem asString]
		separatedBy: [aStream nextPutAll: '/'] 
]

{ #category : #printing }
GtRemotePhlowTreeNode >> printOn: aStream [
	super printOn: aStream.
	
	aStream parenthesize: [ 
		self nodePath 
			do: [:elem | aStream nextPutAll: elem asString]
			separatedBy: [aStream nextPutAll: '/'] ]
]

{ #category : #enumerating }
GtRemotePhlowTreeNode >> upToDepth: aMaxDepthLevel do: anOneArgBlock [

	self withAllChildrenNodesBreadthFirstDo: [ :eachNode | 
		eachNode depth >= aMaxDepthLevel
			ifTrue: [ ^ self ].
		anOneArgBlock value: eachNode ]
]

{ #category : #enumerating }
GtRemotePhlowTreeNode >> withAllChildrenNodesBreadthFirstDo: aBlock [ 
	aBlock value: self.
	self allChildrenNodesBreadthFirstDo: aBlock
]

{ #category : #enumerating }
GtRemotePhlowTreeNode >> withParentNodesDo: aBlock [
	self parentNodesDo: aBlock.
	aBlock cull: self
]
