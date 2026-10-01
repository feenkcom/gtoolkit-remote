Class {
	#name : #GtRemotePhlowViewSendRemoteSimulationExamples,
	#superclass : #GtRemotePhlowViewSendLocalExamples,
	#category : #'GToolkit-RemoteGt-Examples-Inspection - Actions'
}

{ #category : #'private - test objects' }
GtRemotePhlowViewSendRemoteSimulationExamples >> wrapTestObject: anObject [
	^ GtRemotePlainInspectionSimulation openOn: anObject
]
