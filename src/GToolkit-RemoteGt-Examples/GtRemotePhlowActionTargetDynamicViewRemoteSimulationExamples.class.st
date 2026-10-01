Class {
	#name : #GtRemotePhlowActionTargetDynamicViewRemoteSimulationExamples,
	#superclass : #GtRemotePhlowActionTargetDynamicViewLocalExamples,
	#category : #'GToolkit-RemoteGt-Examples-Inspection - Actions'
}

{ #category : #accessing }
GtRemotePhlowActionTargetDynamicViewRemoteSimulationExamples >> createTestObject [
	<gtExample>
	^ GtRemotePlainInspectionSimulation openOn: super createTestObject
]
