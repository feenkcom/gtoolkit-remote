Class {
	#name : #GtRemotePhlowStencilComputationWrapper,
	#superclass : #GtRemotePhlowStencilDataWrapper,
	#instVars : [
		'objectComputation'
	],
	#category : #'GToolkit-RemotePhlow-Stencils'
}

{ #category : #'instance creation' }
GtRemotePhlowStencilComputationWrapper class >> forComputation: aBlockClosure [
	^ self new 
		objectComputation:aBlockClosure
]

{ #category : #accessing }
GtRemotePhlowStencilComputationWrapper >> objectComputation: anObject [
	objectComputation := anObject
]

{ #category : #'as yet unclassified' }
GtRemotePhlowStencilComputationWrapper >> targetObject [
	^ objectComputation value
]
