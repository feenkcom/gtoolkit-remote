Trait {
	#name : #TGtRemoteProxySpecificViews,
	#category : #'GToolkit-RemoteGt'
}

{ #category : #'gt - extensions' }
TGtRemoteProxySpecificViews >> gtMetaFor: aView [
	<gtProxy>

	^ super gtMetaFor: aView
]

{ #category : #'gt - extensions' }
TGtRemoteProxySpecificViews >> gtPrintFor: aView [
	<gtProxy>

	^ super gtPrintFor: aView
]

{ #category : #'gt - extensions' }
TGtRemoteProxySpecificViews >> gtRawFor: aView [
	<gtProxy>

	^ super gtRawFor: aView
]
