Class {
	#name : #GtRemotePhlowSimulationExamples,
	#superclass : #Object,
	#category : #'GToolkit-RemoteGt-Examples'
}

{ #category : #accessing }
GtRemotePhlowSimulationExamples >> simulationOnRemoteObject [
	<gtExample>
	^ GtRemoteInspectionSimulation openOn: GtRemotePhlowDeclarativeTestInspectable new.
]
