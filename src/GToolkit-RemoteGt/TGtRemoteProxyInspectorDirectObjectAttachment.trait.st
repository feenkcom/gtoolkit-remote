Trait {
	#name : #TGtRemoteProxyInspectorDirectObjectAttachment,
	#traits : 'TGtRemoteProxyInspectorAttachment',
	#classTraits : 'TGtRemoteProxyInspectorAttachment classTrait',
	#category : #'GToolkit-RemoteGt'
}

{ #category : #'as yet unclassified' }
TGtRemoteProxyInspectorDirectObjectAttachment >> gtInspectorRemoteSideTitleStringOn: aStream [ 
	"As we attach views directly to the proxy object it needs to provide this method"
	self explicitRequirement 
]

{ #category : #'gt - inspector' }
TGtRemoteProxyInspectorDirectObjectAttachment >> gtRemoteInspectorTargetObject [
	"Views are obtained directly from the current object"
	^ self
]
