Extension { #name : #JSLinkProxyObject }

{ #category : #'*Gt4JSLink' }
JSLinkProxyObject >> declarativeViews [
	"Answer the views for the receiver"
	| viewMethodNames rawViews viewDictionary |

	self viewProxyDo: [ :viewProxy | 
		viewMethodNames := viewProxy newCommandFactory
				<< (viewProxy => #getGtViewMethodNames) jsCall;
				sendAndWait.
		rawViews := viewMethodNames collect: [ :viewSelector |
				viewDictionary := viewProxy newCommandFactory
					<< ((viewProxy => #getViewDeclaration) jsCallWith: { viewSelector });
					sendAndWait.
				((GtDeclarativeView fromDictionary: viewDictionary)
					accessor: viewProxy;
					methodName: viewSelector;
					yourself) ] ].
	^ rawViews
]

{ #category : #'*Gt4JSLink' }
JSLinkProxyObject >> evaluateSourceSequence: aString [

	^ self newCommandFactory
		<< aString;
		sendAndWait.

]

{ #category : #'*Gt4JSLink' }
JSLinkProxyObject >> getViewProxy [
	"Answer a GtViewedProxy on the receiver"

	^ self application newCommandFactory
		<< (#GtViewedObject asJSGIdentifier <- (#require asJSGIdentifier jsCallWith: { '../gtoolkit/gt' })) beLetDeclaration;
		<< (#viewedObject asJSGIdentifier <- self) beLetDeclaration;
		<< (#GtViewedObject asJSGIdentifier jsCallWith: { #viewedObject asJSGIdentifier }) new;
		sendAndWait.

]

{ #category : #'*Gt4JSLink' }
JSLinkProxyObject >> gtLocalViewsFor: aView inContext: aContext [
	| title resultingView |
	title := String streamContents: [ :stream |
				stream
					<< 'Proxy to a(n): ';
					<< (javaScriptClass ifNil: [ '<None>' ]) ].
	resultingView := ((aView composite
		views: (self gtViewsInContext: aContext))
		labelled: title).
	^ resultingView
]

{ #category : #'*Gt4JSLink' }
JSLinkProxyObject >> gtPlaygroundFor: aView [
	<gtView>

	^ aView textEditor
		title: 'Playground' translated;
		priority: 10;
		text: [ '' asRopedText glamorousCodeFont ];
		styler: application settings parserClass gtStyler;
		actionButtonIcon: BrGlamorousIcons playinspect  
			action: [ :aButton |
				| statements result |
				statements := aButton phlow textViewContent asString.
				result := [ self evaluateSourceSequence: statements ]
					on: PharoLinkRemoteError, PharoLinkParserError  
					do: [ :ex | ex ].
				aButton phlow spawnObject: result ].

]

{ #category : #'*Gt4JSLink' }
JSLinkProxyObject >> gtProxyFor: aView [
	<gtProxy>

	^(self gtRawFor: aView)
		title: 'Proxy' translated;
		priority: 10000.
]

{ #category : #'*Gt4JSLink' }
JSLinkProxyObject >> gtProxyViewsFor: aView [
	<gtView>
	^ aView list
		title: 'Proxy views' translated;
		priority: 10001;
		items: [ self declarativeViews ];
		itemText: [ :view | view title ];
		send: [ :view | view ]
]

{ #category : #'*Gt4JSLink' }
JSLinkProxyObject >> gtSentItemFor: methodName at: selection [ 

	self assert: (PharoLinkRegistry isPrimitive: methodName).
	self assert: (PharoLinkRegistry isPrimitive: selection).

	^ application newCommandFactory
				<< ((self => #sentItem) jsCallWith: { methodName. selection. });
					sendAndWait.
]

{ #category : #'*Gt4JSLink' }
JSLinkProxyObject >> gtViewsFor: aView inContext: aContext [
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

{ #category : #'*Gt4JSLink' }
JSLinkProxyObject >> gtViewsInContext: aContext [
	"This collects all views for the current object.
	For a proxy we just want the Raw view renamed as 'Proxy'"
	| emptyView |

	emptyView := GtPhlowEmptyView new.
	^ OrderedCollection new
		add: (self gtProxyFor: emptyView);
		add: (self gtProxyViewsFor: emptyView);
		add: (self gtPlaygroundFor: emptyView);
		yourself
]

{ #category : #'*Gt4JSLink' }
JSLinkProxyObject >> isGtViewedObject [
	"Answer a boolean indicating whether the receiver is a GtViewedProxy"

	^ javaScriptClass = #GtViewedObject
]

{ #category : #'*Gt4JSLink' }
JSLinkProxyObject >> viewProxyDo: aBlock [
	"Evaluate the supplied block ensuring that the receiver is a GtViewedObject"

	| viewProxy |

	viewProxy := javaScriptClass = #GtViewedObject
		ifTrue: [ self ]
		ifFalse: [ self getViewProxy ].
	^ aBlock value: viewProxy.

]

{ #category : #'*Gt4JSLink' }
JSLinkProxyObject >> viewsFor: aView [
	"Should be all views, but just get Raw and Print views for now"

	^ self declarativeViews collect: [ :declarativeView | declarativeView viewFor: aView ].

]
