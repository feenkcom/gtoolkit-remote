"
{{gtClass:GtRemotePhlowViewedObject}} is responsible for serving serialized views to the client inspector.
"
Class {
	#name : #GtRemotePhlowViewedObject,
	#superclass : #Object,
	#instVars : [
		'object',
		'declarativeViewsBySelector'
	],
	#category : #'GToolkit-RemotePhlow-InspectorCore'
}

{ #category : #'instance creation' }
GtRemotePhlowViewedObject class >> object: anObject [

	^ self new initializeWith: anObject
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

{ #category : #accessing }
GtRemotePhlowViewedObject >> declarativeViewsBySelector [
	declarativeViewsBySelector ifNil: [ 
		self initializeDeclarativeViews ].
	^ declarativeViewsBySelector
]

{ #category : #'api - accessing' }
GtRemotePhlowViewedObject >> getDeclarativeViewFor: viewSelector [
	^ self declarativeViewsBySelector at: viewSelector
]

{ #category : #'api - accessing' }
GtRemotePhlowViewedObject >> getDeclarativeViewMethodNames [
	"Answer the set of declarative view selectors provided by the object"

	^ self declarativeViewsBySelector keys
]

{ #category : #'api - accessing' }
GtRemotePhlowViewedObject >> getViewDeclaration: aViewSelector [
	| declarativeView |
	declarativeView := self getDeclarativeViewFor: aViewSelector.
	^ self getViewDeclarationForView: declarativeView
]

{ #category : #'api - accessing' }
GtRemotePhlowViewedObject >> getViewDeclarationForView: aDeclarativeView [

	^ aDeclarativeView asDictionaryForExport
]

{ #category : #'api - accessing' }
GtRemotePhlowViewedObject >> getViewsDeclarations [
	| viewDeclarations |
	viewDeclarations := (self declarativeViewsBySelector 
		collect: [ :aDeclarativeView |
			self getViewDeclarationForView: aDeclarativeView ]).
	^ Dictionary new
		at: 'views' put: viewDeclarations asArray;
		yourself
]

{ #category : #'api - accessing' }
GtRemotePhlowViewedObject >> getViewsDeclarationsWithPhlowDataSource [
	| viewDeclarations |
	viewDeclarations := (self declarativeViewsBySelector 
		collect: [ :aDeclarativeView |
			(self getViewDeclarationForView: aDeclarativeView)
				ifNotNil: [ :aDictionary |
					aDictionary 
						at: 'phlowDataSource' put: aDeclarativeView;
						yourself ] ]).
	^ Dictionary new
		at: 'views' put: viewDeclarations asArray;
		yourself
]

{ #category : #initialization }
GtRemotePhlowViewedObject >> initializeDeclarativeViews [
	| phlowViews |
	declarativeViewsBySelector := Dictionary new.

	phlowViews := self phlowDeclarativeViews.
	phlowViews
		do: [ :aPhlowView | 
			| viewSpecification |
			viewSpecification := self computeViewSpecificationForPhlowView: aPhlowView.
			viewSpecification
				ifNotNil: [ viewSpecification methodSelector: aPhlowView definingSelector.
					declarativeViewsBySelector
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
