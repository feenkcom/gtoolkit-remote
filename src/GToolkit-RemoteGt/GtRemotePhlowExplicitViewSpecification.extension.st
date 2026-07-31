Extension { #name : #GtRemotePhlowExplicitViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowExplicitViewSpecification >> configureViewActionsFor: aView [
	super configureViewActionsFor: aView.
	
	self configureDefaultRefreshActionFor: aView.
]

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowExplicitViewSpecification >> viewFor: aView [
	| pictureView |
	pictureView := aView explicit
				originalView: aView;
				title: title;
				priority: priority;
				stencil: [
						| stencilSpecification newStencil |
						stencilSpecification := self retrieveStencilSpecificationWithDataSetup.
						newStencil := stencilSpecification createStencil.
						newStencil ].
	self configureViewActionsFor: pictureView.
	^pictureView
]
