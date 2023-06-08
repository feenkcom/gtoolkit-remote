Extension { #name : #LanguageLinkProxyObject }

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> addPlaygroundBindingsTo: aCommandFactory [

	aCommandFactory addBinding: (PharoLinkBinding 
		key: 'self' wrap: self)
]

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> declarativeViews [
	"Answer the views for the receiver"
	| rawViews  |

	self viewProxyDo: [ :remoteInspectorProxy |
		| viewSelectors |
		viewSelectors := remoteInspectorProxy getDeclarativeViewMethodNames.
		rawViews := viewSelectors collect: [ :viewSelector |
			| viewDictionary declarativeView |
			viewDictionary := remoteInspectorProxy getViewDeclaration: viewSelector.
			declarativeView := GtPhlowViewSpecification fromDictionary: viewDictionary.
			declarativeView
				methodSelector: viewSelector;
				initializeFromInspector: remoteInspectorProxy.
			declarativeView ] ].

	^ rawViews
]

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> evaluateSourceSequence: aString [
	| cf |

	cf := self newCommandFactory.
	^ cf 
		<< aString;
		sendAndWait.
]

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> filterLocalProxyViews: localViews [ 
	"When showing local views for the object, we remove all views where the method is annotated with gtProxy. Those views will only be shown for the proxy object."
	^ localViews reject: [ :each |
		each definingMethod compiledMethod hasPragmaNamed: #gtProxy ].
]

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> getViewProxy [
	"Answer a GtViewedProxy on the receiver"

	^ self evaluateAndWait: 'GtRemotePhlowViewedObject object: self'
]

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> gtDefaultInspectorTool [
	"We extent the inspector by adding a custom tool showing object specific views."
	
	^ GtPhlowCompositeTool new
		addTool: (self gtRemoteSideInspectorTool
			name: 'Remote';
			withLabelAndIconAptitude);
		addTool: (super gtDefaultInspectorTool
			name: 'Proxy';
			withLabelAndIconAptitude)
]

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> gtInspectorTitleString [
	 ^ String streamContents: [ :stream |
			stream
				<< 'Proxy to a(n): ';
				<< (remoteClass ifNil: [ '<None>' ]) ]
]

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> gtMetaFor: aView [
	<gtProxy>

	^ super gtMetaFor: aView
]

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> gtPrintFor: aView [
	<gtProxy>

	^ super gtPrintFor: aView
]

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> gtRawFor: aView [
	<gtProxy>

	^ super gtRawFor: aView
]

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> gtRemoteSideInspectorTool [
	^ GtInspectorTool 
		forObject: self 
		viewSelector: #gtRemoteViewsFor: 
]

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> gtRemoteViewSpecificationsFor: aView [
	<gtProxy>
	
	^ aView list
		title: 'Remote view specifications';
		priority: 10001;
		items: [ self declarativeViews ];
		itemText: [ :aViewAccessor | aViewAccessor title ];
		send: [ :aDeclarativeView | aDeclarativeView ]
]

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> gtRemoteViewsFor: aView [
	"This is the default entry method for retrieving the wrapper view containing all non-proxy views for the object."
	<return: #GtPhlowLabelledView>
	
	^ GtPhlowLabelledViewBuilder new
		object: self;
		view: aView;
		context: GtPhlowContext new;
		viewsSelector: #gtViewsForRemoteSideInContext:;
		titleComputation: [
			String streamContents: [ :stream |
				stream
					<< 'a(n): ';
					<< (remoteClass ifNil: [ '<None>' ]) ]];
		build 
]

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> gtViewsForRemoteSideInContext: aContext [
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

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> gtViewsInContext: aContext [
	"Change the views of the proxy object to only those annotated with gtProxy."
 
	^ GtPhlowViewsCollector new
		fromObject: self;
		context: aContext;
		pragmaName: #gtProxy;
		collect.
]

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> remoteViewsFor: aView inContext: aContext [
	"Should be all views, but just get Raw and Print views for now"

	^ [ 
		self declarativeViews 
			collect: [ :declarativeView | 
				declarativeView viewFor: aView ] 
	]
		on: LanguageLinkServerNotRunningError, LanguageLinkCommunicationError
		do: [ :ex | application isRunning
			ifTrue: [ ex pass ]
			ifFalse: [ #() ] ].

]

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> viewProxyDo: aBlock [
	"Evaluate the supplied block ensuring that the receiver is a GtRemotePhlowViewedObject"

	| viewProxy |

	viewProxy := (#(GtRemotePhlowViewedObject) includes: remoteClass)
		ifTrue: [ self ]
		ifFalse: [ self getViewProxy ].
	^ aBlock value: viewProxy.

]
