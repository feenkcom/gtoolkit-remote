Class {
	#name : #GtRemotePhlowActionTargetDeclarativeViewLocalSimulationExamples,
	#superclass : #GtRemotePhlowActionTargetDeclarativeViewLocalExamples,
	#category : #'GToolkit-RemoteGt-Examples-Inspection - Actions'
}

{ #category : #accessing }
GtRemotePhlowActionTargetDeclarativeViewLocalSimulationExamples >> createTestObject [
	<gtExample>
	^ GtRemoteInspectionSimulation openOn: super createTestObject
]
