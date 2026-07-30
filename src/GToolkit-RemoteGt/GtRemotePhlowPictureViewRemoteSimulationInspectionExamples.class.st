Class {
	#name : #GtRemotePhlowPictureViewRemoteSimulationInspectionExamples,
	#superclass : #GtRemotePhlowPictureViewInspectionExamples,
	#category : #'GToolkit-RemoteGt-Examples-Views'
}

{ #category : #'as yet unclassified' }
GtRemotePhlowPictureViewRemoteSimulationInspectionExamples >> createErrorTestObject [
	^ GtRemotePlainInspectionSimulation 
			openOn: super createErrorTestObject
]

{ #category : #'as yet unclassified' }
GtRemotePhlowPictureViewRemoteSimulationInspectionExamples >> createTestObject [
	^ GtRemotePlainInspectionSimulation 
			openOn: super createTestObject
]
