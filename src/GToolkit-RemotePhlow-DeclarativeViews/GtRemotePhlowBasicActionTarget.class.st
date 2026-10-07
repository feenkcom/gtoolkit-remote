Class {
	#name : #GtRemotePhlowBasicActionTarget,
	#superclass : #GtRemotePhlowActionTarget,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #testing }
GtRemotePhlowBasicActionTarget class >> isAbstract [
	^ self name = #GtRemotePhlowBasicActionTarget
]
