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
GtRemotePhlowNodeIdentifier class >> forTreePath: anArray [
	^ GtRemotePhlowPathNodeIdentifier new
		nodeIndexPath: anArray
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
