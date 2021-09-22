Extension { #name : 'GtSearchFilter' }

{ #category : '*GToolkit-RemoteGt' }
GtSearchFilter >> runRemotely [

	^ GtPharoLinkCodeSync default runSearch: self
]
