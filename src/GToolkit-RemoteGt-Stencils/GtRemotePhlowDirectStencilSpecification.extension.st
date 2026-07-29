Extension { #name : #GtRemotePhlowDirectStencilSpecification }

{ #category : #'*GToolkit-RemoteGt-Stencils' }
GtRemotePhlowDirectStencilSpecification >> createStencil [
	| stencil |
	stencil := self instantiateStencil.
	stencil initializeFromJSONDictionary: self stencilData.
	^ stencil
]

{ #category : #'*GToolkit-RemoteGt-Stencils' }
GtRemotePhlowDirectStencilSpecification >> instantiateStencil [
	^(Smalltalk globals at: stencilClassName) new
]
