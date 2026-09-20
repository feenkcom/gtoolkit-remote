Class {
	#name : #GtRemotePhlowSingleNodeIdentifier,
	#superclass : #GtRemotePhlowNodeIdentifier,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #enumerating }
GtRemotePhlowSingleNodeIdentifier >> nodeIdentifiersDo: aBlock [
	aBlock cull: self
]
