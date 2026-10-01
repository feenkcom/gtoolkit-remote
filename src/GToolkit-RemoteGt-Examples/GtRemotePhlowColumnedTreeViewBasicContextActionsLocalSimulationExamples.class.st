Class {
	#name : #GtRemotePhlowColumnedTreeViewBasicContextActionsLocalSimulationExamples,
	#superclass : #GtRemotePhlowColumnedTreeViewBasicContextActionsLocalExamples,
	#category : #'GToolkit-RemoteGt-Examples-Inspection - Actions'
}

{ #category : #examples }
GtRemotePhlowColumnedTreeViewBasicContextActionsLocalSimulationExamples >> createTestObject [
	<gtExample>
	^ GtRemoteInspectionSimulation openOn: super createTestObject
]

{ #category : #assertions }
GtRemotePhlowColumnedTreeViewBasicContextActionsLocalSimulationExamples >> expectedMultipleSelectionForItems: anArray [
	^ GtRemotePhlowListingViewMultipleSelection new
		selectionItems: (anArray collect: [ :each |
			GtRemotePhlowListingViewTreeSelectionItem new
				nodeIdentifier: (GtRemotePhlowNodeIdentifier forTreePath: each first);
				selectionIndex: each second ])
]

{ #category : #accessing }
GtRemotePhlowColumnedTreeViewBasicContextActionsLocalSimulationExamples >> expectedSingleSelectionForTreePath: aPath atIndex: anIndex [
	^ GtRemotePhlowListingViewSingleSelection new
		selectionItem: (GtRemotePhlowListingViewTreeSelectionItem new
			nodeIdentifier: (GtRemotePhlowNodeIdentifier forTreePath: aPath);
			selectionIndex: anIndex)
]
