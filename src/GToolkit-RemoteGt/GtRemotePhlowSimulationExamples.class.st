Class {
	#name : #GtRemotePhlowSimulationExamples,
	#superclass : #Object,
	#category : #'GToolkit-RemoteGt-Examples'
}

{ #category : #accessing }
GtRemotePhlowSimulationExamples >> simulationOnRemoteObject [
	<gtExample>
	<return: #GtRemoteInspectionSimulation>
	^ GtRemoteInspectionSimulation
		openOn: GtRemotePhlowDeclarativeTestInspectable new
]
