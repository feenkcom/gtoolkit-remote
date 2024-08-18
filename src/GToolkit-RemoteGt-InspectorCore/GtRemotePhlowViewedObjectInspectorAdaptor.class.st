Class {
	#name : #GtRemotePhlowViewedObjectInspectorAdaptor,
	#superclass : #Object,
	#instVars : [
		'proxyInspector',
		'targetObject'
	],
	#category : #'GToolkit-RemoteGt-InspectorCore'
}

{ #category : #'instance creation' }
GtRemotePhlowViewedObjectInspectorAdaptor class >> forTargetObject: anObject [
	^ self new 
		initialiseForTargetObject: anObject
]

{ #category : #'gt inspector' }
GtRemotePhlowViewedObjectInspectorAdaptor >> currentRemoteInspectorProxyDo: aBlock [
	 proxyInspector ifNil: [
	 	targetObject 
	 		runComputation: [
	 			targetObject localProxyInspectorDo: [ :aRemoteInspectorProxy |
	 				proxyInspector := aRemoteInspectorProxy ] ] 
	 		ifFailure: [ 
	 			"If the proxy or the communication channel is invalid 
	 			we have no local inspector" ] ].
	 		
	 proxyInspector ifNotNil: [ :aRemoteInspectorProxy |
	 	aBlock value: aRemoteInspectorProxy ]
]

{ #category : #accessing }
GtRemotePhlowViewedObjectInspectorAdaptor >> filterLocalProxyActions: localActions [ 
	"When showing local actions for the object, we remove all actions where the method is annotated with #gtProxyAction. Those actions will only be shown for the proxy object."
	^ localActions reject: [ :each | 
		each definingMethod compiledMethod 
			hasPragmaNamed: #gtProxyAction ].
]

{ #category : #'gt inspector' }
GtRemotePhlowViewedObjectInspectorAdaptor >> filterLocalProxyViews: localViews [ 
	"When showing local views for the object, we remove all views where the method is annotated with gtProxy. Those views will only be shown for the proxy object."
	^ localViews reject: [ :each | 
		each definingMethod compiledMethod hasPragmaNamed: #gtProxyView ].
]

{ #category : #'gt inspector' }
GtRemotePhlowViewedObjectInspectorAdaptor >> gtActionsForRemoteSideInContext: aContext [
	"This collects all actions for the current object. This excludes the proxy-specific actions (annotated with #gtProxyAction), and includes all remote actions for the object, as well as all custom actions defined locally"
  
	| localActions collectedActions |
	
	"Get the actions using the super call. 
	This will use #gtAction to compute the list of actions for the local object."
	localActions := targetObject gtLocalProxyActionsForRemoteSideInContext: aContext.
	
	collectedActions := OrderedCollection new
		addAll: (self filterLocalProxyActions: localActions).
	self currentRemoteInspectorProxyDo: [ :aRemoteInspectorProxy |
		collectedActions addAll: (targetObject 
			remoteActionsFor: GtPhlowNoAction new
			inContext: aContext 
			from: aRemoteInspectorProxy) ].
	
	GtPhlowUtility sortByPriority: collectedActions.
	
	^ collectedActions
]

{ #category : #'gt inspector' }
GtRemotePhlowViewedObjectInspectorAdaptor >> gtBasicDisplayOn: aStream [
	| gtDisplayString |

	targetObject isProxyObjectActive ifFalse:[ 
		aStream << '<not connected>'.
		^ self ].

	gtDisplayString := 'Error printing bare proxy'.
	[ 
		self currentRemoteInspectorProxyDo: [ :aRemoteInspectorProxy |
			gtDisplayString := aRemoteInspectorProxy getRemoteObjectGtDisplayString ]
	] on: Error do: [ :ex | 
		gtDisplayString := 'Error printing bare proxy: ', ex class name ].
		
	aStream << gtDisplayString.
	
	targetObject gtInspectorConnectionDetailsOn: aStream.
]

{ #category : #'gt inspector' }
GtRemotePhlowViewedObjectInspectorAdaptor >> gtInspectorRemoteSideTitleStringOn: aStream [
	self gtBasicDisplayOn: aStream.
	targetObject gtInspectorConnectionDetailsOn: aStream.
]

{ #category : #'gt inspector' }
GtRemotePhlowViewedObjectInspectorAdaptor >> gtViewsForRemoteSideInContext: aContext [
	"This collects all views for the current object. This excludes the proxy-specific views (annotated with #gtProxy), and includes all remote views for the object, as well as all custom views defined locally"
 
	| localViews collectedViews |
	
	"Get the views using the super call. 
	This will use #gtView to compute the list of views for the local object."
	localViews := targetObject gtLocalProxyViewsForRemoteSideInContext: aContext.
	
	collectedViews := OrderedCollection new
		addAll: (self filterLocalProxyViews: localViews).
	self currentRemoteInspectorProxyDo: [ :aRemoteInspectorProxy |
		collectedViews addAll: (targetObject 
			remoteViewsFor: GtPhlowEmptyView new
			inContext: aContext
			from: aRemoteInspectorProxy) ].
		
	GtPhlowUtility sortByPriority: collectedViews.
	
	^ collectedViews
]

{ #category : #initialization }
GtRemotePhlowViewedObjectInspectorAdaptor >> initialiseForTargetObject: anObject [
	targetObject := anObject
]

{ #category : #accessing }
GtRemotePhlowViewedObjectInspectorAdaptor >> proxyInspector [
	^ proxyInspector
]
