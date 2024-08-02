Trait {
	#name : #TGtRemoteProxySpecificViews,
	#category : #'GToolkit-RemoteGt'
}

{ #category : #'gt - extensions' }
TGtRemoteProxySpecificViews >> gtMetaFor: aView [
	<gtProxyView>

	^ super gtMetaFor: aView
]

{ #category : #'gt - extensions' }
TGtRemoteProxySpecificViews >> gtPrintFor: aView [
	<gtProxyView>

	^ super gtPrintFor: aView
]

{ #category : #'gt - extensions' }
TGtRemoteProxySpecificViews >> gtRawFor: aView [
	<gtProxyView>

	^ super gtRawFor: aView
]
