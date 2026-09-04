Class {
	#name : #GtRemotePhlowPictureViewRemoteSimulationInspectionExamples,
	#superclass : #GtRemotePhlowPictureViewLocalInspectionExamples,
	#category : #'GToolkit-RemoteGt-Examples-Inspection'
}

{ #category : #'examples - setup' }
GtRemotePhlowPictureViewRemoteSimulationInspectionExamples >> createErrorTestObject [
	<gtExample>
	^ GtRemotePlainInspectionSimulation 
			openOn: super createErrorTestObject
]

{ #category : #'examples - setup' }
GtRemotePhlowPictureViewRemoteSimulationInspectionExamples >> createTestObject [
	<gtExample>
	^ GtRemotePlainInspectionSimulation 
			openOn: super createTestObject
]
