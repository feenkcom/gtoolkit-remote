Class {
	#name : #GtLocalPhlowViewedObject,
	#superclass : #Object,
	#instVars : [
		'remoteViewedObject',
		'viewSpecificationsBySelector',
		'actionSpecificationsBySelector'
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
GtLocalPhlowViewedObject >> currentDeclarativeActionSpecifications [
	^ self actionSpecificationsBySelector values 
]

{ #category : #'api - specifications' }
GtLocalPhlowViewedObject >> currentDeclarativeViewSpecifications [
	^ self viewSpecificationsBySelector values
]

{ #category : #'api - actions' }
GtLocalPhlowViewedObject >> getActionSpecifications [
	^ remoteViewedObject getActionSpecifications
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
GtLocalPhlowViewedObject >> initializeFromProxy: aProxy withData: aDictionary [
	remoteViewedObject := aProxy.
	
	self initializeFromProxyData: aDictionary
]

{ #category : #initialization }
GtLocalPhlowViewedObject >> initializeFromProxyData: aDictionary [
	| declarativeViewSpecifications declarativeActionsSpecifications |
	declarativeViewSpecifications := aDictionary at: 'views' ifAbsent: [ nil ].
	declarativeActionsSpecifications := aDictionary at: 'actions' ifAbsent: [ nil ].
	
	declarativeViewSpecifications ifNotNil: [
		viewSpecificationsBySelector := (declarativeViewSpecifications 
			collect: [ :viewSpecificationData |
				| viewSpecification |
				viewSpecification := GtPhlowViewSpecification 
					fromDictionary: viewSpecificationData.
				viewSpecification methodSelector -> viewSpecification ]) asDictionary ].
				
	declarativeActionsSpecifications ifNotNil: [
		actionSpecificationsBySelector := (declarativeActionsSpecifications 
			collect: [ :actionSpecificationData |
				| actionSpecification |
				actionSpecification := GtPhlowActionSpecification 
					phlowActionFromDictionary: actionSpecificationData.
				actionSpecification methodSelector -> actionSpecification ]) asDictionary ]
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
	| declarativeViewSpecifications declarativeActionsSpecifications |
	declarativeViewSpecifications := aDictionary at: 'views' ifAbsent: [ nil ].
	declarativeActionsSpecifications := aDictionary at: 'actions' ifAbsent: [ nil ].
	
	declarativeViewSpecifications ifNotNil: [
		viewSpecificationsBySelector := (declarativeViewSpecifications 
			collect: [ :viewSpecificationData |
				| viewSpecification |
				viewSpecification := GtPhlowViewSpecification 
					fromDictionary: viewSpecificationData.
				viewSpecification methodSelector -> viewSpecification ]) asDictionary ].
				
	declarativeActionsSpecifications ifNotNil: [
		actionSpecificationsBySelector := (declarativeActionsSpecifications 
			collect: [ :actionSpecificationData |
				| actionSpecification |
				actionSpecification := GtPhlowActionSpecification 
					phlowActionFromDictionary: actionSpecificationData.
				actionSpecification methodSelector -> actionSpecification ]) asDictionary ]
]

{ #category : #initialization }
GtLocalPhlowViewedObject >> initializeWithRemoteViewedObject: aViewedObject [
	remoteViewedObject := aViewedObject
]

{ #category : #'api - specifications' }
GtLocalPhlowViewedObject >> viewSpecificationsBySelector [
	viewSpecificationsBySelector ifNil: [ 
		self initializeViewSpecifications ].
	^ viewSpecificationsBySelector
]
