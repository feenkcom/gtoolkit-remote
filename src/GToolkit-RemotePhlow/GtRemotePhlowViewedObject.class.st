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
		'declarativeViewsBySelector'
	],
	#category : 'GToolkit-RemotePhlow'
}

{ #category : 'instance creation' }
GtRemotePhlowViewedObject class >> object: anObject [

	^ self new initializeWith: anObject
]

{ #category : 'accessing' }
GtRemotePhlowViewedObject >> declarativeViewsBySelector [
	^ declarativeViewsBySelector ifNil: [ 
		declarativeViewsBySelector := Dictionary new ]
]

{ #category : 'api - accessing' }
GtRemotePhlowViewedObject >> getDeclarativeViewFor: viewSelector [
	^ self declarativeViewsBySelector 
		at: viewSelector 
		ifAbsentPut: [
			(self object 
				perform: viewSelector 
				with: GtRemotePhlowDeclarativeProtoView new) asGtDeclarativeView ]
]

{ #category : 'api - accessing' }
GtRemotePhlowViewedObject >> getDeclarativeViewMethodNames [
	"Answer the set of declarative view selectors provided by the object"

	^ object gtPharoDeclarativeViewSelectors
]

{ #category : 'api - accessing' }
GtRemotePhlowViewedObject >> getViewDeclaration: viewSelector [
	^ ((self getDeclarativeViewFor: viewSelector) 
		ifNotNil: [ :view |
			view asDictionaryForExport
				at: #'__pharolinkImmediate' put: true;
				yourself. ])
		
]

{ #category : 'initialization' }
GtRemotePhlowViewedObject >> initializeWith: anObject [

	object := anObject
]

{ #category : 'accessing' }
GtRemotePhlowViewedObject >> object [

	^ object
]
