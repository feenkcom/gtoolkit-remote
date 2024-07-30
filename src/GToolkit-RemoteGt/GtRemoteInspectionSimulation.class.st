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

{ #category : #accessing }
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

{ #category : #accessing }
GtRemoteInspectionSimulation >> getViewDeclaration: aViewSelector [
	^ localProxyInspector getViewDeclaration: aViewSelector
]

{ #category : #accessing }
GtRemoteInspectionSimulation >> getViewsDeclarations [
	^ localProxyInspector getViewsDeclarations
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

{ #category : #accessing }
GtRemoteInspectionSimulation >> object [
	^ object
]

{ #category : #accessing }
GtRemoteInspectionSimulation >> object: anObject [

	object := anObject.
	
	remoteInspectorProxy := self createViewedObjectFor: anObject.
	localProxyInspector := GtLocalPhlowViewedObject  
		remoteViewedObject:  remoteInspectorProxy
]

{ #category : #'gt inspector' }
GtRemoteInspectionSimulation >> remoteActionFromSpecification: anActionSpecification for: anAction inContext: aContext [ 
	^ anActionSpecification actionFor: anAction 
]

{ #category : #'gt inspector' }
GtRemoteInspectionSimulation >> remoteActionsFor: anAction inContext: aContext [
	^ self declarativeActionSpecifications collect: [ :anActionSpecification | 
		anActionSpecification actionFor: anAction ].
]

{ #category : #accessing }
GtRemoteInspectionSimulation >> remoteClass [
	^ remoteInspectorProxy object class name
]

{ #category : #'gt inspector' }
GtRemoteInspectionSimulation >> remoteViewFromSpecification: aViewSpecification for: aView inContext: aContext [ 
	^ aViewSpecification viewFor: aView.
]

{ #category : #'gt inspector' }
GtRemoteInspectionSimulation >> remoteViewsFor: aView inContext: aContext [
	"Should be all views, but just get Raw and Print views for now"
	
	^ self declarativeViews collect: [ :declarativeView | 
		declarativeView viewFor: aView ].
]
