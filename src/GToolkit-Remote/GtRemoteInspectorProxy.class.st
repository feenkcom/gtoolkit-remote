Class {
	#name : #GtRemoteInspectorProxy,
	#superclass : #Object,
	#instVars : [
		'name',
		'client',
		'accessors',
		'viewDefinitions',
		'viewDeclarations',
		'views'
	],
	#category : #'GToolkit-Remote-Inspection'
}

{ #category : #'instance creation' }
GtRemoteInspectorProxy class >> name: aString client: aClient views: anArray [
	"Answer an instance of the receiver with the supplied name, GtRemoteInspectorClient and array of views"

	^self new name: aString client: aClient views: anArray
]

{ #category : #accessing }
GtRemoteInspectorProxy >> accessors [ 

	^accessors
]

{ #category : #accessing }
GtRemoteInspectorProxy >> declarativeViewAt: id [

	^client declarativeViewAt: id
]

{ #category : #simulation }
GtRemoteInspectorProxy >> gtLocalViewsFor: aView inContext: aContext [
	| title resultingView |
	title := String streamContents: [ :stream |
				stream
					<< 'Proxy to: ';
					<< name ].
	resultingView := ((aView composite
		views: (self gtViewsInContext: aContext))
		labelled: title).
	^ resultingView
]

{ #category : #simulation }
GtRemoteInspectorProxy >> gtProxyFor: aView [
	<gtProxy>

	^(self gtRawFor: aView)
		title: 'Proxy' translated;
		priority: 10000.
]

{ #category : #simulation }
GtRemoteInspectorProxy >> gtProxyViewsFor: aView [
	<gtView>
	^ aView list
		title: 'Proxy views' translated;
		priority: 10001;
		items: [ 
			self accessors ];
		itemFormat: [ :aViewAccessor | aViewAccessor title ];
		send: [ :aViewAccessor | aViewAccessor declarativeView ]
]

{ #category : #simulation }
GtRemoteInspectorProxy >> gtViewsFor: aView [
	"this is the default entry method for retrieving the wrapper view containing all views"
	^ self gtViewsFor: aView inContext: nil
]

{ #category : #simulation }
GtRemoteInspectorProxy >> gtViewsFor: aView inContext: aContext [
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
GtRemoteInspectorProxy >> gtViewsInContext: aContext [
	"This collects all views for the current object.
	For a SeamlessProxy we just want the Raw view renamed as 'Proxy'"
	^ OrderedCollection 
		with: (self gtProxyFor: GtPhlowEmptyView new)
		with: (self gtProxyViewsFor: GtPhlowEmptyView new)
]

{ #category : #simulation }
GtRemoteInspectorProxy >> gtdViewForSelector: aSelector [
	"FIXME! Answer an accessor for the view created by the given selector."
	| view  declaration |
	view := self gtdDeclarativeViewForSelector: aSelector.
	declaration := GtDeclarativeView accessor: view.
	^ declaration viewFor: GtPhlowEmptyView new
]

{ #category : #initialize }
GtRemoteInspectorProxy >> name: aString client: aClient views: anArray [

	name := aString.
	client := aClient.
	accessors := anArray collect: [ :each |
		GtDeclarativeViewAccessorClient new 
			proxy: self;
			title: each first;
			priority: each second;
			id: each third ].

]

{ #category : #accessing }
GtRemoteInspectorProxy >> sentItemAt: relativeUrl [

	^client sentItemAt: relativeUrl
]

{ #category : #accessing }
GtRemoteInspectorProxy >> viewDeclarations [

	| declarativeView |

	^accessors collect: [ :each | each declarativeView ]
	"^viewDeclarations ifNil: [ viewDeclarations := viewDefinitions collect: [ :each | 
		declarativeView := client declarativeViewAt: (each at: 3).
		declarativeView accessor: self.
		declarativeView ] ]"
]

{ #category : #accessing }
GtRemoteInspectorProxy >> viewsFor: aView [

	^accessors collect: [ :each | each viewFor: aView ]
]
