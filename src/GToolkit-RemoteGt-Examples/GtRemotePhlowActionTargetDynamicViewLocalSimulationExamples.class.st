Class {
	#name : #GtRemotePhlowActionTargetDynamicViewLocalSimulationExamples,
	#superclass : #GtRemotePhlowActionTargetDynamicViewLocalExamples,
	#category : #'GToolkit-RemoteGt-Examples-Inspection - Actions'
}

{ #category : #accessing }
GtRemotePhlowActionTargetDynamicViewLocalSimulationExamples >> createTestObject [
	<gtExample>
	^ GtRemoteInspectionSimulation openOn: super createTestObject
]
