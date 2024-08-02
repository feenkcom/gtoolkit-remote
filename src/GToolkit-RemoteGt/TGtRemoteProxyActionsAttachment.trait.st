Trait {
	#name : #TGtRemoteProxyActionsAttachment,
	#category : #'GToolkit-RemoteGt'
}

{ #category : #'gt - actions' }
TGtRemoteProxyActionsAttachment >> declarativeActionSpecifications [
	"Answer the views for the receiver"
	| actionSpecifications |

	actionSpecifications := #().
	self localProxyInspectorDo: [ :remoteInspectorProxy |
		actionSpecifications := remoteInspectorProxy
			currentDeclarativeActionSpecifications ].

	^ actionSpecifications
]

{ #category : #'gt - actions' }
TGtRemoteProxyActionsAttachment >> gtActionsInContext: aContext [
	"Change the actions of the proxy object to only those annotated with gtProxy."
	
	^ self gtLocalProxyActionsForLocalSideInContext: aContext
]

{ #category : #'gt - actions' }
TGtRemoteProxyActionsAttachment >> gtLocalProxyActionsForLocalSideInContext: aPhlowContext [ 

	^ GtPhlowActionsCollector new
		fromObject: self;
		context: aPhlowContext;
		pragmaName: #gtProxyAction;
		collect.
]

{ #category : #'gt - actions' }
TGtRemoteProxyActionsAttachment >> gtLocalProxyActionsForRemoteSideInContext: aContext [
	"Get from the proxy object only those actions annotated with gtAction."
	
	^ GtPhlowActionsCollector new
		fromObject: self;
		context: aContext;
		pragmaName: #gtAction;
		collect.
]
