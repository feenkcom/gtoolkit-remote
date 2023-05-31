Class {
	#name : #GtRemotePhlowNodeValueBuilder,
	#superclass : #Object,
	#instVars : [
		'phlowView'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #accessing }
GtRemotePhlowNodeValueBuilder >> computeNodeValueForObject: anObject atIndex: anIndex [ 
	self subclassResponsibility
]

{ #category : #accessing }
GtRemotePhlowNodeValueBuilder >> phlowView [
	^ phlowView
]

{ #category : #accessing }
GtRemotePhlowNodeValueBuilder >> phlowView: anObject [
	phlowView := anObject
]
