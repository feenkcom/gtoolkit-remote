Class {
	#name : #GtRemotePhlowTreeViewBasicContextActionsRemoteSimulationExamples,
	#superclass : #GtRemotePhlowTreeViewBasicContextActionsLocalExamples,
	#category : #'GToolkit-RemoteGt-Examples-Inspection - Actions'
}

{ #category : #assertions }
GtRemotePhlowTreeViewBasicContextActionsRemoteSimulationExamples >> assertInspectedSelectionAtTreePath: aPath atIndex: anIndex inSecondPaneOf: aScripter [
	(aScripter inspectorStep)
		onPagerPaneWithIndex: 2;
		assertInspectedObjectValueFor: [ :obj | obj ]
			equals: (GtRemotePhlowListingViewSingleSelection new
				selectionItem: (GtRemotePhlowListingViewTreeSelectionItem new
					nodeIdentifier: (GtRemotePhlowNodeIdentifier forTreePath: aPath);
					selectionIndex: anIndex));
		play.
]

{ #category : #examples }
GtRemotePhlowTreeViewBasicContextActionsRemoteSimulationExamples >> createTestObject [
	<gtExample>
	^ GtRemotePlainInspectionSimulation openOn: super createTestObject
]

{ #category : #'examples - expanded tree' }
GtRemotePhlowTreeViewBasicContextActionsRemoteSimulationExamples >> expandedChildCellText [
	^ 'value: 11; index: SmallInteger - 1'
]

{ #category : #assertions }
GtRemotePhlowTreeViewBasicContextActionsRemoteSimulationExamples >> expectedMultipleSelectionForIndices: anArray [
	^ GtRemotePhlowListingViewMultipleSelection new
		selectionItems: (anArray collect: [ :idx |
			GtRemotePhlowListingViewTreeSelectionItem new
				nodeIdentifier: (GtRemotePhlowNodeIdentifier forTreePath: {idx});
				selectionIndex: idx ])
]

{ #category : #assertions }
GtRemotePhlowTreeViewBasicContextActionsRemoteSimulationExamples >> expectedMultipleSelectionForItems: anArray [
	^ GtRemotePhlowListingViewMultipleSelection new
		selectionItems: (anArray collect: [ :each |
			GtRemotePhlowListingViewTreeSelectionItem new
				nodeIdentifier: (GtRemotePhlowNodeIdentifier forTreePath: each first);
				selectionIndex: each second ])
]

{ #category : #assertions }
GtRemotePhlowTreeViewBasicContextActionsRemoteSimulationExamples >> expectedSingleSelectionForIndex: anIndex [
	^ GtRemotePhlowListingViewSingleSelection new
		selectionItem: (GtRemotePhlowListingViewTreeSelectionItem new
			nodeIdentifier: (GtRemotePhlowNodeIdentifier forTreePath: {anIndex});
			selectionIndex: anIndex)
]
