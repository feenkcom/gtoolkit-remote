Class {
	#name : #GtRemotePhlowDeclarativeViewsLocalViewedObjectExamples,
	#superclass : #GtRemotePhlowDeclarativeViewsDirectViewedObjectExamples,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #accessing }
GtRemotePhlowDeclarativeViewsLocalViewedObjectExamples >> remoteViewedObject [
	^ GtRemotePhlowViewedObject object: self remoteObject.
]
