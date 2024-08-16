Class {
	#name : #GtRemotePhlowDeclarativeViewsProxySimulationExamples,
	#superclass : #GtRemotePhlowDeclarativeViewsExamples,
	#category : #'GToolkit-RemotePhlow-Examples'
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
	| remoteObject |

	remoteObject :=  self getRemoteObject.

	^ remoteObject
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewsProxySimulationExamples >> retrieveRemoteInspectorProxy [

	self remoteObject remoteInspectorProxyDo: [ :aProxy | ^ aProxy ].
	^ nil
]
