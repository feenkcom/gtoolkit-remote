Class {
	#name : #GtRemotePhlowProtoView,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #decorating }
GtRemotePhlowProtoView >> columnedList [

	^ self declarativeViewOfType: GtRemotePhlowColumnedListView
]

{ #category : #decorating }
GtRemotePhlowProtoView >> columnedTree [

	^ self declarativeViewOfType: GtRemotePhlowColumnedTreeView
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

	^ self declarativeViewOfType: GtRemotePhlowListView
]

{ #category : #decorating }
GtRemotePhlowProtoView >> table [

	^ self declarativeViewOfType: GtRemotePhlowTableView
]

{ #category : #decorating }
GtRemotePhlowProtoView >> textEditor [

	^ self declarativeViewOfType: GtRemotePhlowTextEditorView
]

{ #category : #decorating }
GtRemotePhlowProtoView >> tree [

	^ self declarativeViewOfType: GtRemotePhlowTreeView
]
