Extension { #name : #TestSuite }

{ #category : #'*GToolkit-RemoteGt' }
TestSuite >> gtRunRemotely [

	^ GtPharoLinkCodeSync default runTests: self
]
