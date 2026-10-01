Class {
	#name : #GtRemotePhlowTreeViewBasicContextActionsLocalExamples,
	#superclass : #GtRemotePhlowTreeViewBasicContextActionsExamples,
	#category : #'GToolkit-RemoteGt-Examples-Inspection - Actions'
}

{ #category : #testing }
GtRemotePhlowTreeViewBasicContextActionsLocalExamples class >> isAbstract [
	^ self name = #GtRemotePhlowTreeViewBasicContextActionsLocalExamples
]

{ #category : #assertions }
GtRemotePhlowTreeViewBasicContextActionsLocalExamples >> assertInspectedMultipleSelectionAtIndices: anArray inSecondPaneOf: aScripter [
	(aScripter inspectorStep)
		onPagerPaneWithIndex: 2;
		assertInspectedObjectValueFor: [ :obj | obj ]
			equals: (self expectedMultipleSelectionForIndices: anArray);
		play.
]

{ #category : #assertions }
GtRemotePhlowTreeViewBasicContextActionsLocalExamples >> assertInspectedMultipleSelectionAtItems: anArray inSecondPaneOf: aScripter [
	(aScripter inspectorStep)
		onPagerPaneWithIndex: 2;
		assertInspectedObjectValueFor: [ :obj | obj ]
			equals: (self expectedMultipleSelectionForItems: anArray);
		play.
]

{ #category : #assertions }
GtRemotePhlowTreeViewBasicContextActionsLocalExamples >> assertInspectedMultipleSelectionObjectInSecondPaneOf: aScripter [
	(aScripter inspectorStep)
		onPagerPaneWithIndex: 2;
		assertInspectedObjectOfType: Array;
		assertInspectedObjectValueFor: [ :obj | obj ] equals: {13};
		play.
]

{ #category : #assertions }
GtRemotePhlowTreeViewBasicContextActionsLocalExamples >> assertInspectedObjectWithValue: aValue inSecondPaneOf: aScripter [
	(aScripter inspectorStep)
		onPagerPaneWithIndex: 2;
		assertInspectedObjectOfType: SmallInteger;
		assertInspectedObjectValueFor: [ :obj | obj ] equals: aValue;
		play.
]

{ #category : #assertions }
GtRemotePhlowTreeViewBasicContextActionsLocalExamples >> assertInspectedSelectionAtIndex: anIndex inSecondPaneOf: aScripter [
	(aScripter inspectorStep)
		onPagerPaneWithIndex: 2;
		assertInspectedObjectValueFor: [ :obj | obj ]
			equals: (self expectedSingleSelectionForIndex: anIndex);
		play.
]

{ #category : #assertions }
GtRemotePhlowTreeViewBasicContextActionsLocalExamples >> assertInspectedSelectionAtTreePath: aPath atIndex: anIndex inSecondPaneOf: aScripter [
	(aScripter inspectorStep)
		onPagerPaneWithIndex: 2;
		assertInspectedObjectValueFor: [ :obj | obj ]
			equals: (GtPhlowListingViewSelection forSingleTreePath: aPath selectionIndex: anIndex);
		play.
]

{ #category : #'examples - expanded tree' }
GtRemotePhlowTreeViewBasicContextActionsLocalExamples >> expandedChildCellText [
	^ 'value: 11; index: SmallInteger - 5'
]

{ #category : #accessing }
GtRemotePhlowTreeViewBasicContextActionsLocalExamples >> expectedMultipleSelectionForIndices: anArray [
	^ GtPhlowListingViewMultipleSelection new
		selectionItems: (anArray collect: [ :idx |
			GtPhlowListingViewTreeSelectionItem new
				nodeIdentifier: (GtPhlowNodeIdentifier forTreePath: {idx});
				selectionIndex: idx ])
]

{ #category : #assertions }
GtRemotePhlowTreeViewBasicContextActionsLocalExamples >> expectedMultipleSelectionForItems: anArray [
	^ GtPhlowListingViewMultipleSelection new
		selectionItems: (anArray collect: [ :each |
			GtPhlowListingViewTreeSelectionItem new
				nodeIdentifier: (GtPhlowNodeIdentifier forTreePath: each first);
				selectionIndex: each second ])
]

{ #category : #accessing }
GtRemotePhlowTreeViewBasicContextActionsLocalExamples >> expectedSingleSelectionForIndex: anIndex [
	^ GtPhlowListingViewSelection forSingleTreePath: {anIndex} selectionIndex: anIndex
]
