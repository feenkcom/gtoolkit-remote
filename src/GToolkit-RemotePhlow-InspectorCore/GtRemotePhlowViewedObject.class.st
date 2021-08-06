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
	#name : 'GtRemotePhlowViewedObject',
	#superclass : 'Object',
	#instVars : [
		'object',
		'declarativeViewsBySelector'
	],
	#category : 'GToolkit-RemotePhlow-InspectorCore'
}

{ #category : 'instance creation' }
GtRemotePhlowViewedObject class >> object: anObject [

	^ self new initializeWith: anObject
]

{ #category : 'accessing' }
GtRemotePhlowViewedObject >> declarativeViewsBySelector [
	declarativeViewsBySelector ifNil: [ 
		self initializeDeclarativeViews ].
	^ declarativeViewsBySelector
]

{ #category : 'accessing' }
GtRemotePhlowViewedObject >> getDeclarativeOriginalPhlowViews [
	^ object gtDeclarativePhlowViews 
		"reject: [ :aView |
			aView definingSelector = #gtRawFor: or: [ 
				aView definingSelector = #gtPrintFor: ] ]"
]

{ #category : 'api - accessing' }
GtRemotePhlowViewedObject >> getDeclarativeViewFor: viewSelector [
	^ self declarativeViewsBySelector at: viewSelector
]

{ #category : 'api - accessing' }
GtRemotePhlowViewedObject >> getDeclarativeViewMethodNames [
	"Answer the set of declarative view selectors provided by the object"

	^ self declarativeViewsBySelector keys
]

{ #category : 'api - accessing' }
GtRemotePhlowViewedObject >> getViewDeclaration: viewSelector [
	| declarativeView |
	declarativeView := self getDeclarativeViewFor: viewSelector.
	^ self getViewDeclarationForView: declarativeView
]

{ #category : 'api - accessing' }
GtRemotePhlowViewedObject >> getViewDeclarationForView: aDeclarativeView [
	^ aDeclarativeView asDictionaryForExport
		at: #'__pharolinkImmediate' put: true;
		yourself.	
]

{ #category : 'api - accessing' }
GtRemotePhlowViewedObject >> getViewsDeclarations [
	| viewDeclarations |
	viewDeclarations := (self declarativeViewsBySelector 
		collect: [ :declarativeView |
			self getViewDeclarationForView: declarativeView ]).
	
	^ Dictionary new
		at: #'__pharolinkImmediate' put: true;
		at: 'views' put: viewDeclarations asArray;
		yourself
]

{ #category : 'initialization' }
GtRemotePhlowViewedObject >> initializeDeclarativeViews [
	| phlowViews |
	declarativeViewsBySelector := Dictionary new.
	
	phlowViews := self getDeclarativeOriginalPhlowViews.
	phlowViews do: [ :aPhlowView | 
		| declarativeView |
		declarativeView := aPhlowView asGtDeclarativeView.
		declarativeView ifNotNil: [
			declarativeView methodSelector: aPhlowView definingSelector.
			declarativeViewsBySelector 
				at: aPhlowView definingSelector 
				put: declarativeView ] ]
]

{ #category : 'initialization' }
GtRemotePhlowViewedObject >> initializeWith: anObject [
	object := anObject
]

{ #category : 'accessing' }
GtRemotePhlowViewedObject >> object [

	^ object
]
