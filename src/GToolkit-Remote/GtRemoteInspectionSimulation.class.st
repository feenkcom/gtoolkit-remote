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
		'object'
	],
	#category : #'GToolkit-Remote-Development'
}

{ #category : #'instance creation' }
GtRemoteInspectionSimulation class >> openOn: anObject [

	GtInspector openOn: (self new object: anObject)
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
	<gtView>
	^ aView columnedList
		title: 'Proxy' translated;
		priority: 10000;
		items: [ 
			{ 'object' -> object. } ];
		column: 'Icon' do: [:aColumn | 
			aColumn 
				itemStencil: [ :aNode |
					| icon |
					icon := ([ aNode value gtInspectorIcon ifNil: [ aNode value class systemIcon ] ]
						on: Error 
						do: [ :error | aView iconNamed: #smallWarningIcon ]).
					icon asElement 
						margin: (BlInsets top: 3 left: 0 bottom: 3 right: 0 ) ];
				noResize ];
		column: 'Variable' do: [:aColumn |
			aColumn 
				itemFormat: [ :aNode | aNode key asRopedText ];
				matchParent ];
		column: 'Value' do: [ :aColumn |
			aColumn 
				itemFormat: [ :aNode |
					[ aNode value gtDisplayString asRopedText ] 
						on: Error, Halt
						do: [ aNode errorMessage asRopedText foreground: Color red ] ];
			matchParent ];
		send: #value
]

{ #category : #simulation }
GtRemoteInspectionSimulation >> gtViewsFor: aView [
	"this is the default entry method for retrieving the wrapper view containing all views"
	^ self gtViewsFor: aView inContext: nil
]

{ #category : #simulation }
GtRemoteInspectionSimulation >> gtViewsFor: aView inContext: aContext [
	"Add the declarative views from the inspectors object to the inspectors views"

	| resultingView views declaration |

	resultingView := self gtLocalViewsFor: aView inContext: aContext.
	views := resultingView originalView views.

	"Add the explicitly declarative views from the inspected object"
	views addAll: (object gtDeclarativeViewAccessors collect: [ :each |
		"Retrieve the JSON string declaration and instantiate the actual declarative view"
		declaration := GtDeclarativeView accessor: each.
		declaration viewFor: aView ]).

	"Re-sort by priority"
	views := views sorted: [ :a :b | a priority < b priority ].
	resultingView originalView views: views.
	^resultingView
]

{ #category : #simulation }
GtRemoteInspectionSimulation >> gtViewsInContext: aContext [
	"This collects all views for the current object.
	For a SeamlessProxy we just want the Raw view renamed as 'Proxy'"
	^ OrderedCollection with: (self gtProxyFor: GtPhlowEmptyView new)
]

{ #category : #simulation }
GtRemoteInspectionSimulation >> gtdViewForSelector: aSelector [
	"Answer an accessor for the view created by the given selector."
	| view  declaration |
	view := object gtdDeclarativeViewForSelector: aSelector.
	declaration := GtDeclarativeView accessor: view.
	^ declaration viewFor: GtPhlowEmptyView new
]

{ #category : #accessing }
GtRemoteInspectionSimulation >> object [
	^ object
]

{ #category : #accessing }
GtRemoteInspectionSimulation >> object: anObject [
	object := anObject
]
