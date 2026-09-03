Class {
	#name : #GtRemotePhlowDeclarativeViewsDirectViewedObjectExamples,
	#superclass : #GtRemotePhlowDeclarativeViewsExamples,
	#category : #'GToolkit-RemoteGt-Examples'
}

{ #category : #testing }
GtRemotePhlowDeclarativeViewsDirectViewedObjectExamples class >> isAbstract [
	^ self name = #GtRemotePhlowDeclarativeViewsDirectViewedObjectExamples
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewsDirectViewedObjectExamples >> getRemoteObject [

	^ GtRemotePhlowDeclarativeTestInspectable new
]
