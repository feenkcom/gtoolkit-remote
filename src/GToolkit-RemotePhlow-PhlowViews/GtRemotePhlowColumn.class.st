Class {
	#name : 'GtRemotePhlowColumn',
	#superclass : 'Object',
	#instVars : [
		'index',
		'title',
		'width',
		'itemComputation',
		'iconNameComputation'
	],
	#category : 'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : 'accessing' }
GtRemotePhlowColumn >> cellWidth [
	^ width
]

{ #category : 'accessing' }
GtRemotePhlowColumn >> columnDataType [
	^ self isWithIcon
		ifTrue: [ #icon ]
		ifFalse: [ #text ]
]

{ #category : 'accessing' }
GtRemotePhlowColumn >> iconName: aBlock [
	iconNameComputation := aBlock
]

{ #category : 'accessing' }
GtRemotePhlowColumn >> iconNameComputation [
	^ iconNameComputation
]

{ #category : 'accessing' }
GtRemotePhlowColumn >> index [
	^ index
]

{ #category : 'accessing' }
GtRemotePhlowColumn >> index: aColumnIndex [
	index := aColumnIndex
]

{ #category : 'testing' }
GtRemotePhlowColumn >> isWithIcon [
	^ iconNameComputation notNil
]

{ #category : 'accessing' }
GtRemotePhlowColumn >> item: aBlock [
	itemComputation := aBlock
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
