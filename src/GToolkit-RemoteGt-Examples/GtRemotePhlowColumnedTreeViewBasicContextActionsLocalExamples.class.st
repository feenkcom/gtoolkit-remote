Class {
	#name : #GtRemotePhlowColumnedTreeViewBasicContextActionsLocalExamples,
	#superclass : #GtRemotePhlowColumnedTreeViewBasicContextActionsExamples,
	#category : #'GToolkit-RemoteGt-Examples-Inspection - Actions'
}

{ #category : #testing }
GtRemotePhlowColumnedTreeViewBasicContextActionsLocalExamples class >> isAbstract [
	^ self name = #GtRemotePhlowColumnedTreeViewBasicContextActionsLocalExamples
]

{ #category : #assertions }
GtRemotePhlowColumnedTreeViewBasicContextActionsLocalExamples >> assertInspectedMultipleSelectionAtIndices: anArray inSecondPaneOf: aScripter [
	(aScripter inspectorStep)
		onPagerPaneWithIndex: 2;
		assertInspectedObjectValueFor: [ :obj | obj ]
			equals: (self expectedMultipleSelectionForIndices: anArray);
		play.
]

{ #category : #assertions }
GtRemotePhlowColumnedTreeViewBasicContextActionsLocalExamples >> assertInspectedMultipleSelectionAtItems: anArray inSecondPaneOf: aScripter [
	(aScripter inspectorStep)
		onPagerPaneWithIndex: 2;
		assertInspectedObjectValueFor: [ :obj | obj ]
			equals: (self expectedMultipleSelectionForItems: anArray);
		play.
]

{ #category : #assertions }
GtRemotePhlowColumnedTreeViewBasicContextActionsLocalExamples >> assertInspectedMultipleSelectionObjectInSecondPaneOf: aScripter [
	(aScripter inspectorStep)
		onPagerPaneWithIndex: 2;
		assertInspectedObjectOfType: Array;
		assertInspectedObjectValueFor: [ :obj | obj ] equals: {13};
		play.
]

{ #category : #assertions }
GtRemotePhlowColumnedTreeViewBasicContextActionsLocalExamples >> assertInspectedObjectWithValue: aValue inSecondPaneOf: aScripter [
	(aScripter inspectorStep)
		onPagerPaneWithIndex: 2;
		assertInspectedObjectOfType: SmallInteger;
		assertInspectedObjectValueFor: [ :obj | obj ] equals: aValue;
		play.
]

{ #category : #assertions }
GtRemotePhlowColumnedTreeViewBasicContextActionsLocalExamples >> assertInspectedSelectionAtIndex: anIndex inSecondPaneOf: aScripter [
	(aScripter inspectorStep)
		onPagerPaneWithIndex: 2;
		assertInspectedObjectValueFor: [ :obj | obj ]
			equals: (self expectedSingleSelectionForIndex: anIndex);
		play.
]

{ #category : #assertions }
GtRemotePhlowColumnedTreeViewBasicContextActionsLocalExamples >> assertInspectedSelectionAtTreePath: aPath atIndex: anIndex inSecondPaneOf: aScripter [
	(aScripter inspectorStep)
		onPagerPaneWithIndex: 2;
		assertInspectedObjectValueFor: [ :obj | obj ]
			equals: (GtPhlowListingViewSelection forSingleTreePath: aPath selectionIndex: anIndex);
		play.
]

{ #category : #'examples - expanded tree' }
GtRemotePhlowColumnedTreeViewBasicContextActionsLocalExamples >> expandedChildCellText [
	^ 'value: 11; index: SmallInteger - 5'
]

{ #category : #accessing }
GtRemotePhlowColumnedTreeViewBasicContextActionsLocalExamples >> expectedMultipleSelectionForIndices: anArray [
	^ GtPhlowListingViewMultipleSelection new
		selectionItems: (anArray collect: [ :idx |
			GtPhlowListingViewTreeSelectionItem new
				nodeIdentifier: (GtPhlowNodeIdentifier forTreePath: {idx});
				selectionIndex: idx ])
]

{ #category : #assertions }
GtRemotePhlowColumnedTreeViewBasicContextActionsLocalExamples >> expectedMultipleSelectionForItems: anArray [
	^ GtPhlowListingViewMultipleSelection new
		selectionItems: (anArray collect: [ :each |
			GtPhlowListingViewTreeSelectionItem new
				nodeIdentifier: (GtPhlowNodeIdentifier forTreePath: each first);
				selectionIndex: each second ])
]

{ #category : #accessing }
GtRemotePhlowColumnedTreeViewBasicContextActionsLocalExamples >> expectedSingleSelectionForIndex: anIndex [
	^ GtPhlowListingViewSelection forSingleTreePath: {anIndex} selectionIndex: anIndex
]
