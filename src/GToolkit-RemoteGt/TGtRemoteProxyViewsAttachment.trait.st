Trait {
	#name : #TGtRemoteProxyViewsAttachment,
	#category : #'GToolkit-RemoteGt'
}

{ #category : #accessing }
TGtRemoteProxyViewsAttachment >> buildLocalViewSpecificationFor: aViewSelector [ 
	"Used in documentation"
	| viewSpecificationData viewSpecification |
	viewSpecificationData := self getViewDeclaration: aViewSelector.
	viewSpecification := GtPhlowViewSpecification 
		fromDictionary: viewSpecificationData.
	viewSpecification initializeFromInspector: self.
	^ viewSpecification
]

{ #category : #accessing }
TGtRemoteProxyViewsAttachment >> declarativeViews [
	"Answer the views for the receiver"
	| rawViews |

	rawViews := #().
	self localProxyInspectorDo: [ :remoteInspectorProxy |
		rawViews := remoteInspectorProxy currentDeclarativeViewSpecifications ].

	^ rawViews
]

{ #category : #'gt - inspector' }
TGtRemoteProxyViewsAttachment >> gtLocalProxyViewsForLocalSideInContext: aContext [
	"Change the views of the proxy object to only those annotated with gtProxy."
 
	^ GtPhlowViewsCollector new
		fromObject: self;
		context: aContext;
		pragmaName: #gtProxy;
		collect.
]

{ #category : #'gt - inspector' }
TGtRemoteProxyViewsAttachment >> gtLocalProxyViewsForRemoteSideInContext: aContext [
	"Change the views of the proxy object to only those annotated with gtProxy."
 
	^ GtPhlowViewsCollector new
		fromObject: self;
		context: aContext;
		pragmaName: #gtView;
		collect.
]

{ #category : #'gt - inspector' }
TGtRemoteProxyViewsAttachment >> gtViewsInContext: aContext [
	"Change the views of the proxy object to only those annotated with gtProxy."
 
	^ self gtLocalProxyViewsForLocalSideInContext: aContext
]