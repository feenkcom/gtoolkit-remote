Trait {
	#name : #TGtRemoteProxyActionsDirectObjectAttachment,
	#traits : 'TGtRemoteProxyActionsAttachment',
	#classTraits : 'TGtRemoteProxyActionsAttachment classTrait',
	#category : #'GToolkit-RemoteGt'
}

{ #category : #filtering }
TGtRemoteProxyActionsDirectObjectAttachment >> filterLocalProxyActions: localActions [ 
	"When showing local actions for the object, we remove all actions where the method is annotated with #gtProxyAction. Those actions will only be shown for the proxy object."
	^ localActions reject: [ :each  |
		each definingMethod compiledMethod 
			hasPragmaNamed: #gtProxyAction ].
]

{ #category : #'gt - actions' }
TGtRemoteProxyActionsDirectObjectAttachment >> gtActionsForRemoteSideInContext: aContext [
	"This collects all actions for the current object. This excludes the proxy-specific actions (annotated with #gtProxyAction), and includes all remote actions for the object, as well as all custom actions defined locally"
 
	| localActions collectedActions | 
	
	"Get the actions using the super call. 
	This will use #gtAction to compute the list of actions for the local object."
	localActions := self gtLocalProxyActionsForRemoteSideInContext: aContext.
	
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
TGtRemoteProxyActionsDirectObjectAttachment >> remoteActionsFor: anAction inContext: aContext [
	
	^ self 
		runComputation:  [ self declarativeActionSpecifications 
			collect: [ :anActionSpecification | 
				| phlowAction |
				phlowAction := anActionSpecification actionFor: anAction.
				self 
					configurePhlowAction: phlowAction 
					withSpecification: anActionSpecification.
				phlowAction] ]
		ifFalse: [ #() ]
]
