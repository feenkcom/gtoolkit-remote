Class {
	#name : #GtPhlowWithDataStencil,
	#superclass : #GtPhlowWithSpecificationStencil,
	#instVars : [
		'stencilData'
	],
	#category : #'GToolkit-RemotePhlow-Stencils'
}

{ #category : #'as yet unclassified' }
GtPhlowWithDataStencil >> asDictionaryForExport [
	^ self asGtStencilSpecification
]

{ #category : #accessing }
GtPhlowWithDataStencil >> stencilData [
	^ stencilData
]

{ #category : #accessing }
GtPhlowWithDataStencil >> stencilData: anObject [
	stencilData := anObject
]
