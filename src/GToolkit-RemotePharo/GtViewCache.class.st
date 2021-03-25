Class {
	#name : #GtViewCache,
	#superclass : #Object,
	#instVars : [
		'viewedObject',
		'viewSelector',
		'view',
		'declarativeView'
	],
	#category : #'GToolkit-RemotePharo-Server'
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
		[ declarativeView := (self object perform: viewSelector with: GtDeclarativeProtoView new) ]
]

{ #category : #accessing }
GtViewCache >> object [

	^ self viewedObject object
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
