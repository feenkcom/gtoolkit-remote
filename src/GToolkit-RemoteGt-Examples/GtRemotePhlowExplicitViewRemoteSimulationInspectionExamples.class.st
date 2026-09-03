Class {
	#name : #GtRemotePhlowExplicitViewRemoteSimulationInspectionExamples,
	#superclass : #GtRemotePhlowExplicitViewLocalInspectionExamples,
	#category : #'GToolkit-RemoteGt-Examples'
}

{ #category : #'examples - setup' }
GtRemotePhlowExplicitViewRemoteSimulationInspectionExamples >> createEditablePersonObject [
	<gtExample>
	^GtRemotePlainInspectionSimulation
		openOn: super createEditablePersonObject
]

{ #category : #'examples - setup' }
GtRemotePhlowExplicitViewRemoteSimulationInspectionExamples >> createErrorTestObject [
	<gtExample>
	^GtRemotePlainInspectionSimulation openOn: super createErrorTestObject
]

{ #category : #'examples - setup' }
GtRemotePhlowExplicitViewRemoteSimulationInspectionExamples >> createSerializationTestObject [
	<gtExample>
	^GtRemotePlainInspectionSimulation
		openOn: super createSerializationTestObject
]

{ #category : #'examples - setup' }
GtRemotePhlowExplicitViewRemoteSimulationInspectionExamples >> createTestObject [
	<gtExample>
	^GtRemotePlainInspectionSimulation openOn: super createTestObject
]
