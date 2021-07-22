Class {
	#name : #GtRemotePhlowViewCache,
	#superclass : #Object,
	#instVars : [
		'viewedObject',
		'viewSelector',
		'view',
		'declarativeView'
	],
	#category : #'GToolkit-RemotePhlow'
}

{ #category : #'instance creation' }
GtRemotePhlowViewCache class >> viewedObject: aGtViewedObject selector: viewSelector [

	^ self new 
		viewedObject: aGtViewedObject;
		viewSelector: viewSelector;
		yourself
]

{ #category : #accessing }
GtRemotePhlowViewCache >> declarativeView [

	^ declarativeView ifNil: 
		[ declarativeView := (self object perform: viewSelector with: GtRemotePhlowDeclarativeProtoView new) ]
]

{ #category : #accessing }
GtRemotePhlowViewCache >> object [

	^ self viewedObject object
]

{ #category : #accessing }
GtRemotePhlowViewCache >> viewSelector [
	^ viewSelector
]

{ #category : #accessing }
GtRemotePhlowViewCache >> viewSelector: anObject [
	viewSelector := anObject
]

{ #category : #accessing }
GtRemotePhlowViewCache >> viewedObject [
	^ viewedObject
]

{ #category : #accessing }
GtRemotePhlowViewCache >> viewedObject: anObject [
	viewedObject := anObject
]
