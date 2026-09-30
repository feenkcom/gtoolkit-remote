Class {
	#name : #GtRemotePhlowListViewBasicContextActionsRemoteSimulationExamples,
	#superclass : #GtRemotePhlowListViewBasicContextActionsLocalExamples,
	#category : #'GToolkit-RemoteGt-Examples-Inspection'
}

{ #category : #'examples - setup' }
GtRemotePhlowListViewBasicContextActionsRemoteSimulationExamples >> createTestObject [
	<gtExample>
	^ GtRemotePlainInspectionSimulation openOn: super createTestObject
]

{ #category : #expected }
GtRemotePhlowListViewBasicContextActionsRemoteSimulationExamples >> expectedSingleSelectionForIndex: anIndex [
	^ GtRemotePhlowListingViewSelection forSingleListIndex: anIndex selectionIndex: anIndex
]
