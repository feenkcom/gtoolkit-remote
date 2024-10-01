Trait {
	#name : #TGtRemoteProxyInspectorDirectObjectAttachment,
	#traits : 'TGtRemoteProxyInspectorAttachment',
	#classTraits : 'TGtRemoteProxyInspectorAttachment classTrait',
	#category : #'GToolkit-RemoteGt'
}

{ #category : #'gt - inspector' }
TGtRemoteProxyInspectorDirectObjectAttachment >> gtInspectorRemoteSideTitleStringOn: aStream [ 
	"As we attach views directly to the proxy object it needs to provide this method"
	self explicitRequirement 
]

{ #category : #'as yet unclassified' }
TGtRemoteProxyInspectorDirectObjectAttachment >> gtRemoteInspectorContentFor: aView [
	"This is the default entry method for retrieving the wrapper view containing all non-proxy views for the object."
	<return: #GtPhlowLabelledView>
	
	^ GtPhlowLabelledViewBuilder new
		object: self gtRemoteInspectorTargetObject;
		view: aView;
		context: GtPhlowContext new;
		viewsSelector: #gtViewsForRemoteSideInContext:;
		actionsSelector: #gtActionsForRemoteSideInContext:;
		titleComputation: [ :anObject |
			String streamContents: [ :aStream |
				anObject gtInspectorRemoteSideTitleStringOn: aStream ] ];
		build 
]

{ #category : #'as yet unclassified' }
TGtRemoteProxyInspectorDirectObjectAttachment >> gtRemoteInspectorTargetObject [
	^ self
]

{ #category : #'gt - inspector' }
TGtRemoteProxyInspectorDirectObjectAttachment >> gtRemoteSideInspectorTool [
	^ GtInspectorTool 
		forObject: self 
		viewSelector: #gtRemoteInspectorContentFor: 
]
