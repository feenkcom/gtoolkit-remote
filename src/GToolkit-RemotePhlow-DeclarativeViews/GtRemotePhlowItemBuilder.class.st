Class {
	#name : #GtRemotePhlowItemBuilder,
	#superclass : #GtRemotePhlowNodeValueBuilder,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #building }
GtRemotePhlowItemBuilder >> basicComputeNodeValueForObject: anObject atIndex: anIndex [ 
	^ GtRemotePhlowItemTextualValue new 
		itemText: (self 
			formatItem: anObject 
			atIndex: anIndex)
]

{ #category : #building }
GtRemotePhlowItemBuilder >> computeNodeValueForObject: anObject atIndex: anIndex [ 
	^ self withErrorHandlingCompute: [ 
		self basicComputeNodeValueForObject: anObject atIndex: anIndex ] 
]

{ #category : #accessing }
GtRemotePhlowItemBuilder >> formatItem: anObject atIndex: rowIndex [
	^ (self phlowView 
		itemComputation cull: anObject cull: rowIndex) gtDisplayString
]
