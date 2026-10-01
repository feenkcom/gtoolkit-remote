Class {
	#name : #GtRemotePhlowViewSendRemoteSimulationExamples,
	#superclass : #GtRemotePhlowViewSendLocalExamples,
	#category : #'GToolkit-RemoteGt-Examples-Inspection - Actions'
}

{ #category : #accessing }
GtRemotePhlowViewSendRemoteSimulationExamples >> expandedChildSendSelectionIndex [
	^ #(4)
]

{ #category : #'private - test objects' }
GtRemotePhlowViewSendRemoteSimulationExamples >> wrapTestObject: anObject [
	^ GtRemotePlainInspectionSimulation openOn: anObject
]
