Extension { #name : #LanguageLinkProxyObject }

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> addPlaygroundBindingsTo: aCommandFactory [

	aCommandFactory addBinding: (PharoLinkBinding 
		key: 'self' wrap: self)
]

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> declarativeActionSpecifications [
	"Answer the views for the receiver"
	| actionSpecifications |

	self remoteInspectorProxyDo: [ :remoteInspectorProxy |
		| specificationData specificationActionsData |
		specificationData := remoteInspectorProxy getActionSpecifications.
		specificationActionsData := specificationData at: 'actions' ifAbsent: [ #() ].
		actionSpecifications := specificationActionsData 
			collect: [ :anActionSpecificationData |
				| actionSpecification |
				actionSpecification := GtPhlowActionSpecification 
					phlowActionFromDictionary: anActionSpecificationData.
				actionSpecification
					initializeFromInspector: remoteInspectorProxy.
				actionSpecification ] ].

	^ actionSpecifications
]

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> declarativeViews [
	"Answer the views for the receiver"
	| rawViews  |

	self remoteInspectorProxyDo: [ :remoteInspectorProxy |
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
LanguageLinkProxyObject >> filterLocalProxyActions: localActions [ 
	"When showing local actions for the object, we remove all actions where the method is annotated with #gtProxyAction. Those actions will only be shown for the proxy object."
	^ localActions reject: [ :each |
		each definingMethod compiledMethod 
			hasPragmaNamed: #gtProxyAction ].
]

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> filterLocalProxyViews: localViews [ 
	"When showing local views for the object, we remove all views where the method is annotated with gtProxy. Those views will only be shown for the proxy object."
	^ localViews reject: [ :each |
		each definingMethod compiledMethod hasPragmaNamed: #gtProxyView ].
]

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> getRemoteInspectorProxy [
	"Answer a GtViewedProxy on the receiver"

	^ self evaluateAndWait: 'GtRemotePhlowViewedObject object: self'
]

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> gtActionBrowseFor: anAction [
	<gtProxyAction>

	^ super gtActionBrowseFor: anAction
]

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> gtActionInspectFor: anAction [
	<gtProxyAction>

	^ super gtActionInspectFor: anAction
]

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> gtActionsForRemoteSideInContext: aContext [
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
	<gtProxyView>

	^ super gtMetaFor: aView
]

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> gtPrintFor: aView [
	<gtProxyView>

	^ super gtPrintFor: aView
]

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> gtRawFor: aView [
	<gtProxyView>

	^ super gtRawFor: aView
]

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> gtRemoteActionSpecificationsFor: aView [
	<gtProxyView>
	
	^ aView columnedList
		title: 'Remote action specifications';
		priority: 10002;
		items: [ self declarativeActionSpecifications 
			sorted: #priority ascending];
		column: 'Tooltip' text: [ :aViewAccessor | aViewAccessor tooltipText ];
		column: 'Label' text: [ :aViewAccessor | aViewAccessor label ];
		column: 'Icon' 
			icon: [ :aViewAccessor | 
				aViewAccessor iconStencil ifNil: [BlElement new
					size: 0@0] ] 
			width: 75;
		column: 'Selector' text: [ :aViewAccessor | aViewAccessor methodSelector ];
		column: 'Priority' text: [ :aViewAccessor | aViewAccessor priority ] weight: 0.5;
		send: [ :aDeclarativeView | aDeclarativeView ]
]

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> gtRemoteInspectorContentFor: aView [
	"This is the default entry method for retrieving the wrapper view containing all non-proxy views for the object."
	<return: #GtPhlowLabelledView>
	
	^ GtPhlowLabelledViewBuilder new
		object: self;
		view: aView;
		context: GtPhlowContext new;
		viewsSelector: #gtViewsForRemoteSideInContext:;
		actionsSelector: #gtActionsForRemoteSideInContext:;
		titleComputation: [
			String streamContents: [ :stream |
				stream
					<< 'a(n): ';
					<< (remoteClass ifNil: [ '<None>' ]) ]];
		build 
]

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> gtRemoteInspectorSpecificationsFor: aView [
	<gtProxyView>
	
	^ aView forward
		title: 'Remote specification';
		priority: 10002;
		object: [ GtJson
			forJsonString: (NeoJSONWriter 
				toStringPretty:  self getRemoteInspectorProxy getViewsDeclarations) ];
		view: #gtJsonStringFor:;
		actionButtonIcon: BrGlamorousVectorIcons inspect 
			label: 'Json'
			tooltip: 'Inspect the JSON object'
			action: [ :aButton |
				aButton phlow 
					spawnObject: aButton phlow forwardViewObjectFromViewAction ]
]

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> gtRemoteSideInspectorTool [
	^ GtInspectorTool 
		forObject: self 
		viewSelector: #gtRemoteInspectorContentFor: 
]

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> gtRemoteViewSpecificationsFor: aView [
	<gtProxyView>
	
	^ aView columnedList
		title: 'Remote view specifications';
		priority: 10001;
		items: [ self declarativeViews sorted: #priority ascending];
		column: 'Title' text: [ :aViewAccessor | aViewAccessor title ];
		column: 'Selector' text: [ :aViewAccessor | aViewAccessor methodSelector ];
		column: 'View' text: [ :aViewAccessor | aViewAccessor viewName ];
		column: 'Priority' text: [ :aViewAccessor | aViewAccessor priority ] weight: 0.5;
		column: 'Transport' text: [ :aViewAccessor | aViewAccessor dataTransport ] weight: 0.5;
		send: [ :aDeclarativeView | aDeclarativeView ]
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
		pragmaName: #gtProxyView;
		collect.
]

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> isGtProxyObject [

	^ true
]

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> remoteActionsFor: aView inContext: aContext [
	"Should be all views, but just get Raw and Print views for now"

	^ [ 
		self declarativeActionSpecifications 
			collect: [ :anActionSpecification | 
				anActionSpecification actionFor: aView ] 
	]
		on: LanguageLinkServerNotRunningError, LanguageLinkCommunicationError
		do: [ :ex | application isRunning
			ifTrue: [ ex pass ]
			ifFalse: [ #() ] ].

]

{ #category : #'*Gt4PharoLink' }
LanguageLinkProxyObject >> remoteInspectorProxyDo: aBlock [
	"Evaluate the supplied block ensuring that the receiver is a GtRemotePhlowViewedObject"

	| viewProxy |

	viewProxy := (#(GtRemotePhlowViewedObject) includes: remoteClass)
		ifTrue: [ self ]
		ifFalse: [ self getRemoteInspectorProxy ].
	^ aBlock value: viewProxy.

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
