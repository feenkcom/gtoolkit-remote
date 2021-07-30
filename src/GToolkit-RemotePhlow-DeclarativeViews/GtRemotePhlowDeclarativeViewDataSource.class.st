Class {
	#name : 'GtRemotePhlowDeclarativeViewDataSource',
	#superclass : 'Object',
	#instVars : [
		'phlowView'
	],
	#category : 'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : 'as yet unclassified' }
GtRemotePhlowDeclarativeViewDataSource class >> forPhlowView: aView [
	^ self new
		phlowView: aView
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeViewDataSource >> phlowView [
	^ phlowView
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeViewDataSource >> phlowView: anObject [
	phlowView := anObject
]
