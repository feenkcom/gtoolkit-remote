Extension { #name : #GtRemotePhlowTypedStencilSpecification }

{ #category : #'*GToolkit-RemoteGt-Stencils' }
GtRemotePhlowTypedStencilSpecification >> createStencil [
	^(Smalltalk globals at: stencilClassName) new
]
