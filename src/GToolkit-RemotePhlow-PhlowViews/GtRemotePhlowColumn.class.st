Class {
	#name : 'GtRemotePhlowColumn',
	#superclass : 'Object',
	#instVars : [
		'index',
		'title',
		'width',
		'itemComputation'
	],
	#category : 'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : 'accessing' }
GtRemotePhlowColumn >> cellWidth [
	^ width
]

{ #category : 'accessing' }
GtRemotePhlowColumn >> index [
	^ index
]

{ #category : 'accessing' }
GtRemotePhlowColumn >> index: aColumnIndex [
	index := aColumnIndex
]

{ #category : 'accessing' }
GtRemotePhlowColumn >> item: aBlockOrSymbol [
	itemComputation := aBlockOrSymbol
]

{ #category : 'accessing' }
GtRemotePhlowColumn >> itemComputation [
	^ itemComputation
]

{ #category : 'private - accessing' }
GtRemotePhlowColumn >> rowStencil [
	^ nil
]

{ #category : 'accessing' }
GtRemotePhlowColumn >> title [
	^ title
]

{ #category : 'accessing' }
GtRemotePhlowColumn >> title: anObject [
	title := anObject
]

{ #category : 'accessing' }
GtRemotePhlowColumn >> width: aCellWidth [
	width := aCellWidth
]
