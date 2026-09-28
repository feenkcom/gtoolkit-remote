Extension { #name : #GtRemotePhlowNavigationUpdateCurrentToolAction }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowNavigationUpdateCurrentToolAction >> applyOn: aLocalElement [ 
	aLocalElement phlow fireCurrentToolUpdateWish
]
