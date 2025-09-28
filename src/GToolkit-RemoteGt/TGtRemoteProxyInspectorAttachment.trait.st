Trait {
	#name : #TGtRemoteProxyInspectorAttachment,
	#category : #'GToolkit-RemoteGt'
}

{ #category : #'gt - inspector' }
TGtRemoteProxyInspectorAttachment >> gtActionInspectLocalProxyInspectorFor: anAction [
	<gtProxyAction>
	
	^ anAction button
		tooltip: 'Inspect the local proxy inspector for this object';
		priority: 1020;
		icon: BrGlamorousVectorIcons inspect;
		label: 'Inspector';
		action: [ :aButton |
			self localProxyInspectorDo: [ :aLocalProxyInspector |
				aButton phlow spawnObject: aLocalProxyInspector  ] ]
]

{ #category : #'gt - inspector' }
TGtRemoteProxyInspectorAttachment >> gtDefaultInspectorTool [
	"We extent the inspector by adding a custom tool showing object specific views."
	^ GtPhlowCompositeTool new
		addTool: (self gtRemoteSideInspectorTool
			name: self gtRemoteSideInspectorToolLabel;
			playgroundPageStrategy: (LeInspectorPlaygroundProxyClassPageStrategy
				forRemoteProxySide);
			withLabelAndIconAptitude);
		addTool: (super gtDefaultInspectorTool
			name: 'Proxy';
			playgroundPageStrategy: (LeInspectorPlaygroundProxyClassPageStrategy
				forLocalProxySide);
			withLabelAndIconAptitude)
]

{ #category : #'gt - inspector' }
TGtRemoteProxyInspectorAttachment >> gtRemoteSideInspectorTool [
	^ self explicitRequirement 
]

{ #category : #'gt - inspector' }
TGtRemoteProxyInspectorAttachment >> gtRemoteSideInspectorToolLabel [
	^ 'Remote'
]

{ #category : #'gt - inspector' }
TGtRemoteProxyInspectorAttachment >> localProxyInspectorDo: aBlock [
	"Evaluate the supplied block returning a GtLocalPhlowViewedObject"

	| proxyInspector |

	proxyInspector := self getLocalProxyInspector.
	^ aBlock value: proxyInspector.
]

{ #category : #'gt - inspector' }
TGtRemoteProxyInspectorAttachment >> remoteInspectorProxyDo: aBlock [
	"Evaluate the supplied block ensuring that the receiver is a GtRemotePhlowViewedObject"

	| inspectorProxy |

	inspectorProxy := self getRemoteInspectorProxy.
	inspectorProxy ifNil: [ ^ nil ].
	^ aBlock value: inspectorProxy.
]
