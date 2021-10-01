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
	#instVars : [
		'object',
		'inspectorProxy'
	],
	#category : #'GToolkit-RemoteGt-Development'
}

{ #category : #'instance creation' }
GtRemoteInspectionSimulation class >> openOn: anObject [

	^ self new object: anObject
]

{ #category : #'gt inspector' }
GtRemoteInspectionSimulation >> declarativeViews [
	"Answer the views for the receiver"
	| declarativeData declarativeViewDeclarations rawViews  |

	declarativeData := inspectorProxy getViewsDeclarations.
	declarativeViewDeclarations := declarativeData at: 'views' ifAbsent: [ #() ].
	rawViews := declarativeViewDeclarations collect: [ :declarativeViewData |
		| declarativeView |
		declarativeView := GtPhlowDeclarativeView fromDictionary: declarativeViewData.
		declarativeView
			initializeFromInspector: inspectorProxy.
		declarativeView ].
	^ rawViews
]

{ #category : #simulation }
GtRemoteInspectionSimulation >> gtInspectorTitleString [
	^ String streamContents: [ :stream |
			stream
				<< 'RemoteSimulation to: ';
				<< object class name ]
]

{ #category : #simulation }
GtRemoteInspectionSimulation >> gtProxyFor: aView [
	<gtProxy>

	^(self gtRawFor: aView)
		title: 'Proxy' translated;
		priority: 10000.
]

{ #category : #'gt inspector' }
GtRemoteInspectionSimulation >> gtProxyViewsFor: aView [
	<gtView>
	^ aView list
		title: 'Proxy views' translated;
		priority: 10001;
		items: [ self declarativeViews ];
		itemText: [ :view | view title ];
		send: [ :view | view ]
]

{ #category : #simulation }
GtRemoteInspectionSimulation >> gtViewsInContext: aContext [
	"This collects all views for the current object"
	| emptyView collectedViews |

	emptyView := GtPhlowEmptyView new.
	collectedViews := OrderedCollection new
		add: (self gtProxyFor: emptyView);
		add: (self gtProxyViewsFor: emptyView);
		addAll: (self remoteViewsFor: emptyView);
		yourself.
	GtPhlowUtility sortByPriority: collectedViews.
	^ collectedViews
]

{ #category : #accessing }
GtRemoteInspectionSimulation >> object [
	^ object
]

{ #category : #accessing }
GtRemoteInspectionSimulation >> object: anObject [

	object := anObject.
	inspectorProxy := GtRemotePhlowViewedObject object: anObject
]

{ #category : #'gt inspector' }
GtRemoteInspectionSimulation >> remoteViewsFor: aView [
	"Should be all views, but just get Raw and Print views for now"

	^ self declarativeViews collect: [ :declarativeView | declarativeView viewFor: aView ].

]
