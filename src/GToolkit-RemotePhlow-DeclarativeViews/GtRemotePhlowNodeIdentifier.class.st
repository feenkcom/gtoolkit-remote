Class {
	#name : #GtRemotePhlowNodeIdentifier,
	#superclass : #GtPhlowDeclarativeSpecification,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtRemotePhlowNodeIdentifier class >> forListIndex: anInteger [
	^ GtRemotePhlowIndexNodeIdentifier new
		nodeIndex: anInteger
]

{ #category : #'instance creation' }
GtRemotePhlowNodeIdentifier class >> forListIndexes: aCollectionOfIntegers [
	^ GtRemotePhlowCompositeNodeIdentifier new
		nodeIdentifiers: (aCollectionOfIntegers collect: [ :each |
			self forListIndex: each ])
]

{ #category : #'instance creation' }
GtRemotePhlowNodeIdentifier class >> forTreePath: anArray [
	^ GtRemotePhlowPathNodeIdentifier new
		nodeIndexPath: anArray
]

{ #category : #'instance creation' }
GtRemotePhlowNodeIdentifier class >> forTreePaths: aCollectionOfArrays [
	^ GtRemotePhlowCompositeNodeIdentifier new
		nodeIdentifiers: (aCollectionOfArrays collect: [ :each |
			self forTreePath: each ])
]

{ #category : #printing }
GtRemotePhlowNodeIdentifier >> description [
	^ String streamContents: [ :aStream |
		self descriptionOn: aStream ]
]

{ #category : #printing }
GtRemotePhlowNodeIdentifier >> descriptionOn: aStream [
	self subclassResponsibility
]

{ #category : #testing }
GtRemotePhlowNodeIdentifier >> isCompositeNodeIdentifier [
	^ false
]

{ #category : #enumerating }
GtRemotePhlowNodeIdentifier >> nodeIdentifiersDo: aBlock [
	self subclassResponsibility
]
