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
GtRemotePhlowTreeViewBasicContextActionsLocalExamples >> assertInspectedSelectionAtTreePath: aPath atIndex: anIndex inSecondPaneOf: aScripter [
	(aScripter inspectorStep)
		onPagerPaneWithIndex: 2;
		assertInspectedObjectValueFor: [ :obj | obj ]
			equals: (self expectedSingleSelectionForTreePath: aPath atIndex: anIndex);
		play.
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
GtRemotePhlowTreeViewBasicContextActionsLocalExamples >> expectedSingleSelectionForTreePath: aPath atIndex: anIndex [
	^ GtPhlowListingViewSelection forSingleTreePath: aPath selectionIndex: anIndex
]
