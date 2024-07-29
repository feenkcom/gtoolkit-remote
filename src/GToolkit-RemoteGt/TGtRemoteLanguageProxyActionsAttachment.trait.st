Trait {
	#name : #TGtRemoteLanguageProxyActionsAttachment,
	#category : #'GToolkit-RemoteGt'
}

{ #category : #accessing }
TGtRemoteLanguageProxyActionsAttachment >> declarativeActionSpecifications [
	"Answer the views for the receiver"
	| actionSpecifications |

	actionSpecifications := #().
	self proxyInspectorDo: [ :remoteInspectorProxy |
		actionSpecifications := remoteInspectorProxy
			currentDeclarativeActionsSpecifications ].

	^ actionSpecifications
]

{ #category : #accessing }
TGtRemoteLanguageProxyActionsAttachment >> filterLocalProxyActions: localActions [ 
	"When showing local actions for the object, we remove all actions where the method is annotated with #gtProxyAction. Those actions will only be shown for the proxy object."
	^ localActions reject: [ :each |
		each definingMethod compiledMethod 
			hasPragmaNamed: #gtProxyAction ].
]

{ #category : #accessing }
TGtRemoteLanguageProxyActionsAttachment >> gtActionsForRemoteSideInContext: aContext [
	"This collects all actions for the current object. This excludes the proxy-specific actions (annotated with #gtProxyAction), and includes all remote actions for the object, as well as all custom actions defined locally"
 
	| localActions collectedActions |
	
	"Get the actions using the super call. 
	This will use #gtAction to compute the list of actions for the local object."
	localActions := super gtActionsInContext: aContext.
	
	collectedActions := OrderedCollection new
		addAll: (self filterLocalProxyActions: localActions);
		addAll: (self 
			remoteActionsFor: GtPhlowNoAction new
			inContext: aContext);
		yourself.
	GtPhlowUtility sortByPriority: collectedActions.
	
	^ collectedActions
]

{ #category : #accessing }
TGtRemoteLanguageProxyActionsAttachment >> gtActionsInContext: aContext [
	"Change the actions of the proxy object to only those annotated with gtProxy."
	
	^ GtPhlowActionsCollector new
		fromObject: self;
		context: aContext;
		pragmaName: #gtProxyAction;
		collect.
]
