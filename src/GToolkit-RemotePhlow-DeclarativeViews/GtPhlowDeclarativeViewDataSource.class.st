Class {
	#name : 'GtPhlowDeclarativeViewDataSource',
	#superclass : 'Object',
	#instVars : [
		'phlowView'
	],
	#category : 'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : 'as yet unclassified' }
GtPhlowDeclarativeViewDataSource class >> forPhlowView: aView [
	^ self new
		phlowView: aView
]

{ #category : 'accessing' }
GtPhlowDeclarativeViewDataSource >> phlowView [
	^ phlowView
]

{ #category : 'accessing' }
GtPhlowDeclarativeViewDataSource >> phlowView: anObject [
	phlowView := anObject
]
