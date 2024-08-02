Trait {
	#name : #TGtRemoteProxySpecificActions,
	#category : #'GToolkit-RemoteGt'
}

{ #category : #'gt - extensions' }
TGtRemoteProxySpecificActions >> gtActionBrowseFor: anAction [
	<gtProxyAction>

	^ super gtActionBrowseFor: anAction
]

{ #category : #'gt - extensions' }
TGtRemoteProxySpecificActions >> gtActionInspectFor: anAction [
	<gtProxyAction>

	^ super gtActionInspectFor: anAction
]
