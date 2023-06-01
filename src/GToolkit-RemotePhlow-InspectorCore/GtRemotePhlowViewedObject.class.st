"
GtRemotePhlowViewedObject is responsible for serving declarative views to the client inspector.


Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
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
GtRemotePhlowViewedObject >> getViewDeclaration: viewSelector [
	| declarativeView |
	declarativeView := self getDeclarativeViewFor: viewSelector.
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
		collect: [ :declarativeView |
			self getViewDeclarationForView: declarativeView ]).
	^ Dictionary new
		at: 'views' put: viewDeclarations asArray;
		yourself
]

{ #category : #initialization }
GtRemotePhlowViewedObject >> initializeDeclarativeViews [
	| phlowViews |
	declarativeViewsBySelector := Dictionary new.
	
	phlowViews := self phlowDeclarativeViews.
	phlowViews do: [ :aPhlowView | 
		| declarativeView |
		declarativeView := aPhlowView asGtDeclarativeView.
		declarativeView ifNotNil: [
			declarativeView methodSelector: aPhlowView definingSelector.
			declarativeViewsBySelector 
				at: aPhlowView definingSelector 
				put: declarativeView ] ]
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
		ifNone: [ views, (Array with: (object gtRemoteGtRawFor: #GtPhlowView asClass empty)) ].
	
	^ views
]
