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
	#name : 'GtRemotePhlowViewedObject',
	#superclass : 'Object',
	#instVars : [
		'object',
		'viewCache'
	],
	#category : 'GToolkit-RemotePhlow'
}

{ #category : 'instance creation' }
GtRemotePhlowViewedObject class >> object: anObject [

	^ self new initializeWith: anObject
]

{ #category : 'private' }
GtRemotePhlowViewedObject >> declarativeViewWithSelector: viewSelector [
	"Answer the objects view with the given selector name"

	^ (viewCache
		at: viewSelector
		ifAbsentPut: [ GtRemotePhlowViewCache viewedObject: self selector: viewSelector ]) 
			declarativeView
]

{ #category : 'accessing' }
GtRemotePhlowViewedObject >> getGtViewMethodNames [
	"Answer the set of declarative view selectors provided by the object"

	^ object gtPharoDeclarativeViewSelectors
]

{ #category : 'accessing' }
GtRemotePhlowViewedObject >> getViewDeclaration: viewSelector [
	"Answer the declarative view dictionary for the supplied selector"

	^ (self declarativeViewWithSelector: viewSelector) asDictionaryForExport 
		at: #'__pharolinkImmediate' put: true;
		yourself.
]

{ #category : 'gt inspector' }
GtRemotePhlowViewedObject >> gtSentItemFor: viewSelector at: selection [ 
	"Answer the value to be sent from the view"

	^ (self declarativeViewWithSelector: viewSelector) sentItemAt: selection
	
]

{ #category : 'initialization' }
GtRemotePhlowViewedObject >> initialize [

	super initialize.
	viewCache := Dictionary new.
]

{ #category : 'initialization' }
GtRemotePhlowViewedObject >> initializeWith: anObject [

	object := anObject
]

{ #category : 'accessing' }
GtRemotePhlowViewedObject >> object [

	^ object
]

{ #category : 'accessing' }
GtRemotePhlowViewedObject >> rawViewData [
	"Answer the data for the raw view"
	| variableNodes icon name value |

	variableNodes := OrderedCollection new: object class allSlots size.
	"GemStone doesn't have GTInspectorSelfNode.  The call to #addRawSelfNodeTo: will allow the platform specific code to be added.
	variableNodes add: (GTInspectorSelfNode hostObject: object)."
	self addRawSelfNodeTo: variableNodes.
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
GtRemotePhlowViewedObject >> retrieveItemsCount: anItemsCount fromIndex: anIndex forViewSelector: aViewSelector [
	| declarativeViewCache |
	declarativeViewCache := viewCache at: aViewSelector.
	^ declarativeViewCache retrieveItems: anItemsCount fromIndex: anIndex
]

{ #category : #accessing }
GtRemotePhlowViewedObject >> retrieveTotalItemsCountForViewSelector: aViewSelector [
	| declarativeViewCache |
	declarativeViewCache := viewCache at: aViewSelector.
	^ declarativeViewCache retrieveTotalItemsCount
]

{ #category : #accessing }
GtRemotePhlowViewedObject >> retriveFormattedItemsForViewSelector: aViewSelector [
	| declarativeViewCache |
	declarativeViewCache := viewCache at: aViewSelector.
	^ declarativeViewCache retriveFormattedItems
]

{ #category : #accessing }
GtRemotePhlowViewedObject >> retriveSentItemForViewSelector: aViewSelector atIndex: aSelectionIndex [
	| declarativeViewCache |
	declarativeViewCache := viewCache at: aViewSelector.
	^ declarativeViewCache retriveSentItemAtIndex: aSelectionIndex 
]

{ #category : #private }
GtRemotePhlowViewedObject >> viewWithSelector: viewSelector [
	"Answer the objects view with the given selector name"

	^ (viewCache
		at: viewSelector
		ifAbsentPut: [ GtRemotePhlowViewCache viewedObject: self selector: viewSelector ]) 
			view
]
