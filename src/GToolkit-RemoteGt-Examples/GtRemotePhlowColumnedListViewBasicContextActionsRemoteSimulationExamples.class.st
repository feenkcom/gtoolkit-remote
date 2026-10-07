Class {
	#name : #GtRemotePhlowColumnedListViewBasicContextActionsRemoteSimulationExamples,
	#superclass : #GtRemotePhlowColumnedListViewBasicContextActionsLocalExamples,
	#category : #'GToolkit-RemoteGt-Examples-Inspection - Actions'
}

{ #category : #examples }
GtRemotePhlowColumnedListViewBasicContextActionsRemoteSimulationExamples >> createTestObject [
	<gtExample>
	^ GtRemotePlainInspectionSimulation openOn: super createTestObject
]

{ #category : #expected }
GtRemotePhlowColumnedListViewBasicContextActionsRemoteSimulationExamples >> expectedMultipleSelectionForIndices: anArray [
	^ GtRemotePhlowListingViewMultipleSelection new
		selectionItems: (anArray collect: [ :idx |
			GtRemotePhlowListingViewListSelectionItem new
				nodeIdentifier: (GtRemotePhlowNodeIdentifier forListIndex: idx);
				selectionIndex: idx ])
]

{ #category : #expected }
GtRemotePhlowColumnedListViewBasicContextActionsRemoteSimulationExamples >> expectedSingleSelectionForIndex: anIndex [
	^ GtRemotePhlowListingViewSelection forSingleListIndex: anIndex selectionIndex: anIndex
]
