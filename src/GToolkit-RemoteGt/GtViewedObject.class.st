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
	#name : #GtViewedObject,
	#superclass : #Object,
	#instVars : [
		'object',
		'viewCache'
	],
	#category : 'GToolkit-RemoteGt-Server'
}

{ #category : #'instance creation' }
GtViewedObject class >> object: anObject [

	^ self new initializeWith: anObject
]

{ #category : #private }
GtViewedObject >> declarativeViewWithSelector: viewSelector [
	"Answer the objects view with the given selector name"

	^ (viewCache
		at: viewSelector
		ifAbsentPut: [ GtViewCache viewedObject: self selector: viewSelector ]) 
			declarativeView
]

{ #category : #accessing }
GtViewedObject >> getGtViewMethodNames [
	"Answer the set of declarative view selectors provided by the object"

	^ object gtDeclarativeViewSelectors copyWithout: #gtRawFor:
]

{ #category : #accessing }
GtViewedObject >> getViewDeclaration: viewSelector [
	"Answer the declarative view dictionary for the supplied selector"

	^ (self declarativeViewWithSelector: viewSelector) asDictionaryForExport 
		at: #'__pharolinkImmediate' put: true;
		yourself.
]

{ #category : #accessing }
GtViewedObject >> gtCachedViewsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Cached Views';
		items: [ 
			viewCache 
				ifNil: [ #() ]
				ifNotNil: [ viewCache associations ] ];
		column: 'Selector' text: [ :assoc | assoc key ];
		column: 'Title' text: [ :assoc | assoc value declarativeView title ];
		column: 'Data Transport' text: [ :assoc | 
			assoc value declarativeView dataTransport ];
		send: [ :assoc | assoc value ]
]

{ #category : #'gt inspector' }
GtViewedObject >> gtSentItemFor: viewSelector at: selection [ 
	"Answer the value to be sent from the view"

	^ (self declarativeViewWithSelector: viewSelector) sentItemAt: selection
]

{ #category : #initialization }
GtViewedObject >> initialize [

	super initialize.
	viewCache := Dictionary new.
]

{ #category : #initialization }
GtViewedObject >> initializeWith: anObject [

	object := anObject
]

{ #category : #accessing }
GtViewedObject >> object [

	^ object
]

{ #category : #accessing }
GtViewedObject >> rawViewData [
	"Answer the data for the raw view"
	| variableNodes icon name value |

	variableNodes := OrderedCollection new: object class allSlots size.
	variableNodes add: (GTInspectorSelfNode hostObject: object).
	object gtInspectorVariableNodesIn: variableNodes.

	^ Array streamContents: [ :stream |
		variableNodes do: [ :node |
			icon := ([ node rawValue class systemIconName ]
					on: Error 
					do: [ :error | #smallWarningIcon ]).
			name := node label.
			value := node rawValue.
			stream nextPut: { icon. name. value. } ] ].

]

{ #category : #accessing }
GtViewedObject >> retrieveItemsCount: anItemsCount fromIndex: anIndex forViewSelector: aViewSelector [
	| declarativeViewCache |
	declarativeViewCache := viewCache at: aViewSelector.
	^ declarativeViewCache retrieveItems: anItemsCount fromIndex: anIndex
]

{ #category : #accessing }
GtViewedObject >> retrieveTotalItemsCountForViewSelector: aViewSelector [
	| declarativeViewCache |
	declarativeViewCache := viewCache at: aViewSelector.
	^ declarativeViewCache retrieveTotalItemsCount
]

{ #category : #accessing }
GtViewedObject >> retriveFormattedItemsForViewSelector: aViewSelector [
	| declarativeViewCache |
	declarativeViewCache := viewCache at: aViewSelector.
	^ declarativeViewCache retriveFormattedItems
]

{ #category : #accessing }
GtViewedObject >> retriveSentItemForViewSelector: aViewSelector atIndex: aSelectionIndex [
	| declarativeViewCache |
	declarativeViewCache := viewCache at: aViewSelector.
	^ declarativeViewCache retriveSentItemAtIndex: aSelectionIndex 
]

{ #category : #private }
GtViewedObject >> viewWithSelector: viewSelector [
	"Answer the objects view with the given selector name"

	^ (viewCache
		at: viewSelector
		ifAbsentPut: [ GtViewCache viewedObject: self selector: viewSelector ]) 
			view
]
