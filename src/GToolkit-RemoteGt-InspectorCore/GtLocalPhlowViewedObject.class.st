Class {
	#name : #GtLocalPhlowViewedObject,
	#superclass : #Object,
	#instVars : [
		'remoteViewedObject',
		'viewSpecificationsBySelector',
		'actionSpecificationsBySelector',
		'gtDisplayString',
		'classSpecification'
	],
	#category : #'GToolkit-RemoteGt-InspectorCore'
}

{ #category : #'instance creation' }
GtLocalPhlowViewedObject class >> fromProxy: aProxy withData: aDictionary [
	^ self new 
		initializeFromProxy: aProxy withData: aDictionary
]

{ #category : #'instance creation' }
GtLocalPhlowViewedObject class >> remoteViewedObject: aViewedObject [
	^ self new 
		initializeWithRemoteViewedObject: aViewedObject
]

{ #category : #'api - specifications' }
GtLocalPhlowViewedObject >> actionSpecificationsBySelector [
	actionSpecificationsBySelector 
		ifNil: [ self initializeActionSpecifications ].
	^ actionSpecificationsBySelector 
]

{ #category : #accessing }
GtLocalPhlowViewedObject >> computeDeclarativeActionSpecifications [
	| specificationData specificationActionsData |
	 
	specificationData := self getActionSpecifications.
	specificationActionsData := specificationData at: 'actions' ifAbsent: [ #() ].
	^ specificationActionsData collect: [ :anActionSpecificationData |
		| actionSpecification |
		actionSpecification := GtPhlowActionSpecification 
			phlowActionFromDictionary: anActionSpecificationData.
		actionSpecification
			initializeFromInspector: self.
		actionSpecification ].
]

{ #category : #accessing }
GtLocalPhlowViewedObject >> computeDeclarativeViewSpecifications [
	| specificationData specificationViewsData |
		
	specificationData := self getViewsDeclarations.
	specificationViewsData := specificationData at: 'views' ifAbsent: [ #() ].
	^ specificationViewsData collect: [ :aViewSpecificationData |
		| viewSpecification |
		viewSpecification := GtPhlowViewSpecification 
			fromDictionary: aViewSpecificationData.
		viewSpecification
			initializeFromInspector: self.
		viewSpecification ] 
]

{ #category : #'api - specifications' }
GtLocalPhlowViewedObject >> currentClassSpecifications [
	^ classSpecification "ifNil: [
		classSpecification := self getClassSpecification]"
]

{ #category : #'api - specifications' }
GtLocalPhlowViewedObject >> currentDeclarativeActionSpecifications [
	^ self actionSpecificationsBySelector values 
]

{ #category : #'api - specifications' }
GtLocalPhlowViewedObject >> currentDeclarativeViewSpecifications [
	^ self viewSpecificationsBySelector values
]

{ #category : #'api - actions' }
GtLocalPhlowViewedObject >> getActionSpecificationDataFor: anActionSelector [
	| declarativeAction |
	declarativeAction := self getActionSpecificationFor: anActionSelector.
	^ self specificationDataForAction: declarativeAction
]

{ #category : #'api - actions' }
GtLocalPhlowViewedObject >> getActionSpecificationFor: anActionSelector [
	^ self actionSpecificationsBySelector 
		at: anActionSelector
]

{ #category : #'api - actions' }
GtLocalPhlowViewedObject >> getActionSpecifications [
	^ remoteViewedObject getActionSpecifications
]

{ #category : #accessing }
GtLocalPhlowViewedObject >> getClassSpecification [
	^ GtRemotePhlowViewedObjectClassSpecification fromDictionary: self getClassSpecificationData
]

{ #category : #accessing }
GtLocalPhlowViewedObject >> getClassSpecificationData [
	
	^ remoteViewedObject getClassSpecificationData
]

{ #category : #accessing }
GtLocalPhlowViewedObject >> getDeclarativeActionDataSourceFor: anActionSelector [

	(actionSpecificationsBySelector notNil and: [
		actionSpecificationsBySelector includesKey: anActionSelector ])
			ifTrue: [ 
				^ (actionSpecificationsBySelector at: anActionSelector)
					phlowDataSource ].
	
	^ remoteViewedObject 
		getDeclarativeActionDataSourceFor: anActionSelector
]

{ #category : #accessing }
GtLocalPhlowViewedObject >> getDeclarativeViewFor: aViewSelector [
	^ self getViewSpecificationFor: aViewSelector
]

{ #category : #'api - views' }
GtLocalPhlowViewedObject >> getDeclarativeViewMethodNames [
	"Answer the set of declarative view selectors provided by the object"

	^ self viewSpecificationsBySelector keys
]

{ #category : #'api - views' }
GtLocalPhlowViewedObject >> getInspectorSpecificationData [
	^ remoteViewedObject getInspectorSpecificationData
]

{ #category : #accessing }
GtLocalPhlowViewedObject >> getRemoteObjectGtDisplayString [
	gtDisplayString ifNil: [
		gtDisplayString := remoteViewedObject getRemoteObjectGtDisplayString ].
	
	^ gtDisplayString
]

{ #category : #'api - views deprecated' }
GtLocalPhlowViewedObject >> getViewDeclaration: aViewSelector [
	^ self getViewSpecificationDataFor: aViewSelector
]

{ #category : #'api - views' }
GtLocalPhlowViewedObject >> getViewSpecificationDataFor: aViewSelector [
	| declarativeView |
	declarativeView := self getViewSpecificationFor: aViewSelector.
	^ self specificationDataForView: declarativeView
]

{ #category : #accessing }
GtLocalPhlowViewedObject >> getViewSpecificationFor: aViewSelector [

	(viewSpecificationsBySelector notNil and: [
		viewSpecificationsBySelector includesKey: aViewSelector ])
			ifTrue: [ 
				^ viewSpecificationsBySelector at: aViewSelector ].
	
	^ remoteViewedObject getDeclarativeViewFor: aViewSelector
]

{ #category : #'api - views' }
GtLocalPhlowViewedObject >> getViewsDeclarations [
	^ remoteViewedObject getViewsDeclarations
]

{ #category : #'gt - extensions' }
GtLocalPhlowViewedObject >> gtRemoteActionSpecificationsFor: aView [
	<gtView>
	
	^ aView columnedList
		title: 'Remote action specifications';
		priority: 20;
		items: [ self currentDeclarativeActionSpecifications 
			sorted: #priority ascending];
		column: 'Tooltip' text: [ :aViewAccessor | aViewAccessor tooltipText ];
		column: 'Label' text: [ :aViewAccessor | aViewAccessor label ];
		column: 'Icon' 
			icon: [ :aViewAccessor | 
				aViewAccessor iconStencil ifNil: [BlElement new
					size: 0@0] ] 
			width: 75;
		column: 'Selector' text: [ :aViewAccessor | aViewAccessor methodSelector ];
		column: 'Priority' text: [ :aViewAccessor | aViewAccessor priority ] weight: 0.5;
		send: [ :aDeclarativeView | aDeclarativeView ]
]

{ #category : #'gt - extensions' }
GtLocalPhlowViewedObject >> gtRemoteInspectorSpecificationsFor: aView [
	<gtView>
	
	^ aView forward
		title: 'Remote specification';
		priority: 30;
		object: [ GtJson
			forJsonString: (NeoJSONWriter 
				toStringPretty:  self getInspectorSpecificationData) ];
		view: #gtJsonStringFor:;
		actionButtonIcon: BrGlamorousVectorIcons inspect 
			label: 'Json'
			tooltip: 'Inspect the JSON object'
			action: [ :aButton |
				aButton phlow 
					spawnObject: aButton phlow forwardViewObjectFromViewAction ]
]

{ #category : #'gt - extensions' }
GtLocalPhlowViewedObject >> gtRemoteViewSpecificationsFor: aView [
	<gtView>
	
	^ aView columnedList
		title: 'Remote view specifications';
		priority: 10;
		items: [ 
			self currentDeclarativeViewSpecifications 
				sorted: #priority ascending];
		column: 'Title' text: [ :aViewAccessor | aViewAccessor title ];
		column: 'Selector' text: [ :aViewAccessor | aViewAccessor methodSelector ];
		column: 'View' text: [ :aViewAccessor | aViewAccessor viewName ];
		column: 'Priority' text: [ :aViewAccessor | aViewAccessor priority ] weight: 0.5;
		column: 'Transport' text: [ :aViewAccessor | aViewAccessor dataTransport ] weight: 0.5;
		send: [ :aDeclarativeView | aDeclarativeView ]
]

{ #category : #accessing }
GtLocalPhlowViewedObject >> hasCachedViewSpecifications [
	^ viewSpecificationsBySelector notNil
]

{ #category : #accessing }
GtLocalPhlowViewedObject >> initializeActionSpecifications [
	actionSpecificationsBySelector := Dictionary new.
	
	self computeDeclarativeActionSpecifications 
		do: [ :anActionSpecification |
			actionSpecificationsBySelector
				at: anActionSpecification methodSelector
				put: anActionSpecification  ]
]

{ #category : #initialization }
GtLocalPhlowViewedObject >> initializeActionsFromProxyData: aDictionary [
	|  declarativeActionsSpecifications |
	declarativeActionsSpecifications := aDictionary at: 'actions' ifAbsent: [ nil ].
				
	declarativeActionsSpecifications ifNotNil: [
		actionSpecificationsBySelector := (declarativeActionsSpecifications 
			collect: [ :actionSpecificationData |
				| actionSpecification |
				actionSpecification := GtPhlowActionSpecification 
					phlowActionFromDictionary: actionSpecificationData.
				actionSpecification methodSelector -> actionSpecification ]) asDictionary ]
]

{ #category : #initialization }
GtLocalPhlowViewedObject >> initializeClassSpecificationFromProxyData: aDictionary [
	|  classSpecificationData |
	classSpecificationData := aDictionary at: 'class' ifAbsent: [ nil ].
				
	classSpecificationData ifNotNil: [
		classSpecification := GtRemotePhlowViewedObjectClassSpecification
			fromDictionary: classSpecificationData ]
]

{ #category : #initialization }
GtLocalPhlowViewedObject >> initializeDisplayStringFromProxyData: aDictionary [
	gtDisplayString := aDictionary at: 'gtDisplayString' ifAbsent: [ nil ].
]

{ #category : #initialization }
GtLocalPhlowViewedObject >> initializeFromProxy: aProxy withData: aDictionary [
	remoteViewedObject := aProxy.
	
	self initializeFromProxyData: aDictionary
]

{ #category : #initialization }
GtLocalPhlowViewedObject >> initializeFromProxyData: aDictionary [
	self initializeDisplayStringFromProxyData: aDictionary.
	self initializeViewsFromProxyData: aDictionary.
	self initializeActionsFromProxyData: aDictionary.
	self initializeClassSpecificationFromProxyData: aDictionary.
]

{ #category : #accessing }
GtLocalPhlowViewedObject >> initializeViewSpecifications [
	viewSpecificationsBySelector := Dictionary new.
	
	self computeDeclarativeViewSpecifications 
		do: [ :anViewSpecification |
			viewSpecificationsBySelector
				at: anViewSpecification methodSelector
				put: anViewSpecification  ]
]

{ #category : #initialization }
GtLocalPhlowViewedObject >> initializeViewsFromProxyData: aDictionary [
	| declarativeViewSpecifications |
	declarativeViewSpecifications := aDictionary at: 'views' ifAbsent: [ nil ].
	
	declarativeViewSpecifications ifNotNil: [
		viewSpecificationsBySelector := (declarativeViewSpecifications 
			collect: [ :viewSpecificationData |
				| viewSpecification |
				viewSpecification := GtPhlowViewSpecification 
					fromDictionary: viewSpecificationData.
				viewSpecification methodSelector -> viewSpecification ]) asDictionary ].
]

{ #category : #initialization }
GtLocalPhlowViewedObject >> initializeWithRemoteViewedObject: aViewedObject [
	remoteViewedObject := aViewedObject
]

{ #category : #accessing }
GtLocalPhlowViewedObject >> rawActionSpecificationsBySelector [
	^ actionSpecificationsBySelector
]

{ #category : #accessing }
GtLocalPhlowViewedObject >> rawViewSpecificationsBySelector [
	^ viewSpecificationsBySelector
]

{ #category : #accessing }
GtLocalPhlowViewedObject >> remoteClass [
	^ remoteViewedObject remoteClass
]

{ #category : #utils }
GtLocalPhlowViewedObject >> specificationDataForAction: anActionSpecification [

	^ anActionSpecification asDictionaryForExport
]

{ #category : #utils }
GtLocalPhlowViewedObject >> specificationDataForView: aViewSpecification [

	^ aViewSpecification asDictionaryForExport
]

{ #category : #'api - specifications' }
GtLocalPhlowViewedObject >> viewSpecificationsBySelector [
	viewSpecificationsBySelector ifNil: [ 
		self initializeViewSpecifications ].
	^ viewSpecificationsBySelector
]
