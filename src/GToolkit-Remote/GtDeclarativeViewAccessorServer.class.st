Class {
	#name : #GtDeclarativeViewAccessorServer,
	#superclass : #GtDeclarativeViewAccessor,
	#instVars : [
		'object'
	],
	#category : #'GToolkit-Remote-Inspection'
}

{ #category : #accessing }
GtDeclarativeViewAccessorServer >> declarativeView [
	^ declarativeView ifNil: [ declarativeView := view asGtDeclarativeView ]
]

{ #category : #accessing }
GtDeclarativeViewAccessorServer >> object [
	^ object
]

{ #category : #accessing }
GtDeclarativeViewAccessorServer >> object: anObject [
	object := anObject
]

{ #category : #accessing }
GtDeclarativeViewAccessorServer >> selector [
	"Answer the selector name that defines the receiver's view"

	^view definingMethod selector
]

{ #category : #accessing }
GtDeclarativeViewAccessorServer >> view [

	^view
]

{ #category : #accessing }
GtDeclarativeViewAccessorServer >> view: aView [

	view := aView
]
