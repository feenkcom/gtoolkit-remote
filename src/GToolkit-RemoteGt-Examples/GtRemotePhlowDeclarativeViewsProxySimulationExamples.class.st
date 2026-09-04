Class {
	#name : #GtRemotePhlowDeclarativeViewsProxySimulationExamples,
	#superclass : #GtRemotePhlowDeclarativeViewsExamples,
	#category : #'GToolkit-RemoteGt-Examples'
}

{ #category : #accessing }
GtRemotePhlowDeclarativeViewsProxySimulationExamples >> getRemoteObject [
	^ GtRemoteInspectionSimulation 
		openOn: GtRemotePhlowDeclarativeTestInspectable new
]

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
