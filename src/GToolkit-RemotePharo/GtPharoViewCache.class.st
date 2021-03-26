Class {
	#name : #GtPharoViewCache,
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
GtPharoViewCache class >> viewedObject: aGtViewedObject selector: viewSelector [

	^ self new 
		viewedObject: aGtViewedObject;
		viewSelector: viewSelector;
		yourself
]

{ #category : #accessing }
GtPharoViewCache >> declarativeView [

	^ declarativeView ifNil: 
		[ declarativeView := (self object perform: viewSelector with: GtPharoDeclarativeProtoView new) ]
]

{ #category : #accessing }
GtPharoViewCache >> object [

	^ self viewedObject object
]

{ #category : #accessing }
GtPharoViewCache >> viewSelector [
	^ viewSelector
]

{ #category : #accessing }
GtPharoViewCache >> viewSelector: anObject [
	viewSelector := anObject
]

{ #category : #accessing }
GtPharoViewCache >> viewedObject [
	^ viewedObject
]

{ #category : #accessing }
GtPharoViewCache >> viewedObject: anObject [
	viewedObject := anObject
]
