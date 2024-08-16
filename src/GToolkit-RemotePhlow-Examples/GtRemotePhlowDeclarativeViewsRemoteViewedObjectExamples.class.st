Class {
	#name : #GtRemotePhlowDeclarativeViewsRemoteViewedObjectExamples,
	#superclass : #GtRemotePhlowDeclarativeViewsDirectViewedObjectExamples,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #accessing }
GtRemotePhlowDeclarativeViewsRemoteViewedObjectExamples >> retrieveRemotePhlowSpecificationsProvider [
	"Answer the GtRemotePhlowViewedObject proxy for the remote object"

	^ GtRemotePhlowViewedObject object: self remoteObject.
]
