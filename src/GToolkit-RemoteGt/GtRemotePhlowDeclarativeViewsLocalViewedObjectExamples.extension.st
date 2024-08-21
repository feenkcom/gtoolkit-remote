Extension { #name : #GtRemotePhlowDeclarativeViewsLocalViewedObjectExamples }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowDeclarativeViewsLocalViewedObjectExamples >> retrieveRemotePhlowSpecificationsProvider [
	"Answer the GtRemotePhlowViewedObject proxy for the remote object"

	^ GtLocalPhlowViewedObject remoteViewedObject: self remoteViewedObject
]
