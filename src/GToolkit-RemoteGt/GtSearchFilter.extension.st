Extension { #name : 'GtSearchFilter' }

{ #category : '*GToolkit-RemoteGt' }
GtSearchFilter >> asRemote [

	^ GtRemoteSearchFilter filter: self
]
