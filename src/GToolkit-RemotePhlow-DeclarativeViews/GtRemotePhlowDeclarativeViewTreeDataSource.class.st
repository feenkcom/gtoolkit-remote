Class {
	#name : #GtRemotePhlowDeclarativeViewTreeDataSource,
	#superclass : #GtRemotePhlowDeclarativeViewListingDataSource,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #accessing }
GtRemotePhlowDeclarativeViewTreeDataSource >> buildChildNodesFor: aNode [ 
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
GtRemotePhlowDeclarativeViewTreeDataSource >> buildChildrenForNode: aNode atPath: aNodePath [
	self ensureChildrenForNode: aNode.
	aNodePath isEmpty ifTrue: [ 
		^ aNode childNodes ].
		
	^ self 
		buildChildrenForNode: (aNode childNodes at: aNodePath first)
		atPath: aNodePath copyWithoutFirst
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewTreeDataSource >> ensureChildrenForNode: aNode [ 
	aNode childNodes ifNotNil: [ ^ self ].
	
	aNode childNodes: (self buildChildNodesFor: aNode)
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewTreeDataSource >> instantiateNode [
	^ GtRemotePhlowTreeNode new
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewTreeDataSource >> locateNode: aNode atPath: aNodePath [
	aNodePath isEmpty ifTrue: [ 
		^ aNode ].
		
	^ self 
		locateNode: (aNode childNodes at: aNodePath first)
		atPath: aNodePath copyWithoutFirst
]

{ #category : #'api - data retrival' }
GtRemotePhlowDeclarativeViewTreeDataSource >> retrieveChildrenForNodeAtPath: aNodePath [
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

{ #category : #'api - data retrival' }
GtRemotePhlowDeclarativeViewTreeDataSource >> retriveSentItemAtPath: aNodePath [
	self 
		forNodesFrom: aNodePath first 
		to: aNodePath first 
		withIndexDo: [ :aNode |
			^ (self 
				locateNode: aNode 
				atPath: aNodePath copyWithoutFirst) targetObject ].
	^ nil
]
