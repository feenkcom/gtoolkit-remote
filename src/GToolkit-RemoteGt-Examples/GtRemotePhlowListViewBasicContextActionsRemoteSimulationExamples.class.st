Class {
	#name : #GtRemotePhlowListViewBasicContextActionsRemoteSimulationExamples,
	#superclass : #GtRemotePhlowListViewBasicContextActionsLocalExamples,
	#category : #'GToolkit-RemoteGt-Examples-Inspection - Actions'
}

{ #category : #'examples - setup' }
GtRemotePhlowListViewBasicContextActionsRemoteSimulationExamples >> createTestObject [
	<gtExample>
	^ GtRemotePlainInspectionSimulation openOn: super createTestObject
]

{ #category : #expected }
GtRemotePhlowListViewBasicContextActionsRemoteSimulationExamples >> expectedMultipleSelectionForIndices: anArray [
	^ GtRemotePhlowListingViewMultipleSelection new
		selectionItems: (anArray collect: [ :idx |
			GtRemotePhlowListingViewListSelectionItem new
				nodeIdentifier: (GtRemotePhlowNodeIdentifier forListIndex: idx);
				selectionIndex: idx ])
]

{ #category : #expected }
GtRemotePhlowListViewBasicContextActionsRemoteSimulationExamples >> expectedSingleSelectionForIndex: anIndex [
	^ GtRemotePhlowListingViewSelection forSingleListIndex: anIndex selectionIndex: anIndex
]
