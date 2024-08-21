Class {
	#name : #GtRemotePhlowDeclarativeActionsLocalViewedObjectExamples,
	#superclass : #GtRemotePhlowDeclarativeActionsDirectViewedObjectExamples,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #accessing }
GtRemotePhlowDeclarativeActionsLocalViewedObjectExamples >> remoteViewedObject [
	^ GtRemotePhlowViewedObject object: self remoteObject.
]
