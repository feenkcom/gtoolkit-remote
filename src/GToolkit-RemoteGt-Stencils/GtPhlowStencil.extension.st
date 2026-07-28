Extension { #name : #GtPhlowStencil }

{ #category : #'*GToolkit-RemoteGt-Stencils' }
GtPhlowStencil >> asElement [ 
	^ self create
]

{ #category : #'*GToolkit-RemoteGt-Stencils' }
GtPhlowStencil >> create [
	^ self subclassResponsibility
]

{ #category : #'*GToolkit-RemoteGt-Stencils' }
GtPhlowStencil >> gtViewLiveIconFor: aView [
	<gtView>
	^ aView forward
		title: 'Icon';
		priority: 10;
		object: [ self asElement ];
		view: #gtLiveFor:
]
