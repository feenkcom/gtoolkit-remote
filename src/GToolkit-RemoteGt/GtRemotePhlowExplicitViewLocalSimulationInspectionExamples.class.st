Class {
	#name : #GtRemotePhlowExplicitViewLocalSimulationInspectionExamples,
	#superclass : #GtRemotePhlowExplicitViewLocalInspectionExamples,
	#category : #'GToolkit-RemoteGt-Examples-Views'
}

{ #category : #'examples - setup' }
GtRemotePhlowExplicitViewLocalSimulationInspectionExamples >> createEditablePersonObject [
	^GtRemoteInspectionSimulation openOn: super createEditablePersonObject
]

{ #category : #'examples - setup' }
GtRemotePhlowExplicitViewLocalSimulationInspectionExamples >> createErrorTestObject [
	^GtRemoteInspectionSimulation openOn: super createErrorTestObject
]

{ #category : #'examples - setup' }
GtRemotePhlowExplicitViewLocalSimulationInspectionExamples >> createSerializationTestObject [
	^GtRemoteInspectionSimulation openOn: super createSerializationTestObject
]

{ #category : #'examples - setup' }
GtRemotePhlowExplicitViewLocalSimulationInspectionExamples >> createTestObject [
	^GtRemoteInspectionSimulation openOn: super createTestObject
]
