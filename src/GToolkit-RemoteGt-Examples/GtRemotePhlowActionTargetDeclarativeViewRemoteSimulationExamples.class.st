Class {
	#name : #GtRemotePhlowActionTargetDeclarativeViewRemoteSimulationExamples,
	#superclass : #GtRemotePhlowActionTargetDeclarativeViewLocalExamples,
	#category : #'GToolkit-RemoteGt-Examples-Inspection - Actions'
}

{ #category : #accessing }
GtRemotePhlowActionTargetDeclarativeViewRemoteSimulationExamples >> createTestObject [
	<gtExample>
	^ GtRemotePlainInspectionSimulation openOn: super createTestObject
]
