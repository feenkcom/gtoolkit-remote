Class {
	#name : #GtLocalPhlowExceptionStencil,
	#superclass : #GtLocalPhlowWithDataStencil,
	#category : #'GToolkit-RemoteGt-Stencils'
}

{ #category : #converting }
GtLocalPhlowExceptionStencil >> create [
	^ self stencilData asDebuggableElement
]
