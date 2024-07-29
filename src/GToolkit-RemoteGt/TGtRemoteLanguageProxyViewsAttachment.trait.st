Trait {
	#name : #TGtRemoteLanguageProxyViewsAttachment,
	#category : #'GToolkit-RemoteGt'
}

{ #category : #'gt inspector' }
TGtRemoteLanguageProxyViewsAttachment >> buildLocalViewSpecificationFor: aViewSelector [ 
	| viewSpecificationData viewSpecification |
	viewSpecificationData := self getViewDeclaration: aViewSelector.
	viewSpecification := GtPhlowViewSpecification 
		fromDictionary: viewSpecificationData.
	viewSpecification initializeFromInspector: self.
	^ viewSpecification
]

{ #category : #'gt inspector' }
TGtRemoteLanguageProxyViewsAttachment >> declarativeViews [
	"Answer the views for the receiver"
	| rawViews |

	rawViews := #().
	self proxyInspectorDo: [ :remoteInspectorProxy |
		rawViews := remoteInspectorProxy currentDeclarativeViewSpecifications ].

	^ rawViews
]

{ #category : #'gt inspector' }
TGtRemoteLanguageProxyViewsAttachment >> filterLocalProxyViews: localViews [ 
	"When showing local views for the object, we remove all views where the method is annotated with gtProxy. Those views will only be shown for the proxy object."
	^ localViews reject: [ :each |
		each definingMethod compiledMethod hasPragmaNamed: #gtProxy ].
]

{ #category : #'gt inspector' }
TGtRemoteLanguageProxyViewsAttachment >> gtDefaultInspectorTool [
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

{ #category : #'gt inspector' }
TGtRemoteLanguageProxyViewsAttachment >> gtInspectorRemoteSideTitleStringOn: aStream [ 

	aStream
		<< 'a(n): ';
		<< (self remoteClass ifNil: [ '<None>' ]) 
]

{ #category : #'gt inspector' }
TGtRemoteLanguageProxyViewsAttachment >> gtRemoteSideInspectorTool [
	^ GtInspectorTool 
		forObject: self 
		viewSelector: #gtRemoteViewsFor: 
]

{ #category : #'gt inspector' }
TGtRemoteLanguageProxyViewsAttachment >> gtRemoteViewsFor: aView [
	"This is the default entry method for retrieving the wrapper view containing all non-proxy views for the object."
	<return: #GtPhlowLabelledView>
	
	^ GtPhlowLabelledViewBuilder new
		object: self;
		view: aView;
		context: GtPhlowContext new;
		viewsSelector: #gtViewsForRemoteSideInContext:;
		titleComputation: [
			String streamContents: [ :aStream |
				self gtInspectorRemoteSideTitleStringOn: aStream ] ];
		build 
]

{ #category : #'gt inspector' }
TGtRemoteLanguageProxyViewsAttachment >> gtViewsForRemoteSideInContext: aContext [
	"This collects all views for the current object. This excludes the proxy-specific views (annotated with #gtProxy), and includes all remote views for the object, as well as all custom views defined locally"
 
	| localViews collectedViews |
	
	"Get the views using the super call. 
	This will use #gtView to compute the list of views for the local object."
	localViews := super gtViewsInContext: aContext.
	
	collectedViews := OrderedCollection new
		addAll: (self filterLocalProxyViews: localViews);
		addAll: (self 
			remoteViewsFor: GtPhlowEmptyView new
			inContext: aContext);
		yourself.
	GtPhlowUtility sortByPriority: collectedViews.
	
	^ collectedViews
]

{ #category : #'gt inspector' }
TGtRemoteLanguageProxyViewsAttachment >> gtViewsInContext: aContext [
	"Change the views of the proxy object to only those annotated with gtProxy."
 
	^ GtPhlowViewsCollector new
		fromObject: self;
		context: aContext;
		pragmaName: #gtProxy;
		collect.
]

{ #category : #'gt inspector' }
TGtRemoteLanguageProxyViewsAttachment >> proxyInspectorDo: aBlock [
	"Evaluate the supplied block returning a GtLocalPhlowViewedObject"

	| proxyInspector |

	proxyInspector := self getProxyInspector.
	^ aBlock value: proxyInspector.
]

{ #category : #'gt inspector' }
TGtRemoteLanguageProxyViewsAttachment >> viewProxyDo: aBlock [
	"Evaluate the supplied block ensuring that the receiver is a GtRemotePhlowViewedObject"

	| viewProxy |

	viewProxy := self getViewProxy.
	^ aBlock value: viewProxy.
]
