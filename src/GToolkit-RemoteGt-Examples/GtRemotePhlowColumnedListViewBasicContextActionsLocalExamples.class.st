Class {
	#name : #GtRemotePhlowColumnedListViewBasicContextActionsLocalExamples,
	#superclass : #GtRemotePhlowColumnedListViewBasicContextActionsExamples,
	#category : #'GToolkit-RemoteGt-Examples-Inspection - Actions'
}

{ #category : #testing }
GtRemotePhlowColumnedListViewBasicContextActionsLocalExamples class >> isAbstract [
	^ self name = #GtRemotePhlowColumnedListViewBasicContextActionsLocalExamples
]

{ #category : #assertions }
GtRemotePhlowColumnedListViewBasicContextActionsLocalExamples >> assertInspectedMultipleSelectionAtIndices: anArray inSecondPaneOf: aScripter [
	(aScripter inspectorStep)
		onPagerPaneWithIndex: 2;
		assertInspectedObjectValueFor: [ :obj | obj ]
			equals: (self expectedMultipleSelectionForIndices: anArray);
		play.
]

{ #category : #assertions }
GtRemotePhlowColumnedListViewBasicContextActionsLocalExamples >> assertInspectedMultipleSelectionObjectInSecondPaneOf: aScripter [
	(aScripter inspectorStep)
		onPagerPaneWithIndex: 2;
		assertInspectedObjectOfType: Array;
		assertInspectedObjectValueFor: [ :obj | obj ] equals: {13};
		play.
]

{ #category : #assertions }
GtRemotePhlowColumnedListViewBasicContextActionsLocalExamples >> assertInspectedObjectWithValue: aValue inSecondPaneOf: aScripter [
	(aScripter inspectorStep)
		onPagerPaneWithIndex: 2;
		assertInspectedObjectOfType: SmallInteger;
		assertInspectedObjectValueFor: [ :obj | obj ] equals: aValue;
		play.
]

{ #category : #assertions }
GtRemotePhlowColumnedListViewBasicContextActionsLocalExamples >> assertInspectedSelectionAtIndex: anIndex inSecondPaneOf: aScripter [
	(aScripter inspectorStep)
		onPagerPaneWithIndex: 2;
		assertInspectedObjectValueFor: [ :obj | obj ]
			equals: (self expectedSingleSelectionForIndex: anIndex);
		play.
]

{ #category : #expected }
GtRemotePhlowColumnedListViewBasicContextActionsLocalExamples >> expectedMultipleSelectionForIndices: anArray [
	^ GtPhlowListingViewMultipleSelection new
		selectionItems: (anArray collect: [ :idx |
			GtPhlowListingViewListSelectionItem new
				nodeIdentifier: (GtPhlowNodeIdentifier forListIndex: idx);
				selectionIndex: idx ])
]

{ #category : #expected }
GtRemotePhlowColumnedListViewBasicContextActionsLocalExamples >> expectedSingleSelectionForIndex: anIndex [
	^ GtPhlowListingViewSelection forSingleListIndex: anIndex
]
