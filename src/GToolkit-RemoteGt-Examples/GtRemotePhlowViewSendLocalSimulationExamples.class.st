Class {
	#name : #GtRemotePhlowViewSendLocalSimulationExamples,
	#superclass : #GtRemotePhlowViewSendLocalExamples,
	#category : #'GToolkit-RemoteGt-Examples-Inspection - Actions'
}

{ #category : #accessing }
GtRemotePhlowViewSendLocalSimulationExamples >> expandedChildSendSelectionIndex [
	^ #(4)
]

{ #category : #'private - test objects' }
GtRemotePhlowViewSendLocalSimulationExamples >> wrapTestObject: anObject [
	^ GtRemoteInspectionSimulation openOn: anObject
]
