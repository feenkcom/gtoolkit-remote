Extension { #name : #BrMenuItemGroupConfiguration }

{ #category : #'*GToolkit-RemoteGt' }
BrMenuItemGroupConfiguration >> asRemotePhlowMenuItemGroupConfiguration [
	^ GtRemotePhlowMenuItemGroupConfiguration new
		name: self name;
		priority: self priority
]
