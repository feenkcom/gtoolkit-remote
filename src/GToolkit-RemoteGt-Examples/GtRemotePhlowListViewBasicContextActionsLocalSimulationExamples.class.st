Class {
	#name : #GtRemotePhlowListViewBasicContextActionsLocalSimulationExamples,
	#superclass : #GtRemotePhlowListViewBasicContextActionsLocalExamples,
	#category : #'GToolkit-RemoteGt-Examples-Inspection - Actions'
}

{ #category : #'examples - setup' }
GtRemotePhlowListViewBasicContextActionsLocalSimulationExamples >> createTestObject [
	<gtExample>
	^ GtRemoteInspectionSimulation openOn: super createTestObject
]

{ #category : #expected }
GtRemotePhlowListViewBasicContextActionsLocalSimulationExamples >> expectedMultipleSelectionForIndices: anArray [
	^ GtRemotePhlowListingViewMultipleSelection new
		selectionItems: (anArray collect: [ :idx |
			GtRemotePhlowListingViewListSelectionItem new
				nodeIdentifier: (GtRemotePhlowNodeIdentifier forListIndex: idx);
				selectionIndex: idx ])
]

{ #category : #expected }
GtRemotePhlowListViewBasicContextActionsLocalSimulationExamples >> expectedSingleSelectionForIndex: anIndex [
	^ GtRemotePhlowListingViewSelection forSingleListIndex: anIndex selectionIndex: anIndex
]
