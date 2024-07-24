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
GtRemotePhlowViewedObject >> computeViewSpecificationForPhlowView: aPhlowView [
	^ [ aPhlowView asGtDeclarativeView ] 
		on: Error do: [ :anError |
			| errorView |
			errorView := aPhlowView phlowErrorViewWithException: anError.
			errorView title: aPhlowView title.
			errorView priority: aPhlowView priority.
			
			errorView asGtDeclarativeView ]
]

{ #category : #'api - actions' }
GtRemotePhlowViewedObject >> getActionSpecifications [
	| actionsSpecifications |
	actionsSpecifications := (self actionSpecificationsBySelector 
		collect: [ :anActionSpecification |
			self specificationDataForAction: anActionSpecification ]).
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
GtRemotePhlowViewedObject >> getDeclarativeActionDataSourceFor: anActionSelector [
	^ (self actionSpecificationsBySelector 
		at: anActionSelector) phlowDataSource
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
		at: 'views' put:   (self getViewSpecificationWithPhlowDataSource
			at: 'views');
		at: 'actions' put: (self getActionSpecificationsPhlowDataSource
			at: 'actions');
		yourself
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
GtRemotePhlowViewedObject >> getViewSpecifications [
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
	^ self getViewSpecifications
]

{ #category : #'api - views deprecated' }
GtRemotePhlowViewedObject >> getViewsDeclarationsWithPhlowDataSource [
	^ self getViewSpecificationWithPhlowDataSource
]

{ #category : #initialization }
GtRemotePhlowViewedObject >> initializeActionSpecifications [
	| phlowActions |
	actionSpecificationsBySelector := Dictionary new.

	phlowActions := self phlowDeclarativeActions.
	phlowActions
		do: [ :aPhlowAction | 
			| actionSpecification |
			actionSpecification := self 
				computeActionSpecificationForPhlowAction: aPhlowAction.
			actionSpecification
				ifNotNil: [ 
					actionSpecification methodSelector: aPhlowAction definingSelector.
					actionSpecificationsBySelector
						at: aPhlowAction definingSelector
						put: actionSpecification ] ]
]

{ #category : #initialization }
GtRemotePhlowViewedObject >> initializeViewSpecifications [
	| phlowViews |
	viewSpecificationsBySelector := Dictionary new.

	phlowViews := self phlowDeclarativeViews.
	phlowViews
		do: [ :aPhlowView | 
			| viewSpecification |
			viewSpecification := self computeViewSpecificationForPhlowView: aPhlowView.
			viewSpecification
				ifNotNil: [ 
					viewSpecification methodSelector: aPhlowView definingSelector.
					viewSpecificationsBySelector
						at: aPhlowView definingSelector
						put: viewSpecification ] ]
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
