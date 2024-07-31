Trait {
	#name : #TGtRemoteBareProxyInspectorAttachment,
	#category : #'GToolkit-RemoteGt'
}

{ #category : #accessing }
TGtRemoteBareProxyInspectorAttachment >> filterLocalProxyActions: localActions [ 
	"When showing local actions for the object, we remove all actions where the method is annotated with #gtProxyAction. Those actions will only be shown for the proxy object."
	^ localActions reject: [ :each |
		each definingMethod compiledMethod 
			hasPragmaNamed: #gtProxyAction ].
]

{ #category : #accessing }
TGtRemoteBareProxyInspectorAttachment >> filterLocalProxyViews: localViews [ 
	"When showing local views for the object, we remove all views where the method is annotated with gtProxy. Those views will only be shown for the proxy object."
	^ localViews reject: [ :each |
		each definingMethod compiledMethod hasPragmaNamed: #gtProxy ].
]

{ #category : #accessing }
TGtRemoteBareProxyInspectorAttachment >> gtActionsForRemoteSideInContext: aContext [
	"This collects all actions for the current object. This excludes the proxy-specific actions (annotated with #gtProxyAction), and includes all remote actions for the object, as well as all custom actions defined locally"
 
	| localActions collectedActions |
	
	"Get the actions using the super call. 
	This will use #gtAction to compute the list of actions for the local object."
	localActions := self gtLocalProxyActionsForRemoteSideInContext: aContext.
	
	collectedActions := OrderedCollection new
		addAll: (self filterLocalProxyActions: localActions);
		yourself.
	self proxyObject ifNotNil: [
		collectedActions addAll: (self proxyObject 
			gtActionsForRemoteSideInContext: aContext) ].
		
	GtPhlowUtility sortByPriority: collectedActions.
	
	^ collectedActions
]

{ #category : #accessing }
TGtRemoteBareProxyInspectorAttachment >> gtViewsForRemoteSideInContext: aContext [

	| localViews collectedViews |
	
	"Get the actions using the super call. 
	This will use #gtAction to compute the list of actions for the local object."
	localViews := self gtLocalProxyViewsForRemoteSideInContext: aContext.
	
	collectedViews := OrderedCollection new
		addAll: (self filterLocalProxyViews: localViews);
		yourself.
	self proxyObject ifNotNil: [
		collectedViews addAll: (self proxyObject 
			gtViewsForRemoteSideInContext: aContext) ].
	
	GtPhlowUtility sortByPriority: collectedViews.
	
	^ collectedViews
]
