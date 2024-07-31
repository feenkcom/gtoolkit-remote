Trait {
	#name : #TGtRemoteProxyInspectorAttachment,
	#category : #'GToolkit-RemoteGt'
}

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
TGtRemoteProxyInspectorAttachment >> gtRemoteInspectorContentFor: aView [
	"This is the default entry method for retrieving the wrapper view containing all non-proxy views for the object."
	<return: #GtPhlowLabelledView>
	
	^ GtPhlowLabelledViewBuilder new
		object: self gtRemoteInspectorTargetObject;
		view: aView;
		context: GtPhlowContext new;
		viewsSelector: #gtViewsForRemoteSideInContext:;
		actionsSelector: #gtActionsForRemoteSideInContext:;
		titleComputation: [ :anObject |
			String streamContents: [ :aStream |
				anObject gtInspectorRemoteSideTitleStringOn: aStream ] ];
		build 
]

{ #category : #'gt - inspector' }
TGtRemoteProxyInspectorAttachment >> gtRemoteInspectorTargetObject [
	^ self explicitRequirement
]

{ #category : #'gt - inspector' }
TGtRemoteProxyInspectorAttachment >> gtRemoteSideInspectorTool [
	^ GtInspectorTool 
		forObject: self 
		viewSelector: #gtRemoteInspectorContentFor: 
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
