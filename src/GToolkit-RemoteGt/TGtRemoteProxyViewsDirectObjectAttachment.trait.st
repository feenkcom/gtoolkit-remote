Trait {
	#name : #TGtRemoteProxyViewsDirectObjectAttachment,
	#traits : 'TGtRemoteProxyViewsAttachment',
	#classTraits : 'TGtRemoteProxyViewsAttachment classTrait',
	#category : #'GToolkit-RemoteGt'
}

{ #category : #'gt inspector' }
TGtRemoteProxyViewsDirectObjectAttachment >> filterLocalProxyViews: localViews [ 
	"When showing local views for the object, we remove all views where the method is annotated with gtProxy. Those views will only be shown for the proxy object."
	^ localViews reject: [ :each |
		each definingMethod compiledMethod hasPragmaNamed: #gtProxy ].
]

{ #category : #'gt inspector' }
TGtRemoteProxyViewsDirectObjectAttachment >> gtViewsForRemoteSideInContext: aContext [
	"This collects all views for the current object. This excludes the proxy-specific views (annotated with #gtProxy), and includes all remote views for the object, as well as all custom views defined locally"
 
	| localViews collectedViews |
	
	"Get the views using the super call. 
	This will use #gtView to compute the list of views for the local object."
	localViews := self gtLocalProxyViewsForRemoteSideInContext: aContext.
	
	collectedViews := OrderedCollection new
		addAll: (self filterLocalProxyViews: localViews);
		addAll: (self 
			remoteViewsFor: GtPhlowEmptyView new
			inContext: aContext);
		yourself.
	
	GtPhlowUtility sortByPriority: collectedViews.
	
	^ collectedViews
]

{ #category : #'gt - views' }
TGtRemoteProxyViewsDirectObjectAttachment >> remoteViewsFor: aView inContext: aContext [
	^ self 
		runComputation: [
			self declarativeViews collect: [ :aViewSpecification | 
				self 
					remoteViewFromSpecification: aViewSpecification 
					for: aView 
					inContext: aContext ] ]
		ifFailure: [ #() ].
]
