Class {
	#name : #GtRemotePhlowSimulationExamples,
	#superclass : #Object,
	#category : #'GToolkit-RemoteGt-Examples'
}

{ #category : #accessing }
GtRemotePhlowSimulationExamples >> simulationOnRemoteObject [
	"This is used in the Lepiter documentation"
	<gtExample>
	<return: #GtRemoteInspectionSimulation>
	^ GtRemoteInspectionSimulation
		openOn: GtRemotePhlowDeclarativeTestInspectable new
]
