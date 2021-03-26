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
	#name : #GtPharoViewedObject,
	#superclass : #Object,
	#instVars : [
		'object',
		'viewCache'
	],
	#category : #'GToolkit-RemotePharo-Server'
}

{ #category : #'instance creation' }
GtPharoViewedObject class >> object: anObject [

	^ self new initializeWith: anObject
]

{ #category : #private }
GtPharoViewedObject >> declarativeViewWithSelector: viewSelector [
	"Answer the objects view with the given selector name"

	^ (viewCache
		at: viewSelector
		ifAbsentPut: [ GtPharoViewCache viewedObject: self selector: viewSelector ]) 
			declarativeView
]

{ #category : #accessing }
GtPharoViewedObject >> getGtViewMethodNames [
	"Answer the set of declarative view selectors provided by the object"

	^ object gtDeclarativeViewSelectors copyWithout: #gtRawFor:
]

{ #category : #accessing }
GtPharoViewedObject >> getViewDeclaration: viewSelector [
	"Answer the declarative view dictionary for the supplied selector"

	^ (self declarativeViewWithSelector: viewSelector) asDictionaryForExport 
		at: #'__pharolinkImmediate' put: true;
		yourself.
]

{ #category : #'gt inspector' }
GtPharoViewedObject >> gtSentItemFor: viewSelector at: selection [ 
	"Answer the value to be sent from the view"

	^ (self declarativeViewWithSelector: viewSelector) sentItemAt: selection
	
]

{ #category : #initialization }
GtPharoViewedObject >> initialize [

	super initialize.
	viewCache := Dictionary new.
]

{ #category : #initialization }
GtPharoViewedObject >> initializeWith: anObject [

	object := anObject
]

{ #category : #accessing }
GtPharoViewedObject >> object [

	^ object
]

{ #category : #accessing }
GtPharoViewedObject >> rawViewData [
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

{ #category : #private }
GtPharoViewedObject >> viewWithSelector: viewSelector [
	"Answer the objects view with the given selector name"

	^ (viewCache
		at: viewSelector
		ifAbsentPut: [ GtPharoViewCache viewedObject: self selector: viewSelector ]) 
			view
]
