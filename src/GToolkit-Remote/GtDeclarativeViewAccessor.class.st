"
GtDeclarativeViewAccessor subclasses are responsible for retrieving the view declaration for a given object.  Access to the declaration may be via local object access, remote object access (Seamless), a web server or some other means.

All GtDeclarativeViewAccessor know their title and priority.


Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #GtDeclarativeViewAccessor,
	#superclass : #Object,
	#instVars : [
		'title',
		'priority'
	],
	#category : #'GToolkit-Remote-Declarative Views'
}

{ #category : #converting }
GtDeclarativeViewAccessor >> asJSONForExport [ 
	"Answer the receiver's declaration string"

	^self subclassResponsibility 
]

{ #category : #accessing }
GtDeclarativeViewAccessor >> priority [
	^ priority
]

{ #category : #accessing }
GtDeclarativeViewAccessor >> priority: anObject [
	priority := anObject
]

{ #category : #accessing }
GtDeclarativeViewAccessor >> title [
	^ title
]

{ #category : #accessing }
GtDeclarativeViewAccessor >> title: anObject [
	title := anObject
]

{ #category : #accessing }
GtDeclarativeViewAccessor >> viewItemAt: anInteger [
	"Answer the receiver's view item at anInteger.
	This is used by Declarative views to access remote items"

	^self subclassResponsibility 
]
