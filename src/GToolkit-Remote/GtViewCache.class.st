Class {
	#name : #GtViewCache,
	#superclass : #Object,
	#instVars : [
		'viewedObject',
		'viewSelector',
		'view',
		'declarativeView'
	],
	#category : #'GToolkit-Remote-Server'
}

{ #category : #'instance creation' }
GtViewCache class >> viewedObject: aGtViewedObject selector: viewSelector [

	^ self new 
		viewedObject: aGtViewedObject;
		viewSelector: viewSelector;
		yourself
]

{ #category : #accessing }
GtViewCache >> declarativeView [

	^ declarativeView ifNil: 
		[ declarativeView := self view asGtDeclarativeView
			accessor: self view;
			yourself ]
]

{ #category : #accessing }
GtViewCache >> object [

	^ self viewedObject object
]

{ #category : #accessing }
GtViewCache >> view [

	^ view ifNil: [ view := self object perform: viewSelector with: GtPhlowEmptyView new ]
]

{ #category : #accessing }
GtViewCache >> viewSelector [
	^ viewSelector
]

{ #category : #accessing }
GtViewCache >> viewSelector: anObject [
	viewSelector := anObject
]

{ #category : #accessing }
GtViewCache >> viewedObject [
	^ viewedObject
]

{ #category : #accessing }
GtViewCache >> viewedObject: anObject [
	viewedObject := anObject
]
