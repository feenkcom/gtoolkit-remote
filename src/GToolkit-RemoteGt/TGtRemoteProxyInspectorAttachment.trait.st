Trait {
	#name : #TGtRemoteProxyInspectorAttachment,
	#category : #'GToolkit-RemoteGt'
}

{ #category : #accessing }
TGtRemoteProxyInspectorAttachment >> gtDefaultInspectorTool [
	"We extent the inspector by adding a custom tool showing object specific views."
	^ GtPhlowCompositeTool new
		addTool: (self gtRemoteSideInspectorTool
			name: 'Remote';
			playgroundPageStrategy: (LeInspectorPlaygroundProxyClassPageStrategy
				forRemoteProxySide);
			withLabelAndIconAptitude);
		addTool: (super gtDefaultInspectorTool
			name: 'Proxy';
			playgroundPageStrategy: (LeInspectorPlaygroundProxyClassPageStrategy
				forLocalProxySide);
			withLabelAndIconAptitude)
]

{ #category : #accessing }
TGtRemoteProxyInspectorAttachment >> gtRemoteInspectorTargetObject [
	^ self explicitRequirement
]

{ #category : #accessing }
TGtRemoteProxyInspectorAttachment >> gtRemoteSideInspectorTool [
	^ GtInspectorTool 
		forObject: self 
		viewSelector: #gtRemoteViewsFor: 
]

{ #category : #accessing }
TGtRemoteProxyInspectorAttachment >> gtRemoteViewsFor: aView [
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

{ #category : #accessing }
TGtRemoteProxyInspectorAttachment >> localProxyInspectorDo: aBlock [
	"Evaluate the supplied block returning a GtLocalPhlowViewedObject"

	| proxyInspector |

	proxyInspector := self getLocalProxyInspector.
	^ aBlock value: proxyInspector.
]

{ #category : #accessing }
TGtRemoteProxyInspectorAttachment >> remoteInspectorProxyDo: aBlock [
	"Evaluate the supplied block ensuring that the receiver is a GtRemotePhlowViewedObject"

	| viewProxy |

	viewProxy := self getRemoteInspectorProxy.
	^ aBlock value: viewProxy.
]
