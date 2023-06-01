Class {
	#name : #GtRemotePhlowTreeNode,
	#superclass : #GtRemotePhlowDataNode,
	#instVars : [
		'childNodes',
		'parentNode'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

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

{ #category : #traversing }
GtRemotePhlowTreeNode >> withParentNodesDo: aBlock [

	self parentNode ifNotNil: [ :aParentNode | 
		aParentNode withParentNodesDo: aBlock ].

	aBlock cull: self
]
