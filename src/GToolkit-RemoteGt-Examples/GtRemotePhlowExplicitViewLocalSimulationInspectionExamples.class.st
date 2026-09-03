Class {
	#name : #GtRemotePhlowExplicitViewLocalSimulationInspectionExamples,
	#superclass : #GtRemotePhlowExplicitViewLocalInspectionExamples,
	#category : #'GToolkit-RemoteGt-Examples'
}

{ #category : #'examples - setup' }
GtRemotePhlowExplicitViewLocalSimulationInspectionExamples >> createEditablePersonObject [
	<gtExample>
	^GtRemoteInspectionSimulation openOn: super createEditablePersonObject
]

{ #category : #'examples - setup' }
GtRemotePhlowExplicitViewLocalSimulationInspectionExamples >> createErrorTestObject [
		<gtExample>
	^GtRemoteInspectionSimulation openOn: super createErrorTestObject
]

{ #category : #'examples - setup' }
GtRemotePhlowExplicitViewLocalSimulationInspectionExamples >> createSerializationTestObject [
		<gtExample>
	^GtRemoteInspectionSimulation openOn: super createSerializationTestObject
]

{ #category : #'examples - setup' }
GtRemotePhlowExplicitViewLocalSimulationInspectionExamples >> createTestObject [
		<gtExample>
	^GtRemoteInspectionSimulation openOn: super createTestObject
]
