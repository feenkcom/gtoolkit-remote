Class {
	#name : #GtRemotePhlowDeclarativeTable,
	#superclass : #GtRemotePhlowView,
	#instVars : [
		'items'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #accessing }
GtRemotePhlowDeclarativeTable >> items [
	^ items
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTable >> items: anObject [
	items := anObject
]
