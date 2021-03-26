Class {
	#name : #GtDeclarativeViewAccessor,
	#superclass : #Object,
	#instVars : [
		'declarativeView'
	],
	#category : #'GToolkit-RemotePharo-Server'
}

{ #category : #accessing }
GtDeclarativeViewAccessor >> declarativeView [
	^ declarativeView
]

{ #category : #accessing }
GtDeclarativeViewAccessor >> declarativeView: anObject [
	declarativeView := anObject
]

{ #category : #decorating }
GtDeclarativeViewAccessor >> itemsBuilder [
	"In Pharo remote images, the items are always provided directly to the view"
	
	^ declarativeView items
]
