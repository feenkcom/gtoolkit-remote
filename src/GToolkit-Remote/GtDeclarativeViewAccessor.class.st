"
GtDeclarativeViewAccessors provides management and caching of views between the client and server.  The accessor works with ${class:name=GtRemoteInspectorClient}, ${class:name=GtRemoteInspectorServer} and ${class:name=GtRemoteInspectorProxy} to hide the underlying transport from the views.

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

{ #category : #'building - graph' }
GtDeclarativeViewAccessor >> viewFor: aView [

	^view ifNil: [ view := self declarativeView viewFor: aView ]
]
