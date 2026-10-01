Class {
	#name : #GtRemotePhlowColumnedTreeViewBasicContextActionsRemoteSimulationExamples,
	#superclass : #GtRemotePhlowColumnedTreeViewBasicContextActionsLocalExamples,
	#category : #'GToolkit-RemoteGt-Examples-Inspection - Actions'
}

{ #category : #examples }
GtRemotePhlowColumnedTreeViewBasicContextActionsRemoteSimulationExamples >> createTestObject [
	<gtExample>
	^ GtRemotePlainInspectionSimulation openOn: super createTestObject
]

{ #category : #assertions }
GtRemotePhlowColumnedTreeViewBasicContextActionsRemoteSimulationExamples >> expectedMultipleSelectionForItems: anArray [
	^ GtRemotePhlowListingViewMultipleSelection new
		selectionItems: (anArray collect: [ :each |
			GtRemotePhlowListingViewTreeSelectionItem new
				nodeIdentifier: (GtRemotePhlowNodeIdentifier forTreePath: each first);
				selectionIndex: each second ])
]

{ #category : #accessing }
GtRemotePhlowColumnedTreeViewBasicContextActionsRemoteSimulationExamples >> expectedSingleSelectionForTreePath: aPath atIndex: anIndex [
	^ GtRemotePhlowListingViewSingleSelection new
		selectionItem: (GtRemotePhlowListingViewTreeSelectionItem new
			nodeIdentifier: (GtRemotePhlowNodeIdentifier forTreePath: aPath);
			selectionIndex: anIndex)
]
