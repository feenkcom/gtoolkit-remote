Extension { #name : #GtRemotePhlowDeclarativeActionsProxySimulationExamples }

{ #category : #'*GToolkit-RemoteGt-LocalPhlow' }
GtRemotePhlowDeclarativeActionsProxySimulationExamples >> getRemoteObject [
	^ GtRemoteInspectionSimulation 
		openOn: GtRemotePhlowDeclarativeTestInspectable new
]
