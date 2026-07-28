Class {
	#name : #GtPhlowForwardStencil,
	#superclass : #GtPhlowWithDataStencil,
	#category : #'GToolkit-RemotePhlow-Stencils'
}

{ #category : #converting }
GtPhlowForwardStencil >> asGtStencilSpecification [
	^ GtRemotePhlowForwardStencilSpecification new
		stencilClassName: self stencilClassName;
		stencilData: self stencilData;
		originalStencil: self
]

{ #category : #accessing }
GtPhlowForwardStencil >> stencilClassName [
	self subclassResponsibility
]
