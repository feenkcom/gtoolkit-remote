Class {
	#name : #GtRemotePhlowExplicitViewRemoteSimulationInspectionExamples,
	#superclass : #GtRemotePhlowExplicitViewInspectionExamples,
	#category : #'GToolkit-RemoteGt-Examples-Views'
}

{ #category : #'examples - setup' }
GtRemotePhlowExplicitViewRemoteSimulationInspectionExamples >> createEditablePersonObject [
	^GtRemotePlainInspectionSimulation
		openOn: super createEditablePersonObject
]

{ #category : #'examples - setup' }
GtRemotePhlowExplicitViewRemoteSimulationInspectionExamples >> createErrorTestObject [
	^GtRemotePlainInspectionSimulation openOn: super createErrorTestObject
]

{ #category : #'examples - setup' }
GtRemotePhlowExplicitViewRemoteSimulationInspectionExamples >> createSerializationTestObject [
	^GtRemotePlainInspectionSimulation
		openOn: super createSerializationTestObject
]

{ #category : #'examples - setup' }
GtRemotePhlowExplicitViewRemoteSimulationInspectionExamples >> createTestObject [
	^GtRemotePlainInspectionSimulation openOn: super createTestObject
]
