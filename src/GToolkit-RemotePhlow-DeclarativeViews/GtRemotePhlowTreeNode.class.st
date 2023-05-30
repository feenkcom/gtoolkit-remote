Class {
	#name : #GtRemotePhlowTreeNode,
	#superclass : #GtRemotePhlowDataNode,
	#instVars : [
		'childNodes',
		'parentNode'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #accessing }
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
		self assert: aChildNode parentNode isNil.
		aChildNode parentNode: self ].
	
	childNodes := aCollectionOfNodes.
]

{ #category : #accessing }
GtRemotePhlowTreeNode >> nodePath [
	^ Array streamContents: [ :aStream | 
		  self withParentNodesDo: [ :eachNode | aStream nextPut: eachNode nodeId ] ] 
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
GtRemotePhlowTreeNode >> printOn: aStream [
	super printOn: aStream.
	
	aStream parenthesize: [ 
		self nodePath 
			do: [:elem | aStream nextPutAll: elem asString]
			separatedBy: [aStream nextPutAll: '/'] ]
]

{ #category : #accessing }
GtRemotePhlowTreeNode >> withParentNodesDo: aBlock [

	self parentNode ifNotNil: [ :aParentNode | 
		aParentNode withParentNodesDo: aBlock ].

	aBlock cull: self
]
