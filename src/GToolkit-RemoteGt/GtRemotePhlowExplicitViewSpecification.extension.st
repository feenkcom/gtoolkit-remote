Extension { #name : #GtRemotePhlowExplicitViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowExplicitViewSpecification >> configureViewActionsFor: aView [
	super configureViewActionsFor: aView.
	
	self configureDefaultRefreshActionFor: aView.
]

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowExplicitViewSpecification >> createDeclarativeContentStencil [
	| stencilSpecification newStencil |
	stencilSpecification := self retrieveStencilSpecificationWithDataSetup.
	newStencil := stencilSpecification createStencil.
	^ newStencil
]

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowExplicitViewSpecification >> viewFor: aView [
	| explicitView |
	
	explicitView := aView explicit.
	
	self configureBasicLocalView: explicitView for: aView.
	self configureViewActionsFor: explicitView.
	
	explicitView 
		stencil: [ self createDeclarativeContentStencil ].
	
	^explicitView
]
