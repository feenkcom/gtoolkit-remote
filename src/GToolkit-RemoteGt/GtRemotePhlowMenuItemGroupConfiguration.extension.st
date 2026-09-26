Extension { #name : #GtRemotePhlowMenuItemGroupConfiguration }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowMenuItemGroupConfiguration >> asMenuItemGroupConfiguration [
	^ BrMenuItemGroupConfiguration new
		name: self name;
		priority: self priority
]
