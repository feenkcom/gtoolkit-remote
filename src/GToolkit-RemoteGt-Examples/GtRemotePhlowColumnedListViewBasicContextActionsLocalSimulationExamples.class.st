Class {
	#name : #GtRemotePhlowColumnedListViewBasicContextActionsLocalSimulationExamples,
	#superclass : #GtRemotePhlowColumnedListViewBasicContextActionsLocalExamples,
	#category : #'GToolkit-RemoteGt-Examples-Inspection - Actions'
}

{ #category : #examples }
GtRemotePhlowColumnedListViewBasicContextActionsLocalSimulationExamples >> createTestObject [
	<gtExample>
	^ GtRemoteInspectionSimulation openOn: super createTestObject
]

{ #category : #expected }
GtRemotePhlowColumnedListViewBasicContextActionsLocalSimulationExamples >> expectedMultipleSelectionForIndices: anArray [
	^ GtRemotePhlowListingViewMultipleSelection new
		selectionItems: (anArray collect: [ :idx |
			GtRemotePhlowListingViewListSelectionItem new
				nodeIdentifier: (GtRemotePhlowNodeIdentifier forListIndex: idx);
				selectionIndex: idx ])
]

{ #category : #expected }
GtRemotePhlowColumnedListViewBasicContextActionsLocalSimulationExamples >> expectedSingleSelectionForIndex: anIndex [
	^ GtRemotePhlowListingViewSelection forSingleListIndex: anIndex selectionIndex: anIndex
]
