Class {
	#name : #GtPhlowWithDataStencil,
	#superclass : #GtPhlowStencil,
	#instVars : [
		'stencilData'
	],
	#category : #'GToolkit-RemotePhlow-Stencils'
}

{ #category : #accessing }
GtPhlowWithDataStencil >> stencilData [
	^ stencilData
]

{ #category : #accessing }
GtPhlowWithDataStencil >> stencilData: anObject [
	stencilData := anObject
]
