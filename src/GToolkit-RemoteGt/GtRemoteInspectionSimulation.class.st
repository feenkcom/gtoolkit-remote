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
	#traits : 'TGtRemoteLanguageProxyViewsAttachment + TGtRemoteLanguageProxySpecificViews',
	#classTraits : 'TGtRemoteLanguageProxyViewsAttachment classTrait + TGtRemoteLanguageProxySpecificViews classTrait',
	#instVars : [
		'object',
		'inspectorProxy'
	],
	#category : #'GToolkit-RemoteGt-Development'
}

{ #category : #accessing }
GtRemoteInspectionSimulation class >> leProxyTypeForPlaygroundPage [
	^ self
]

{ #category : #'instance creation' }
GtRemoteInspectionSimulation class >> openOn: anObject [

	^ self new object: anObject
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
GtRemoteInspectionSimulation >> getViewProxy [
	^ inspectorProxy
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
	inspectorProxy := self createViewedObjectFor: anObject
]

{ #category : #accessing }
GtRemoteInspectionSimulation >> remoteClass [
	^ inspectorProxy object class name
]

{ #category : #'gt inspector' }
GtRemoteInspectionSimulation >> remoteViewsFor: aView inContext: aContext [
	"Should be all views, but just get Raw and Print views for now"
	
	^ self declarativeViews collect: [ :declarativeView | 
		declarativeView viewFor: aView ].
]

{ #category : #'gt inspector' }
GtRemoteInspectionSimulation >> viewProxyDo: aBlock [
	^ aBlock value: self getViewProxy.
]
