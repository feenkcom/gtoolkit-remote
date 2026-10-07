Extension { #name : #GtRemotePhlowNavigationAction }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowNavigationAction >> applyOn: aLocalElement [ 
	self subclassResponsibility
]

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowNavigationAction >> applyPrimaryModifierOn: aLocalElement [ 
	self applyOn: aLocalElement 
]
