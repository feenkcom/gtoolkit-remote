Class {
	#name : #GtRemotePhlowDeclarativeViewsLocalViewedObjectExamples,
	#superclass : #GtRemotePhlowDeclarativeViewsDirectViewedObjectExamples,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #accessing }
GtRemotePhlowDeclarativeViewsLocalViewedObjectExamples >> remoteViewedObject [
	^ GtRemotePhlowViewedObject object: self remoteObject.
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewsLocalViewedObjectExamples >> retrieveRemotePhlowSpecificationsProvider [
	"Answer the GtRemotePhlowViewedObject proxy for the remote object"

	^ GtLocalPhlowViewedObject remoteViewedObject: self remoteViewedObject
]
