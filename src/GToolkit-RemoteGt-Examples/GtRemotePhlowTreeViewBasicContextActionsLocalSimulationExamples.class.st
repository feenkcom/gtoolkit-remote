Class {
	#name : #GtRemotePhlowTreeViewBasicContextActionsLocalSimulationExamples,
	#superclass : #GtRemotePhlowTreeViewBasicContextActionsLocalExamples,
	#category : #'GToolkit-RemoteGt-Examples-Inspection - Actions'
}

{ #category : #examples }
GtRemotePhlowTreeViewBasicContextActionsLocalSimulationExamples >> createTestObject [
	<gtExample>
	^ GtRemoteInspectionSimulation openOn: super createTestObject
]

{ #category : #assertions }
GtRemotePhlowTreeViewBasicContextActionsLocalSimulationExamples >> expectedMultipleSelectionForItems: anArray [
	^ GtRemotePhlowListingViewMultipleSelection new
		selectionItems: (anArray collect: [ :each |
			GtRemotePhlowListingViewTreeSelectionItem new
				nodeIdentifier: (GtRemotePhlowNodeIdentifier forTreePath: each first);
				selectionIndex: each second ])
]

{ #category : #accessing }
GtRemotePhlowTreeViewBasicContextActionsLocalSimulationExamples >> expectedSingleSelectionForTreePath: aPath atIndex: anIndex [
	^ GtRemotePhlowListingViewSingleSelection new
		selectionItem: (GtRemotePhlowListingViewTreeSelectionItem new
			nodeIdentifier: (GtRemotePhlowNodeIdentifier forTreePath: aPath);
			selectionIndex: anIndex)
]
