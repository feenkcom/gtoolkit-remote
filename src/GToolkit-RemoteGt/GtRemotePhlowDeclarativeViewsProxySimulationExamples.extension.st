Extension { #name : #GtRemotePhlowDeclarativeViewsProxySimulationExamples }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowDeclarativeViewsProxySimulationExamples >> getRemoteObject [
	^ GtRemoteInspectionSimulation 
		openOn: GtRemotePhlowDeclarativeTestInspectable new
]
