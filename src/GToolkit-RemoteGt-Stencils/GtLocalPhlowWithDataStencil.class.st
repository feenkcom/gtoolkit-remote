Class {
	#name : #GtLocalPhlowWithDataStencil,
	#superclass : #BrStencil,
	#instVars : [
		'stencilData'
	],
	#category : #'GToolkit-RemoteGt-Stencils'
}

{ #category : #accessing }
GtLocalPhlowWithDataStencil >> stencilData [
	^stencilData
]

{ #category : #accessing }
GtLocalPhlowWithDataStencil >> stencilData: aViewData [
	stencilData := aViewData
]
