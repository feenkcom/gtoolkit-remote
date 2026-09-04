Class {
	#name : #GtRemotePhlowDeclarativeActionsDirectViewedObjectExamples,
	#superclass : #GtRemotePhlowDeclarativeActionsExamples,
	#category : #'GToolkit-RemoteGt-Examples'
}

{ #category : #testing }
GtRemotePhlowDeclarativeActionsDirectViewedObjectExamples class >> isAbstract [
	^ self name = #GtRemotePhlowDeclarativeActionsDirectViewedObjectExamples
]

{ #category : #accessing }
GtRemotePhlowDeclarativeActionsDirectViewedObjectExamples >> getRemoteObject [

	^ GtRemotePhlowDeclarativeTestInspectable new
]
