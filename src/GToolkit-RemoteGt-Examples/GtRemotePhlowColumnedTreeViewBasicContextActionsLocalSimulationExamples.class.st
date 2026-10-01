Class {
	#name : #GtRemotePhlowColumnedTreeViewBasicContextActionsLocalSimulationExamples,
	#superclass : #GtRemotePhlowColumnedTreeViewBasicContextActionsLocalExamples,
	#category : #'GToolkit-RemoteGt-Examples-Inspection - Actions'
}

{ #category : #'examples - expanded tree' }
GtRemotePhlowColumnedTreeViewBasicContextActionsLocalSimulationExamples >> assertInspectedSelectionAtTreePath: aPath atIndex: anIndex inSecondPaneOf: aScripter [
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
GtRemotePhlowColumnedTreeViewBasicContextActionsLocalSimulationExamples >> createTestObject [
	<gtExample>
	^ GtRemoteInspectionSimulation openOn: super createTestObject
]

{ #category : #'examples - expanded tree' }
GtRemotePhlowColumnedTreeViewBasicContextActionsLocalSimulationExamples >> expandedChildCellText [
	^ 'value: 11; index: SmallInteger - 1'
]

{ #category : #'examples - support' }
GtRemotePhlowColumnedTreeViewBasicContextActionsLocalSimulationExamples >> expectedMultipleSelectionForIndices: anArray [
	^ GtRemotePhlowListingViewMultipleSelection new
		selectionItems: (anArray collect: [ :idx |
			GtRemotePhlowListingViewTreeSelectionItem new
				nodeIdentifier: (GtRemotePhlowNodeIdentifier forTreePath: {idx});
				selectionIndex: idx ])
]

{ #category : #assertions }
GtRemotePhlowColumnedTreeViewBasicContextActionsLocalSimulationExamples >> expectedMultipleSelectionForItems: anArray [
	^ GtRemotePhlowListingViewMultipleSelection new
		selectionItems: (anArray collect: [ :each |
			GtRemotePhlowListingViewTreeSelectionItem new
				nodeIdentifier: (GtRemotePhlowNodeIdentifier forTreePath: each first);
				selectionIndex: each second ])
]

{ #category : #'examples - support' }
GtRemotePhlowColumnedTreeViewBasicContextActionsLocalSimulationExamples >> expectedSingleSelectionForIndex: anIndex [
	^ GtRemotePhlowListingViewSingleSelection new
		selectionItem: (GtRemotePhlowListingViewTreeSelectionItem new
			nodeIdentifier: (GtRemotePhlowNodeIdentifier forTreePath: {anIndex});
			selectionIndex: anIndex)
]
