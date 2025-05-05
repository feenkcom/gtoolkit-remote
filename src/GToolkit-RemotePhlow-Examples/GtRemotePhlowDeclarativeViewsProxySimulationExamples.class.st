Class {
	#name : #GtRemotePhlowDeclarativeViewsProxySimulationExamples,
	#superclass : #GtRemotePhlowDeclarativeViewsExamples,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #accessing }
GtRemotePhlowDeclarativeViewsProxySimulationExamples >> remoteObject [
	<gtExample>
	<after: #stopServer>
	<return: #GtRemoteInspectionSimulation>
	| remoteObject |
	remoteObject := self getRemoteObject.

	^ remoteObject
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewsProxySimulationExamples >> retrieveRemotePhlowSpecificationsProvider [

	self remoteObject 
		remoteInspectorProxyDo: [ :aProxy | ^ aProxy ].
	^ nil
]
