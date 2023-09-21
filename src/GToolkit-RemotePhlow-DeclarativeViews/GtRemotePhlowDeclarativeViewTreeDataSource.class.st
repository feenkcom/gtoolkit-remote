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
		atPath: aNodePath allButFirst
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
		atPath: aNodePath allButFirst
]

{ #category : #'api - data retrival' }
GtRemotePhlowDeclarativeViewTreeDataSource >> retrieveChildrenForNodeAtPath: aNodePath [
	self 
		forNodesFrom: aNodePath first 
		to: aNodePath first 
		withIndexDo: [ :aNode |
			^ (self 
				buildChildrenForNode: aNode 
				atPath: aNodePath allButFirst)
					collect: [ :aNodeValue |
						aNodeValue asDictionaryForExport ] ].
	^ #()
]

{ #category : #'api - data retrival' }
GtRemotePhlowDeclarativeViewTreeDataSource >> retrieveSentItemAtPath: aNodePath [
	self 
		forNodesFrom: aNodePath first 
		to: aNodePath first 
		withIndexDo: [ :aNode :aSelectionIndex |
			| targetNode targetObject |
			targetNode := self 
				locateNode: aNode 
				atPath: aNodePath allButFirst.
			targetObject := targetNode targetObject.
			^ self phlowView transformation 
				transformedValueFrom: targetObject
				selection: aSelectionIndex ].
	^ nil
]

{ #category : #'api - data retrival' }
GtRemotePhlowDeclarativeViewTreeDataSource >> retriveSentItemAtPath: aNodePath [
	self 
		forNodesFrom: aNodePath first 
		to: aNodePath first 
		withIndexDo: [ :aNode :aSelectionIndex |
			| targetNode targetObject |
			targetNode := self 
				locateNode: aNode 
				atPath: aNodePath allButFirst.
			targetObject := targetNode targetObject.
			^ self phlowView transformation 
				transformedValueFrom: targetObject
				selection: aSelectionIndex ].
	^ nil
]
