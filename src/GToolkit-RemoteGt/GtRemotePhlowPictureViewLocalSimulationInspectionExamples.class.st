Class {
	#name : #GtRemotePhlowPictureViewLocalSimulationInspectionExamples,
	#superclass : #GtRemotePhlowPictureViewLocalInspectionExamples,
	#category : #'GToolkit-RemoteGt-Examples-Views'
}

{ #category : #'as yet unclassified' }
GtRemotePhlowPictureViewLocalSimulationInspectionExamples >> createErrorTestObject [
	^ GtRemoteInspectionSimulation 
		openOn: super createErrorTestObject
]

{ #category : #'as yet unclassified' }
GtRemotePhlowPictureViewLocalSimulationInspectionExamples >> createTestObject [
	^ GtRemoteInspectionSimulation 
		openOn: super createTestObject
]
