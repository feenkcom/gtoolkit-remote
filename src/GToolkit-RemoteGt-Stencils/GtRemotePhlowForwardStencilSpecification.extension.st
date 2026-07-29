Extension { #name : #GtRemotePhlowForwardStencilSpecification }

{ #category : #'*GToolkit-RemoteGt-Stencils' }
GtRemotePhlowForwardStencilSpecification >> createStencil [
	| stencil |
	stencil := self instantiateStencil.
	stencil stencilData: self stencilData.
	^ stencil
]

{ #category : #'*GToolkit-RemoteGt-Stencils' }
GtRemotePhlowForwardStencilSpecification >> initializeForGemStoneStencilSpecification: aGemStoneProxy [
	| retrieveStencilData|
	retrieveStencilData := aGemStoneProxy retrieveStencilData.
	retrieveStencilData isPhlowErrorData ifTrue: [ 
		retrieveStencilData beRemoteException ].
	self stencilData: retrieveStencilData.
]

{ #category : #'*GToolkit-RemoteGt-Stencils' }
GtRemotePhlowForwardStencilSpecification >> instantiateStencil [
	^(Smalltalk globals at: stencilClassName) new
]
