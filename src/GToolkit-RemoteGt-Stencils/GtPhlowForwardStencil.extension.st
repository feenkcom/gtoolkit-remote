Extension { #name : #GtPhlowForwardStencil }

{ #category : #'*GToolkit-RemoteGt-Stencils' }
GtPhlowForwardStencil >> create [
	| stencilSpecification stencil |
	stencilSpecification := self asGtStencilSpecification.
	stencil := stencilSpecification createStencil. 
	^ stencil asElement
]
