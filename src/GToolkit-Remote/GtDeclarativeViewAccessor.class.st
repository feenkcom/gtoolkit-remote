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
		'priority',
		'id',
		'declarativeView',
		'view'
	],
	#category : #'GToolkit-Remote-Inspection'
}

{ #category : #converting }
GtDeclarativeViewAccessor >> asDictionaryForExport [

	^self declarativeView asDictionaryForExport 
]

{ #category : #accessing }
GtDeclarativeViewAccessor >> declarativeView [
	^ self subclassResponsibility 
]

{ #category : #accessing }
GtDeclarativeViewAccessor >> id [
	^ id
]

{ #category : #accessing }
GtDeclarativeViewAccessor >> id: anObject [
	id := anObject
]

{ #category : #accessing }
GtDeclarativeViewAccessor >> priority [
	^ self view priority
]

{ #category : #accessing }
GtDeclarativeViewAccessor >> title [
	^ self view title
]

{ #category : #accessing }
GtDeclarativeViewAccessor >> view [
	^ self subclassResponsibility 
]

{ #category : #'building - graph' }
GtDeclarativeViewAccessor >> viewFor: aView [

	^view ifNil: [ view := self declarativeView viewFor: aView ]
]
