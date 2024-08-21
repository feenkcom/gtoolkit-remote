Extension { #name : #GtRemotePhlowDeclarativeActionsLocalViewedObjectExamples }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowDeclarativeActionsLocalViewedObjectExamples >> retrieveRemotePhlowSpecificationsProvider [
	"Answer the GtRemotePhlowViewedObject proxy for the remote object"

	^ GtLocalPhlowViewedObject remoteViewedObject: self remoteViewedObject
]
