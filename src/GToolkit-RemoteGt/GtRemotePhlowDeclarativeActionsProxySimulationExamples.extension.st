Extension { #name : #GtRemotePhlowDeclarativeActionsProxySimulationExamples }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowDeclarativeActionsProxySimulationExamples >> getRemoteObject [
	^ GtRemoteInspectionSimulation 
		openOn: GtRemotePhlowDeclarativeTestInspectable new
]
