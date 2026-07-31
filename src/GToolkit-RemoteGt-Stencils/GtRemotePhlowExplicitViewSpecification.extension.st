Extension { #name : #GtRemotePhlowExplicitViewSpecification }

{ #category : #'*GToolkit-RemoteGt-Stencils' }
GtRemotePhlowExplicitViewSpecification >> retrieveStencilSpecificationWithDataSetup [
	| stencilSpecification  |
	stencilSpecification := self retrieveStencilSpecification.
	stencilSpecification handleStencilSpecificationAfterDeserializationFrom: self.
	^ stencilSpecification
]
