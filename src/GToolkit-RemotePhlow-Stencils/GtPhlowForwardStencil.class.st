Class {
	#name : #GtPhlowForwardStencil,
	#superclass : #GtPhlowWithDataStencil,
	#category : #'GToolkit-RemotePhlow-Stencils'
}

{ #category : #converting }
GtPhlowForwardStencil >> asGtStencilSpecification [
	^ super asGtStencilSpecification
		stencilClassName: self stencilClassName
]

{ #category : #accessing }
GtPhlowForwardStencil >> stencilClassName [
	self subclassResponsibility
]
