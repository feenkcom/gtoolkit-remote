"
{{gtClass:GtRemotePhlowViewedObject}} is responsible for serving serialized views to the client inspector.
"
Class {
	#name : #GtRemotePhlowViewedObject,
	#superclass : #Object,
	#instVars : [
		'object',
		'actionSpecificationsBySelector',
		'viewSpecificationsBySelector'
	],
	#category : #'GToolkit-RemotePhlow-InspectorCore'
}

{ #category : #'instance creation' }
GtRemotePhlowViewedObject class >> object: anObject [

	^ self new initializeWith: anObject
]

{ #category : #accessing }
GtRemotePhlowViewedObject >> actionSpecificationsBySelector [
	actionSpecificationsBySelector ifNil: [ 
		self initializeActionSpecifications ].
	^ actionSpecificationsBySelector
]

{ #category : #initialization }
GtRemotePhlowViewedObject >> computeActionSpecificationForPhlowAction: aPhlowAction [
	^ [ aPhlowAction asGtDeclarativeAction ] 
		on: Error do: [ :anError |
			| errorView |
			errorView := aPhlowAction phlowErrorViewWithException: anError.
			errorView title: aPhlowAction title.
			errorView priority: aPhlowAction priority.
			
			errorView asGtDeclarativeAction ]
]

{ #category : #initialization }
GtRemotePhlowViewedObject >> computeDeclarativeActionSpecifications [
	| specifications phlowActions |
	
	specifications := OrderedCollection new. 

	phlowActions := self phlowDeclarativeActions.
	phlowActions
		do: [ :aPhlowAction | 
			| actionSpecification |
			actionSpecification := self 
				computeActionSpecificationForPhlowAction: aPhlowAction.
			actionSpecification
				ifNotNil: [ 
					actionSpecification methodSelector: aPhlowAction definingSelector.
					specifications add: actionSpecification ] ].
					
	^ specifications
]

{ #category : #initialization }
GtRemotePhlowViewedObject >> computeDeclarativeViewSpecifications [
	| specifications phlowViews |

	specifications := OrderedCollection new. 
	
	phlowViews := self phlowDeclarativeViews.
	phlowViews do: [ :aPhlowView | 
		| viewSpecification |
		viewSpecification := self computeViewSpecificationForPhlowView: aPhlowView.
		viewSpecification
			ifNotNil: [ 
				viewSpecification methodSelector: aPhlowView definingSelector.
				specifications add: viewSpecification ] ].
					 
	^ specifications
]

{ #category : #initialization }
GtRemotePhlowViewedObject >> computeViewSpecificationForPhlowView: aPhlowView [
	^ [ aPhlowView asGtDeclarativeView ] 
		on: Error do: [ :anError |
			| errorView |
			errorView := aPhlowView phlowErrorViewWithException: anError.
			errorView title: aPhlowView title.
			errorView priority: aPhlowView priority.
			
			errorView asGtDeclarativeView ]
]

{ #category : #'api - views' }
GtRemotePhlowViewedObject >> getActionSpecificationDataFor: anActionSelector [
	| declarativeAction |
	declarativeAction := self getActionSpecificationFor: anActionSelector.
	^ self specificationDataForAction: declarativeAction
]

{ #category : #'api - actions' }
GtRemotePhlowViewedObject >> getActionSpecificationFor: anActionSelector [
	^ self actionSpecificationsBySelector 
		at: anActionSelector
]

{ #category : #'api - actions' }
GtRemotePhlowViewedObject >> getActionSpecifications [
	^ self getActionSpecificationsData
]

{ #category : #'api - actions' }
GtRemotePhlowViewedObject >> getActionSpecificationsData [
	| actionsSpecifications |
	actionsSpecifications := self actionSpecificationsBySelector 
		collect: [ :anActionSpecification |
			self specificationDataForAction: anActionSpecification ].
	^ Dictionary new
		at: 'actions' put: actionsSpecifications asArray;
		yourself
]

{ #category : #'api - actions' }
GtRemotePhlowViewedObject >> getActionSpecificationsPhlowDataSource [
	| actionsSpecifications |
	actionsSpecifications := (self actionSpecificationsBySelector 
		collect: [ :anActionSpecification |
			(self specificationDataForAction: anActionSpecification)
				ifNotNil: [ :aDictionary |
					aDictionary 
						at: 'phlowDataSource' 
							put: anActionSpecification phlowDataSource;
						yourself ] ]).
	^ Dictionary new
		at: 'actions' put: actionsSpecifications asArray;
		yourself
]

{ #category : #'api - actions' }
GtRemotePhlowViewedObject >> getActionSpecificationsWithPhlowDataSource [
	| actionsSpecifications |
	actionsSpecifications := (self actionSpecificationsBySelector 
		collect: [ :anActionSpecification |
			(self specificationDataForAction: anActionSpecification)
				ifNotNil: [ :aDictionary |
					aDictionary 
						at: 'phlowDataSource' 
							put: anActionSpecification phlowDataSource;
						yourself ] ]).
	^ Dictionary new
		at: 'actions' put: actionsSpecifications asArray;
		yourself
]

{ #category : #'api - actions' }
GtRemotePhlowViewedObject >> getDeclarativeActionDataSourceFor: anActionSelector [
	^ (self getActionSpecificationFor: anActionSelector) phlowDataSource
]

{ #category : #'api - views deprecated' }
GtRemotePhlowViewedObject >> getDeclarativeViewFor: viewSelector [
	^ self getViewSpecificationFor: viewSelector
]

{ #category : #'api - views' }
GtRemotePhlowViewedObject >> getDeclarativeViewMethodNames [
	"Answer the set of declarative view selectors provided by the object"

	^ self viewSpecificationsBySelector keys
]

{ #category : #'api  - inspector' }
GtRemotePhlowViewedObject >> getInspectorSpecificationWithPhlowDataSource [
	^ Dictionary new 
		at: 'gtDisplayString' put: (
			self getRemoteObjectGtDisplayString);
		at: 'views' put:   (self getViewSpecificationWithPhlowDataSource
			at: 'views');
		at: 'actions' put: (self getActionSpecificationsWithPhlowDataSource
			at: 'actions');
		yourself
]

{ #category : #'api - printing' }
GtRemotePhlowViewedObject >> getRemoteObjectGtDisplayString [
	^ object gtDisplayString
]

{ #category : #'api - views deprecated' }
GtRemotePhlowViewedObject >> getViewDeclaration: aViewSelector [
	^ self getViewSpecificationDataFor: aViewSelector
]

{ #category : #'api - views' }
GtRemotePhlowViewedObject >> getViewSpecificationDataFor: aViewSelector [
	| declarativeView |
	declarativeView := self getViewSpecificationFor: aViewSelector.
	^ self specificationDataForView: declarativeView
]

{ #category : #'api - views' }
GtRemotePhlowViewedObject >> getViewSpecificationFor: viewSelector [
	^ self viewSpecificationsBySelector at: viewSelector
]

{ #category : #'api  - inspector' }
GtRemotePhlowViewedObject >> getViewSpecificationWithPhlowDataSource [
	| viewDeclarations |
	viewDeclarations := (self viewSpecificationsBySelector 
		collect: [ :aViewSpecification |
			(self specificationDataForView: aViewSpecification)
				ifNotNil: [ :aDictionary |
					aDictionary 
						at: 'phlowDataSource' put: aViewSpecification;
						yourself ] ]).
	^ Dictionary new
		at: 'views' put: viewDeclarations asArray;
		yourself
]

{ #category : #'api - views' }
GtRemotePhlowViewedObject >> getViewSpecificationsData [
	| viewDeclarations |
	viewDeclarations := (self viewSpecificationsBySelector 
		collect: [ :aViewSpecification |
			self specificationDataForView: aViewSpecification ]).
	^ Dictionary new
		at: 'views' put: viewDeclarations asArray;
		yourself
]

{ #category : #'api - views deprecated' }
GtRemotePhlowViewedObject >> getViewsDeclarations [
	^ self getViewSpecificationsData
]

{ #category : #'api - views deprecated' }
GtRemotePhlowViewedObject >> getViewsDeclarationsWithPhlowDataSource [
	^ self getViewSpecificationWithPhlowDataSource
]

{ #category : #'gt - extensions' }
GtRemotePhlowViewedObject >> gtViewCurrentViewsFor: aView [
	<gtView>
	
	^ aView columnedList
		title: 'Current views';
		priority: 10;
		items: [ (viewSpecificationsBySelector
			ifNil: [ #() ] ifNotNil: [ :aDictionary | aDictionary values ]) 
				sort: [ :a :b |  a priority < b priority ]];
		column: 'Title' text: [ :aViewAccessor | aViewAccessor title ];
		column: 'Selector' text: [ :aViewAccessor | aViewAccessor methodSelector ];
		column: 'View' text: [ :aViewAccessor | aViewAccessor viewName ];
		column: 'Priority' text: [ :aViewAccessor | aViewAccessor priority ] width: 75;
		column: 'Transport' text: [ :aViewAccessor | aViewAccessor dataTransport ] width: 75;
		send: [ :aDeclarativeView | aDeclarativeView ]
]

{ #category : #'gt - extensions' }
GtRemotePhlowViewedObject >> gtViewsCurrentActionsFor: aView [
	<gtView>
	
	^ aView columnedList
		title: 'Current actions';
		priority: 20;
		items: [ (actionSpecificationsBySelector
			ifNil: [ #() ] ifNotNil: [ :aDictionary | aDictionary values ]) 
				sort: [ :a :b |  a priority < b priority ]];
		column: 'Tooltip' text: [ :aViewAccessor | aViewAccessor tooltipText ];
		column: 'Label' text: [ :aViewAccessor | aViewAccessor label ];
		"column: 'Icon' 
			icon: [ :aViewAccessor | 
				aViewAccessor iconStencil ifNil: [BlElement new
					size: 0@0] ] 
			width: 75;"
		column: 'Selector' text: [ :aViewAccessor | aViewAccessor methodSelector ];
		column: 'Priority' text: [ :aViewAccessor | aViewAccessor priority ] width: 70;
		send: [ :aDeclarativeView | aDeclarativeView ]
]

{ #category : #initialization }
GtRemotePhlowViewedObject >> initializeActionSpecifications [
	actionSpecificationsBySelector := Dictionary new.

	self computeDeclarativeActionSpecifications
		do: [ :anActionSpecification |
			actionSpecificationsBySelector
				at: anActionSpecification methodSelector
				put: anActionSpecification ] 
]

{ #category : #initialization }
GtRemotePhlowViewedObject >> initializeViewSpecifications [
	viewSpecificationsBySelector := Dictionary new.

	self computeDeclarativeViewSpecifications
		do: [ :aViewSpecification| 
			viewSpecificationsBySelector
				at: aViewSpecification methodSelector
				put: aViewSpecification ] 
]

{ #category : #initialization }
GtRemotePhlowViewedObject >> initializeWith: anObject [
	object := anObject
]

{ #category : #accessing }
GtRemotePhlowViewedObject >> object [

	^ object
]

{ #category : #initialization }
GtRemotePhlowViewedObject >> phlowDeclarativeActions [
	"Retrieve the declarative phlow actions of the current object."
	
	 ^ object gtDeclarativePhlowActions.
]

{ #category : #initialization }
GtRemotePhlowViewedObject >> phlowDeclarativeViews [
	"Retrieve the objects declarative views.
	If the default Raw view can't be declarative, provide one that is."
	| views |

	views := object gtDeclarativePhlowViews.
	views 
		detect: [ :each | each title = 'Raw' ]
		ifNone: [ views := views, (Array with: (object 
			gtRemoteGtRawFor: #GtPhlowView asClass empty)) ].
	
	^ views
]

{ #category : #utils }
GtRemotePhlowViewedObject >> specificationDataForAction: anActionSpecification [

	^ anActionSpecification asDictionaryForExport
]

{ #category : #utils }
GtRemotePhlowViewedObject >> specificationDataForView: aViewSpecification [

	^ aViewSpecification asDictionaryForExport
]

{ #category : #accessing }
GtRemotePhlowViewedObject >> viewSpecificationsBySelector [
	viewSpecificationsBySelector ifNil: [ 
		self initializeViewSpecifications ].
	^ viewSpecificationsBySelector
]
