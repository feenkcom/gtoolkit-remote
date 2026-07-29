Extension { #name : #GtRemotePhlowExplicitViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowExplicitViewSpecification >> viewFor: aView [
	| pictureView |
	pictureView := aView explicit
				originalView: aView;
				title: title;
				priority: priority;
				stencil: [
						| stencilSpecification newStencil |
						stencilSpecification := self retrieveStencilSpecification.
						newStencil := stencilSpecification createStencil.
						newStencil ].
	self configureViewActionsFor: pictureView.
	^pictureView
]
