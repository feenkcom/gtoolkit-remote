Trait {
	#name : #TGtRemoteProxyActionsAttachment,
	#category : #'GToolkit-RemoteGt'
}

{ #category : #accessing }
TGtRemoteProxyActionsAttachment >> declarativeActionSpecifications [
	"Answer the views for the receiver"
	| actionSpecifications |

	actionSpecifications := #().
	self localProxyInspectorDo: [ :remoteInspectorProxy |
		actionSpecifications := remoteInspectorProxy
			currentDeclarativeActionSpecifications ].

	^ actionSpecifications
]

{ #category : #accessing }
TGtRemoteProxyActionsAttachment >> gtActionsInContext: aContext [
	"Change the actions of the proxy object to only those annotated with gtProxy."
	
	^ self gtLocalProxyActionsForLocalSideInContext: aContext
]

{ #category : #accessing }
TGtRemoteProxyActionsAttachment >> gtLocalProxyActionsForLocalSideInContext: aPhlowContext [ 

	^ GtPhlowActionsCollector new
		fromObject: self;
		context: aPhlowContext;
		pragmaName: #gtProxyAction;
		collect.
]

{ #category : #accessing }
TGtRemoteProxyActionsAttachment >> gtLocalProxyActionsForRemoteSideInContext: aContext [
	"Get from the proxy object only those actions annotated with gtAction."
	
	^ GtPhlowActionsCollector new
		fromObject: self;
		context: aContext;
		pragmaName: #gtAction;
		collect.
]
