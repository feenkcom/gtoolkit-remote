"
GtViewedObject is responsible for serving declarative views to the client inspector.


Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points


"
Class {
	#name : 'GtViewedObject',
	#superclass : 'Object',
	#instVars : [
		'object',
		'declarativeViewsBySelector'
	],
	#category : 'GToolkit-RemoteGt-Server'
}

{ #category : 'instance creation' }
GtViewedObject class >> object: anObject [

	^ self new initializeWith: anObject
]

{ #category : 'accessing' }
GtViewedObject >> declarativeViewsBySelector [
	^ declarativeViewsBySelector ifNil: [ 
		declarativeViewsBySelector := Dictionary new ]
]

{ #category : 'api - accessing' }
GtViewedObject >> getDeclarativeViewFor: viewSelector [
	^ self declarativeViewsBySelector 
		at: viewSelector 
		ifAbsentPut: [
			(self object 
				perform: viewSelector
				with: GtPhlowEmptyView new) asGtDeclarativeView ]
]

{ #category : 'api - accessing' }
GtViewedObject >> getDeclarativeViewMethodNames [
	"Answer the set of declarative view selectors provided by the object"

	^ (object gtDeclarativeViewSelectors 
		copyWithout: #gtRawFor:)
		copyWithout: #gtPrintFor:
]

{ #category : 'api - accessing' }
GtViewedObject >> getViewDeclaration: viewSelector [
	^ ((self getDeclarativeViewFor: viewSelector) 
		ifNotNil: [ :view |
			view asDictionaryForExport
				at: #'__pharolinkImmediate' put: true;
				yourself. ])
		
]

{ #category : 'api - accessing' }
GtViewedObject >> getViewsDeclarations [
	| viewSelectors declarativeViews viewsDictionaries |
	viewSelectors := self getDeclarativeViewMethodNames.
	declarativeViews := (viewSelectors 
		collect: [ :viewSelector |
			| declarativeView |
			declarativeView := self getDeclarativeViewFor: viewSelector.
			declarativeView ifNotNil: [
				declarativeView methodSelector: viewSelector ].
			declarativeView ])
		reject: [ :aDeclarativeView | aDeclarativeView isNil ].
	viewsDictionaries := declarativeViews collect: [ :aDeclarativeView |
		aDeclarativeView asDictionaryForExport
			at: #'__pharolinkImmediate' put: true;
			yourself ].
	
	^ Dictionary new
		at: #'__pharolinkImmediate' put: true;
		at: 'views' put: viewsDictionaries;
		yourself
]

{ #category : 'gt - extensions' }
GtViewedObject >> gtDeclarativeViewsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Declarative Views';
		items: [ 
			declarativeViewsBySelector 
				ifNil: [ #() ]
				ifNotNil: [ declarativeViewsBySelector associations ] ];
		column: 'Selector' text: [ :assoc | assoc key ];
		column: 'Title' text: [ :assoc | assoc value title ];
		column: 'Data Transport' text: [ :assoc | 
			assoc value dataTransport ];
		send: [ :assoc | assoc value ]
]

{ #category : 'initialization' }
GtViewedObject >> initializeWith: anObject [

	object := anObject
]

{ #category : 'accessing' }
GtViewedObject >> object [

	^ object
]
