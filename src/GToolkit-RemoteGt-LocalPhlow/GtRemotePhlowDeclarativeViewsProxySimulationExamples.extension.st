Extension { #name : #GtRemotePhlowDeclarativeViewsProxySimulationExamples }

{ #category : #'*GToolkit-RemoteGt-LocalPhlow' }
GtRemotePhlowDeclarativeViewsProxySimulationExamples >> getRemoteObject [
	^ GtRemoteInspectionSimulation 
		openOn: GtRemotePhlowDeclarativeTestInspectable new
]
