"
GtRemoteInspectionSimulation provides an environment for developing and testing remote object inspection within a single image by using converting the views to their declarative form in the inspector.

To open a inspector using the declarative views:

```
	GtRemoteInspectionSimulation openOn: anObjectWithDeclarativeViews
```


1. # Internal Representation and Key Implementation Points.


1. ## Instance Variables


	object:		<Object> the object being inspected.


"
Class {
	#name : #GtRemoteInspectionSimulation,
	#superclass : #Object,
	#traits : 'TGtRemoteProxySpecificViews + TGtRemoteProxySpecificActions + TGtRemoteProxyInspectorWrappedObjectAttachment + TGtRemoteProxyActionsAttachment + TGtRemoteProxyViewsAttachment',
	#classTraits : 'TGtRemoteProxySpecificViews classTrait + TGtRemoteProxySpecificActions classTrait + TGtRemoteProxyInspectorWrappedObjectAttachment classTrait + TGtRemoteProxyActionsAttachment classTrait + TGtRemoteProxyViewsAttachment classTrait',
	#instVars : [
		'object',
		'localProxyInspector',
		'remoteInspectorProxy'
	],
	#category : #'GToolkit-RemoteGt-Development'
}

{ #category : #accessing }
GtRemoteInspectionSimulation class >> leProxyTypeForPlaygroundPage [
	^ self
]

{ #category : #'instance creation' }
GtRemoteInspectionSimulation class >> openOn: anObject [

	^ self new 
		object: anObject
]

{ #category : #'gt inspector' }
GtRemoteInspectionSimulation >> configurePhlowAction: aPhlowAction withSpecification: anActionSpecification [
]

{ #category : #'gt inspector' }
GtRemoteInspectionSimulation >> configurePhlowView: aPhlowView withSpecification: aViewSpecification [
]

{ #category : #simulation }
GtRemoteInspectionSimulation >> createActionBuilder [
	^ GtPhlowNoAction new
]

{ #category : #simulation }
GtRemoteInspectionSimulation >> createViewBuilder [
	^ GtPhlowEmptyView new
]

{ #category : #accessing }
GtRemoteInspectionSimulation >> createViewedObjectFor: anObject [ 
	^ GtRemotePhlowViewedObject object: anObject
]

{ #category : #'gt inspector' }
GtRemoteInspectionSimulation >> getClassSpecificationData [
	^ localProxyInspector getClassSpecificationData
]

{ #category : #'gt - actions' }
GtRemoteInspectionSimulation >> getDeclarativeActionDataSourceFor: anActionSelector [
	^ localProxyInspector getDeclarativeActionDataSourceFor: anActionSelector
]

{ #category : #'as yet unclassified' }
GtRemoteInspectionSimulation >> getLocalProxyInspector [
	^ localProxyInspector
]

{ #category : #'as yet unclassified' }
GtRemoteInspectionSimulation >> getRemoteInspectorProxy [
	^ remoteInspectorProxy
]

{ #category : #'gt inspector' }
GtRemoteInspectionSimulation >> getRemoteObjectGtDisplayString [
	^ localProxyInspector getRemoteObjectGtDisplayString
]

{ #category : #'gt - views' }
GtRemoteInspectionSimulation >> getViewDeclaration: aViewSelector [
	^ localProxyInspector getViewDeclaration: aViewSelector
]

{ #category : #'gt - views' }
GtRemoteInspectionSimulation >> getViewsDeclarations [
	^ localProxyInspector getViewsDeclarations
]

{ #category : #'gt inspector' }
GtRemoteInspectionSimulation >> gtInspectorConnectionDetailsOn: aStream [
]

{ #category : #'as yet unclassified' }
GtRemoteInspectionSimulation >> gtInspectorRemoteSideTitleStringOn: aStream [ 

	aStream
		<< 'a(n): ';
		<< (self remoteClass ifNil: [ '<None>' ]) 
]

{ #category : #simulation }
GtRemoteInspectionSimulation >> gtInspectorTitleString [
	^ String streamContents: [ :stream |
			stream
				<< 'RemoteSimulation to: ';
				<< object class name ]
]

{ #category : #simulation }
GtRemoteInspectionSimulation >> gtRemoteSideInitialPlaygroundSnippet [
	^ LePharoSnippet new
]

{ #category : #'gt inspector' }
GtRemoteInspectionSimulation >> gtRemoteSideInspectorObjectHolder [
	^ GtInspectorObject new 
]

{ #category : #utils }
GtRemoteInspectionSimulation >> isProxyObjectActive [
	^ true
]

{ #category : #accessing }
GtRemoteInspectionSimulation >> object [
	^ object
]

{ #category : #accessing }
GtRemoteInspectionSimulation >> object: anObject [

	object := anObject.
	
	remoteInspectorProxy := self createViewedObjectFor: anObject.
	localProxyInspector := GtLocalPhlowViewedObject  
		fromProxy: remoteInspectorProxy 
		withData: remoteInspectorProxy getInspectorSpecificationWithPhlowDataSource
]

{ #category : #accessing }
GtRemoteInspectionSimulation >> remoteClass [
	^ remoteInspectorProxy object class name
]

{ #category : #utils }
GtRemoteInspectionSimulation >> runComputation: aBlock ifFailure: aFailureBlock [
	"Proxies simulations are allways valid"
	^ aBlock value
]
