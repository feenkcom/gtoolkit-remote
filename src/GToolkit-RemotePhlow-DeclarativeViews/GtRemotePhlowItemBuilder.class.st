Class {
	#name : #GtRemotePhlowItemBuilder,
	#superclass : #GtRemotePhlowNodeValueBuilder,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #building }
GtRemotePhlowItemBuilder >> computeNodeValueForObject: anObject atIndex: anIndex [ 
	^ GtRemotePhlowItemValue new 
		itemText: (self 
			formatItem: anObject 
			atIndex: anIndex)
]

{ #category : #accessing }
GtRemotePhlowItemBuilder >> formatItem: anObject atIndex: rowIndex [
	^ (self phlowView 
		itemComputation cull: anObject cull: rowIndex) gtDisplayString
]
