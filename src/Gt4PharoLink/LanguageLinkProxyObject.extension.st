Extension { #name : 'LanguageLinkProxyObject' }

{ #category : '*Gt4PharoLink' }
LanguageLinkProxyObject >> addPlaygroundBindingsTo: aCommandFactory [

	aCommandFactory addBinding: (PharoLinkBinding 
		key: 'self' wrap: self)
]

{ #category : '*Gt4PharoLink' }
LanguageLinkProxyObject >> declarativeViews [
	"Answer the views for the receiver"
	| rawViews  |

	self viewProxyDo: [ :remoteInspectorProxy |
		| viewSelectors |
		viewSelectors := remoteInspectorProxy getDeclarativeViewMethodNames.
		rawViews := viewSelectors collect: [ :viewSelector |
			| viewDictionary declarativeView |
			viewDictionary := remoteInspectorProxy getViewDeclaration: viewSelector.
			declarativeView := GtPhlowDeclarativeView fromDictionary: viewDictionary.
			declarativeView
				methodSelector: viewSelector;
				initializeFromInspector: remoteInspectorProxy.
			declarativeView ] ].

	^ rawViews
]

{ #category : '*Gt4PharoLink' }
LanguageLinkProxyObject >> evaluateSourceSequence: aString [
	| cf |

	cf := self newCommandFactory.
	^ cf 
		<< aString;
		sendAndWait.
]

{ #category : '*Gt4PharoLink' }
LanguageLinkProxyObject >> getViewProxy [
	"Answer a GtViewedProxy on the receiver"

	^ self newCommandFactory
		<< 'GtViewedObject object: self';
		sendAndWait.

]

{ #category : '*Gt4PharoLink' }
LanguageLinkProxyObject >> gtLocalViewsFor: aView inContext: aContext [
	| title resultingView |

	title := String streamContents: [ :stream |
				stream
					<< 'Proxy to a(n): ';
					<< (remoteClass ifNil: [ '<None>' ]) ].
	resultingView := ((aView composite
		views: (self gtViewsInContext: aContext))
		labelled: title).
	^ resultingView
]

{ #category : '*Gt4PharoLink' }
LanguageLinkProxyObject >> gtProxyFor: aView [
	<gtProxy>

	^(self gtRawFor: aView)
		title: 'Proxy' translated;
		priority: 10000.
]

{ #category : '*Gt4PharoLink' }
LanguageLinkProxyObject >> gtProxyRawFor: aView [

	^ aView columnedList 
		title: 'Raw';
		priority: 15;
		items: [ self viewProxyDo: [ :viewProxy |
				viewProxy newCommandFactory
					<< 'self rawViewData';
					sendAndWait ] ];
		column: 'Icon' icon: [ :aNode | aNode third iconNamed: aNode first ];
		column: 'Variable' text: [ :aNode | aNode second asRopedText ];
		column: 'Value' text: [ :aNode | 
					[ aNode third gtDisplayString asRopedText ]
						on: Error 
						do: [ :ex | ex messageText asRopedText foreground: Color red ] ];
		send: [ :aNode | aNode third ]
]

{ #category : '*Gt4PharoLink' }
LanguageLinkProxyObject >> gtProxyViewsFor: aView [
	<gtView>
	^ aView list
		title: 'Proxy views' translated;
		priority: 10001;
		items: [ self declarativeViews ];
		itemText: [ :aViewAccessor | aViewAccessor title ];
		send: [ :aDeclarativeView | aDeclarativeView ]
]

{ #category : '*Gt4PharoLink' }
LanguageLinkProxyObject >> gtViewsFor: aView inContext: aContext [
	"Add the declarative views from the inspectors object to the inspectors views"

	| resultingView inspectorViews |

	resultingView := self gtLocalViewsFor: aView inContext: aContext.
	inspectorViews := resultingView originalView views.

	"Add the explicitly declarative views from the inspected object"
	inspectorViews addAll: (self viewsFor: aView).

	"Re-sort by priority"
	inspectorViews := inspectorViews sorted: [ :a :b | a priority < b priority ].
	resultingView originalView views: inspectorViews.
	^resultingView
]

{ #category : '*Gt4PharoLink' }
LanguageLinkProxyObject >> gtViewsInContext: aContext [
	"This collects all views for the current object.
	For a proxy we just want the Raw view renamed as 'Proxy'"
	| views proxyRaw proxyPrint |

	views := super gtViewsInContext: aContext.
	"Retitle the original Raw view to Proxy and lower priority"
	proxyRaw := views detect: [ :each | each title = #Raw ].
	proxyRaw
		title: #Proxy;
		priority: 10000.
	"Remove the default Print view, the remote can supply it later"
	proxyPrint := views detect: [ :each | each title = #Print ].
	views remove: proxyPrint.
	
	views add: (self gtProxyRawFor: GtPhlowEmptyView new).
	^ views.
]

{ #category : '*Gt4PharoLink' }
LanguageLinkProxyObject >> viewProxyDo: aBlock [
	"Evaluate the supplied block ensuring that the receiver is a GtViewedObject"

	| viewProxy |

	viewProxy := (#(GtViewedObject GtRemotePhlowViewedObject) includes: remoteClass)
		ifTrue: [ self ]
		ifFalse: [ self getViewProxy ].
	^ aBlock value: viewProxy.

]

{ #category : '*Gt4PharoLink' }
LanguageLinkProxyObject >> viewsFor: aView [
	"Should be all views, but just get Raw and Print views for now"

	^ self declarativeViews collect: [ :declarativeView | declarativeView viewFor: aView ].

]
