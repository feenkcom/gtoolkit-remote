Class {
	#name : #GtPhlowWithDataStencil,
	#superclass : #GtPhlowWithSpecificationStencil,
	#instVars : [
		'stencilData'
	],
	#category : #'GToolkit-RemotePhlow-Stencils'
}

{ #category : #accessing }
GtPhlowWithDataStencil >> initializeFromStencilSpecification: aStencilSpecification [
	self stencilData: aStencilSpecification stencilData.
]

{ #category : #accessing }
GtPhlowWithDataStencil >> stencilData [
	^ stencilData
]

{ #category : #accessing }
GtPhlowWithDataStencil >> stencilData: anObject [
	stencilData := anObject
]
