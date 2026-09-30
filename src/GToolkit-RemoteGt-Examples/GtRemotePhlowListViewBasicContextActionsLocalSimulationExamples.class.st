Class {
	#name : #GtRemotePhlowListViewBasicContextActionsLocalSimulationExamples,
	#superclass : #GtRemotePhlowListViewBasicContextActionsLocalExamples,
	#category : #'GToolkit-RemoteGt-Examples-Inspection'
}

{ #category : #'examples - setup' }
GtRemotePhlowListViewBasicContextActionsLocalSimulationExamples >> createTestObject [
	<gtExample>
	^ GtRemoteInspectionSimulation openOn: super createTestObject
]

{ #category : #expected }
GtRemotePhlowListViewBasicContextActionsLocalSimulationExamples >> expectedSingleSelectionForIndex: anIndex [
	^ GtRemotePhlowListingViewSelection forSingleListIndex: anIndex selectionIndex: anIndex
]
