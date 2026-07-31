Extension { #name : #GtPhlowStencil }

{ #category : #'*GToolkit-RemoteGt-Stencils' }
GtPhlowStencil >> asElement [ 
	^ self create
]

{ #category : #'*GToolkit-RemoteGt-Stencils' }
GtPhlowStencil >> create [
	^ self subclassResponsibility
]
