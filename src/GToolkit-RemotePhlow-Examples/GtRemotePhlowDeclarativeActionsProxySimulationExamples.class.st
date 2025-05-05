Class {
	#name : #GtRemotePhlowDeclarativeActionsProxySimulationExamples,
	#superclass : #GtRemotePhlowDeclarativeActionsExamples,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #accessing }
GtRemotePhlowDeclarativeActionsProxySimulationExamples >> remoteObject [
	<gtExample>
	<after: #stopServer>
	<return: #GtRemoteInspectionSimulation>
	| remoteObject |
	remoteObject := self getRemoteObject.

	^ remoteObject
]

{ #category : #accessing }
GtRemotePhlowDeclarativeActionsProxySimulationExamples >> retrieveRemotePhlowSpecificationsProvider [

	self remoteObject 
		remoteInspectorProxyDo: [ :aProxy | ^ aProxy ].
	^ nil
]
