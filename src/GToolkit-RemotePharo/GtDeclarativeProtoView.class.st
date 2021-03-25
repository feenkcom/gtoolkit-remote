Class {
	#name : #GtDeclarativeProtoView,
	#superclass : #Object,
	#category : #'GToolkit-RemotePharo-Server'
}

{ #category : #decorating }
GtDeclarativeProtoView >> columnedList [

	^ self declarativeViewOfType: GtDeclarativeColumnedList
]

{ #category : #private }
GtDeclarativeProtoView >> declarativeViewOfType: aGtDeclarativeViewClass [
	"Answer a new declarative view initiated with the accessor"
	| newView accessor |

	newView := aGtDeclarativeViewClass new.
	accessor := GtDeclarativeViewAccessor new.
	newView accessor: accessor.
	accessor declarativeView: newView.
	^ newView
]

{ #category : #decorating }
GtDeclarativeProtoView >> list [

	^ self declarativeViewOfType: GtDeclarativeList
]

{ #category : #decorating }
GtDeclarativeProtoView >> table [

	^ self declarativeViewOfType: GtDeclarativeTable
]

{ #category : #decorating }
GtDeclarativeProtoView >> textEditor [

	^ self declarativeViewOfType: GtDeclarativeTextEditor
]
