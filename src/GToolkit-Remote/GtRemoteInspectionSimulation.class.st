"
GtRemoteInspectionSimulation provides an environment for developing and testing remote object inspection within a single image by using converting the views to their declarative form in the inspector.

To open a inspector using the declarative views:

[[[
	GtRemoteInspectionSimulation openOn: anObjectWithDeclarativeViews
]]]


!!Internal Representation and Key Implementation Points.

!!!Instance Variables

	object:		<Object> the object being inspected.

"
Class {
	#name : #GtRemoteInspectionSimulation,
	#superclass : #Object,
	#instVars : [
		'object',
		'viewProxy'
	],
	#category : #'GToolkit-Remote-Development'
}

{ #category : #'instance creation' }
GtRemoteInspectionSimulation class >> openOn: anObject [

	^ self new object: anObject
]

{ #category : #'gt inspector' }
GtRemoteInspectionSimulation >> declarativeViews [
	"Answer the views for the receiver"
	| viewMethodNames rawViews viewDictionary |

	viewMethodNames := viewProxy getGtViewMethodNames.
	rawViews := viewMethodNames collect: [ :viewSelector |
		viewDictionary := viewProxy getViewDeclaration: viewSelector.
		((GtDeclarativeView fromDictionary: viewDictionary)
			accessor: viewProxy;
			methodName: viewSelector;
			yourself) ].
	^ rawViews
]

{ #category : #simulation }
GtRemoteInspectionSimulation >> gtLocalViewsFor: aView inContext: aContext [
	| title resultingView |
	title := String streamContents: [ :stream |
				stream
					<< 'RemoteSimulation to: ';
					<< object class name ].
	resultingView := ((aView composite
		views: (self gtViewsInContext: aContext))
		labelled: title).
	^ resultingView
]

{ #category : #simulation }
GtRemoteInspectionSimulation >> gtProxyFor: aView [
	<gtProxy>

	^(self gtRawFor: aView)
		title: 'Proxy' translated;
		priority: 10000.
]

{ #category : #'gt inspector' }
GtRemoteInspectionSimulation >> gtProxyRawFor: aView [

	^ aView columnedList 
		title: 'Raw';
		priority: 5;
		items: [ viewProxy rawViewData ];
		column: 'Icon' icon: [ :aNode | aNode third iconNamed: aNode first ];
		column: 'Variable' text: [ :aNode | aNode second asRopedText ];
		column: 'Value' text: [ :aNode | 
			[ aNode third gtDisplayString asRopedText ]
				on: Error 
				do: [ :ex | ex messageText asRopedText foreground: Color red ] ];
		send: [ :aNode | aNode third ]
]

{ #category : #'gt inspector' }
GtRemoteInspectionSimulation >> gtProxyViewsFor: aView [
	<gtView>
	^ aView list
		title: 'Proxy views' translated;
		priority: 10001;
		items: [ 	self declarativeViews ];
		itemFormat: [ :view | view title ];
		send: [ :view | view ]
]

{ #category : #simulation }
GtRemoteInspectionSimulation >> gtViewsFor: aView inContext: aContext [
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

{ #category : #simulation }
GtRemoteInspectionSimulation >> gtViewsInContext: aContext [
	"This collects all views for the current object"
	| emptyView |

	emptyView := GtPhlowEmptyView new.
	^ OrderedCollection new
		"The raw view is a special case to easily handle icons"
		add: (self gtProxyRawFor: emptyView);
		add: (self gtProxyFor: emptyView);
		add: (self gtProxyViewsFor: emptyView);
		yourself
]

{ #category : #accessing }
GtRemoteInspectionSimulation >> object [
	^ object
]

{ #category : #accessing }
GtRemoteInspectionSimulation >> object: anObject [

	object := anObject.
	viewProxy := GtViewedObject object: anObject
]

{ #category : #'gt inspector' }
GtRemoteInspectionSimulation >> viewsFor: aView [
	"Should be all views, but just get Raw and Print views for now"

	^ self declarativeViews collect: [ :declarativeView | declarativeView viewFor: aView ].

]
