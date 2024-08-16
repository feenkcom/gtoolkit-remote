Class {
	#name : #GtRemotePhlowDeclarativeActionsProxySimulationExamples,
	#superclass : #GtRemotePhlowDeclarativeActionsExamples,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #accessing }
GtRemotePhlowDeclarativeActionsProxySimulationExamples >> getRemoteObject [
	^ GtRemoteInspectionSimulation 
		openOn: GtRemotePhlowDeclarativeTestInspectable new
]

{ #category : #accessing }
GtRemotePhlowDeclarativeActionsProxySimulationExamples >> remoteObject [
	<gtExample>
	<after: #stopServer>
	| remoteObject |

	remoteObject :=  self getRemoteObject.

	^ remoteObject
]

{ #category : #accessing }
GtRemotePhlowDeclarativeActionsProxySimulationExamples >> retrieveRemoteInspectorProxy [

	self remoteObject remoteInspectorProxyDo: [ :aProxy | ^ aProxy ].
	^ nil
]
