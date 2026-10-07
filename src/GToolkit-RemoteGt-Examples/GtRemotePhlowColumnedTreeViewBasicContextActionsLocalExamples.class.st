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
GtRemotePhlowColumnedTreeViewBasicContextActionsLocalExamples >> assertInspectedSelectionAtTreePath: aPath atIndex: anIndex inSecondPaneOf: aScripter [
	(aScripter inspectorStep)
		onPagerPaneWithIndex: 2;
		assertInspectedObjectValueFor: [ :obj | obj ]
			equals: (self expectedSingleSelectionForTreePath: aPath atIndex: anIndex);
		play.
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
GtRemotePhlowColumnedTreeViewBasicContextActionsLocalExamples >> expectedSingleSelectionForTreePath: aPath atIndex: anIndex [
	^ GtPhlowListingViewSelection forSingleTreePath: aPath selectionIndex: anIndex
]
