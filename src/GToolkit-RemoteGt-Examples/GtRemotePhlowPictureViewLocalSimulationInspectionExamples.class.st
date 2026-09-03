Class {
	#name : #GtRemotePhlowPictureViewLocalSimulationInspectionExamples,
	#superclass : #GtRemotePhlowPictureViewLocalInspectionExamples,
	#category : #'GToolkit-RemoteGt-Examples'
}

{ #category : #'examples - setup' }
GtRemotePhlowPictureViewLocalSimulationInspectionExamples >> createErrorTestObject [
	<gtExample>
	^ GtRemoteInspectionSimulation 
		openOn: super createErrorTestObject
]

{ #category : #'examples - setup' }
GtRemotePhlowPictureViewLocalSimulationInspectionExamples >> createTestObject [
	<gtExample>
	^ GtRemoteInspectionSimulation 
		openOn: super createTestObject
]
