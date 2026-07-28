Class {
	#name : #GtRemotePhlowStencilObjectWrapper,
	#superclass : #GtRemotePhlowStencilDataWrapper,
	#instVars : [
		'targetObject'
	],
	#category : #'GToolkit-RemotePhlow-Stencils'
}

{ #category : #'instance creation' }
GtRemotePhlowStencilObjectWrapper class >> forObject: anObject [ 
	^ self new 
		targetObject:  anObject 
]

{ #category : #accessing }
GtRemotePhlowStencilObjectWrapper >> targetObject [
	^ targetObject
]

{ #category : #accessing }
GtRemotePhlowStencilObjectWrapper >> targetObject: anObject [
	targetObject := anObject
]
