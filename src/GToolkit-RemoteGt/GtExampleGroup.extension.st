Extension { #name : 'GtExampleGroup' }

{ #category : '*GToolkit-RemoteGt' }
GtExampleGroup >> runRemotely [

	^ GtPharoLinkCodeSync default runExamples: self
]
