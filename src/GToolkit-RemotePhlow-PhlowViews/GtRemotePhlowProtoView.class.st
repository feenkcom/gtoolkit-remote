Class {
	#name : #GtRemotePhlowProtoView,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #decorating }
GtRemotePhlowProtoView >> columnedList [

	^ self declarativeViewOfType: GtRemotePhlowColumnedList
]

{ #category : #decorating }
GtRemotePhlowProtoView >> columnedTree [

	^ self declarativeViewOfType: GtRemotePhlowDeclarativeColumnedTree
]

{ #category : #private }
GtRemotePhlowProtoView >> declarativeViewOfType: aGtDeclarativeViewClass [
	"Answer a new declarative view instance"

	^ aGtDeclarativeViewClass new.

]

{ #category : #decorating }
GtRemotePhlowProtoView >> empty [

	^ self declarativeViewOfType: GtRemotePhlowEmptyView
]

{ #category : #decorating }
GtRemotePhlowProtoView >> forward [

	^ self declarativeViewOfType: GtRemotePhlowForwarderView
]

{ #category : #decorating }
GtRemotePhlowProtoView >> list [

	^ self declarativeViewOfType: GtRemotePhlowList
]

{ #category : #decorating }
GtRemotePhlowProtoView >> table [

	^ self declarativeViewOfType: GtRemotePhlowDeclarativeTable
]

{ #category : #decorating }
GtRemotePhlowProtoView >> textEditor [

	^ self declarativeViewOfType: GtRemotePhlowDeclarativeTextEditor
]

{ #category : #decorating }
GtRemotePhlowProtoView >> tree [

	^ self declarativeViewOfType: GtRemotePhlowDeclarativeTree
]
