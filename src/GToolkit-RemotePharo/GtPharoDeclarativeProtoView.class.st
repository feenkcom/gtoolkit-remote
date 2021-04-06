Class {
	#name : #GtPharoDeclarativeProtoView,
	#superclass : #Object,
	#category : #'GToolkit-RemotePharo-Server'
}

{ #category : #decorating }
GtPharoDeclarativeProtoView >> columnedList [

	^ self declarativeViewOfType: GtPharoDeclarativeColumnedList
]

{ #category : #private }
GtPharoDeclarativeProtoView >> declarativeViewOfType: aGtDeclarativeViewClass [
	"Answer a new declarative view instance"

	^ aGtDeclarativeViewClass new.

]

{ #category : #decorating }
GtPharoDeclarativeProtoView >> list [

	^ self declarativeViewOfType: GtPharoDeclarativeList
]

{ #category : #decorating }
GtPharoDeclarativeProtoView >> table [

	^ self declarativeViewOfType: GtPharoDeclarativeTable
]

{ #category : #decorating }
GtPharoDeclarativeProtoView >> textEditor [

	^ self declarativeViewOfType: GtPharoDeclarativeTextEditor
]
