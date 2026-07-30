Class {
	#name : #GtPhlowWithDataStencil,
	#superclass : #GtPhlowWithSpecificationStencil,
	#instVars : [
		'stencilData',
		'dataSerializationStrategy'
	],
	#category : #'GToolkit-RemotePhlow-Stencils'
}

{ #category : #accessing }
GtPhlowWithDataStencil >> dataSerializationStrategy [
	^ dataSerializationStrategy
]

{ #category : #accessing }
GtPhlowWithDataStencil >> dataSerializationStrategy: anObject [
	dataSerializationStrategy := anObject
]

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
