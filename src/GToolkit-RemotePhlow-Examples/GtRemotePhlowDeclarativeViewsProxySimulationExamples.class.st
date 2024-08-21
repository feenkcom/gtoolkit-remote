Class {
	#name : #GtRemotePhlowDeclarativeViewsProxySimulationExamples,
	#superclass : #GtRemotePhlowDeclarativeViewsExamples,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #accessing }
GtRemotePhlowDeclarativeViewsProxySimulationExamples >> remoteObject [
	<gtExample>
	<after: #stopServer>
	| remoteObject |

	remoteObject :=  self getRemoteObject.

	^ remoteObject
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewsProxySimulationExamples >> retrieveRemotePhlowSpecificationsProvider [

	self remoteObject 
		remoteInspectorProxyDo: [ :aProxy | ^ aProxy ].
	^ nil
]
