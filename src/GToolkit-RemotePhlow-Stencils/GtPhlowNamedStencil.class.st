Class {
	#name : #GtPhlowNamedStencil,
	#superclass : #GtPhlowForwardStencil,
	#instVars : [
		'stencilClassName',
		'stencilDataWrapper'
	],
	#category : #'GToolkit-RemotePhlow-Stencils'
}

{ #category : #accessing }
GtPhlowNamedStencil >> asGtStencilSpecification [
	^ super asGtStencilSpecification
		originalStencilData: self stencilData;
		originalStencil: self
]

{ #category : #accessing }
GtPhlowNamedStencil >> stencilClassName [
	^ stencilClassName
]

{ #category : #accessing }
GtPhlowNamedStencil >> stencilClassName: anObject [
	stencilClassName := anObject
]

{ #category : #accessing }
GtPhlowNamedStencil >> stencilData [
	^ stencilData ifNil: [
		 stencilData := stencilDataWrapper targetObject ]
]

{ #category : #accessing }
GtPhlowNamedStencil >> stencilData: anObject [
	stencilDataWrapper := GtRemotePhlowStencilObjectWrapper forObject: anObject
]

{ #category : #accessing }
GtPhlowNamedStencil >> stencilDataComputation: aBlockClosure [
	stencilDataWrapper := GtRemotePhlowStencilComputationWrapper forComputation: aBlockClosure
]
