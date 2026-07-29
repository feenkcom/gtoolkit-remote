Extension { #name : #GtPhlowExplicitView }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowExplicitView >> asGtDeclarativeView [
	| viewSpecification |
	viewSpecification := (GtRemotePhlowExplicitViewSpecification new)
				phlowDataSource: (GtRemotePhlowDeclarativeExplicitViewDataSource
							forPhlowView: self);
				dataTransport: GtPhlowViewSpecification dataLazy.
	self configureGenericViewSpecificationOn: viewSpecification.
	^viewSpecification
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowExplicitView >> canBeGtDeclarativeView [
	^ stencilBuilder isPhlowDeclarativeStencilBuilder
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowExplicitView >> computePhlowStencil [
	^ stencilBuilder build
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowExplicitView >> declarativeStencil: aStencilBuilder [
	stencilBuilder := aStencilBuilder asPhlowDeclarativeStencilBuilder
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowExplicitView >> localStencilName: aStencilClassName stencilData: aBlockClosure [
	self declarativeStencil: [
		GtPhlowNamedStencil new
				stencilClassName: aStencilClassName;
				stencilDataComputation: aBlockClosure ]
]
