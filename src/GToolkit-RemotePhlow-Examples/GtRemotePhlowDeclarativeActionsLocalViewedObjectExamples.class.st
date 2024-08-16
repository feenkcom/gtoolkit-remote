Class {
	#name : #GtRemotePhlowDeclarativeActionsLocalViewedObjectExamples,
	#superclass : #GtRemotePhlowDeclarativeActionsDirectViewedObjectExamples,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #accessing }
GtRemotePhlowDeclarativeActionsLocalViewedObjectExamples >> remoteViewedObject [
	^ GtRemotePhlowViewedObject object: self remoteObject.
]

{ #category : #accessing }
GtRemotePhlowDeclarativeActionsLocalViewedObjectExamples >> retrieveRemotePhlowSpecificationsProvider [
	"Answer the GtRemotePhlowViewedObject proxy for the remote object"

	^ GtLocalPhlowViewedObject remoteViewedObject: self remoteViewedObject
]
