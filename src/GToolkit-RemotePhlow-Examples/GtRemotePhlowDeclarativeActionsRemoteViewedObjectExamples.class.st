Class {
	#name : #GtRemotePhlowDeclarativeActionsRemoteViewedObjectExamples,
	#superclass : #GtRemotePhlowDeclarativeActionsDirectViewedObjectExamples,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #accessing }
GtRemotePhlowDeclarativeActionsRemoteViewedObjectExamples >> retrieveRemotePhlowSpecificationsProvider [
	"Answer the GtRemotePhlowViewedObject proxy for the remote object"

	^ GtRemotePhlowViewedObject object: self remoteObject.
]
