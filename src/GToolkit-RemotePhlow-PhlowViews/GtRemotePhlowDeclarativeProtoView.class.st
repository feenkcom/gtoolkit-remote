Class {
	#name : #GtRemotePhlowDeclarativeProtoView,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #decorating }
GtRemotePhlowDeclarativeProtoView >> columnedList [

	^ self declarativeViewOfType: GtRemotePhlowDeclarativeColumnedList
]

{ #category : #decorating }
GtRemotePhlowDeclarativeProtoView >> columnedTree [

	^ self declarativeViewOfType: GtRemotePhlowDeclarativeColumnedTree
]

{ #category : #private }
GtRemotePhlowDeclarativeProtoView >> declarativeViewOfType: aGtDeclarativeViewClass [
	"Answer a new declarative view instance"

	^ aGtDeclarativeViewClass new.

]

{ #category : #decorating }
GtRemotePhlowDeclarativeProtoView >> empty [

	^ self declarativeViewOfType: GtRemotePhlowDeclarativeEmptyView
]

{ #category : #decorating }
GtRemotePhlowDeclarativeProtoView >> forward [

	^ self declarativeViewOfType: GtRemotePhlowDeclarativeForwarderView
]

{ #category : #decorating }
GtRemotePhlowDeclarativeProtoView >> list [

	^ self declarativeViewOfType: GtRemotePhlowDeclarativeList
]

{ #category : #decorating }
GtRemotePhlowDeclarativeProtoView >> table [

	^ self declarativeViewOfType: GtRemotePhlowDeclarativeTable
]

{ #category : #decorating }
GtRemotePhlowDeclarativeProtoView >> textEditor [

	^ self declarativeViewOfType: GtRemotePhlowDeclarativeTextEditor
]

{ #category : #decorating }
GtRemotePhlowDeclarativeProtoView >> tree [

	^ self declarativeViewOfType: GtRemotePhlowDeclarativeTree
]
