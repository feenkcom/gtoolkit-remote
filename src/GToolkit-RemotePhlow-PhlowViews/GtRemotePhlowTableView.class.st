Class {
	#name : #GtRemotePhlowTableView,
	#superclass : #GtRemotePhlowView,
	#instVars : [
		'items'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #accessing }
GtRemotePhlowTableView >> items [
	^ items
]

{ #category : #accessing }
GtRemotePhlowTableView >> items: anObject [
	items := anObject
]
