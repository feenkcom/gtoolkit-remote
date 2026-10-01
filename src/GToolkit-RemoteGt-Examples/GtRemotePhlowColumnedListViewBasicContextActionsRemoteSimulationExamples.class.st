Class {
	#name : #GtRemotePhlowColumnedListViewBasicContextActionsRemoteSimulationExamples,
	#superclass : #GtRemotePhlowColumnedListViewBasicContextActionsLocalExamples,
	#category : #'GToolkit-RemoteGt-Examples-Inspection - Actions'
}

{ #category : #examples }
GtRemotePhlowColumnedListViewBasicContextActionsRemoteSimulationExamples >> createTestObject [
	<gtExample>
	^ GtRemotePlainInspectionSimulation openOn: super createTestObject
]
