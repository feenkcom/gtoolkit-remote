"
Abstract local subclass for context menu action inspection examples. Subclasses provide the test object directly or wrapped in a simulation.
"
Class {
	#name : #GtRemotePhlowListViewBasicContextActionsLocalExamples,
	#superclass : #GtRemotePhlowListViewBasicContextActionsExamples,
	#category : #'GToolkit-RemoteGt-Examples-Inspection - Actions'
}

{ #category : #testing }
GtRemotePhlowListViewBasicContextActionsLocalExamples class >> isAbstract [
	^ self name = #GtRemotePhlowListViewBasicContextActionsLocalExamples
]

{ #category : #assertions }
GtRemotePhlowListViewBasicContextActionsLocalExamples >> assertInspectedMultipleSelectionAtIndices: anArray inSecondPaneOf: aScripter [
	(aScripter inspectorStep)
		onPagerPaneWithIndex: 2;
		assertInspectedObjectValueFor: [ :obj | obj ]
			equals: (self expectedMultipleSelectionForIndices: anArray);
		play.
]

{ #category : #assertions }
GtRemotePhlowListViewBasicContextActionsLocalExamples >> assertInspectedMultipleSelectionObjectInSecondPaneOf: aScripter [
	(aScripter inspectorStep)
		onPagerPaneWithIndex: 2;
		assertInspectedObjectOfType: Array;
		assertInspectedObjectValueFor: [ :obj | obj ] equals: {13};
		play.
]

{ #category : #assertions }
GtRemotePhlowListViewBasicContextActionsLocalExamples >> assertInspectedObjectWithValue: aValue inSecondPaneOf: aScripter [
	(aScripter inspectorStep)
		onPagerPaneWithIndex: 2;
		assertInspectedObjectOfType: SmallInteger;
		assertInspectedObjectValueFor: [ :obj | obj ] equals: aValue;
		play.
]

{ #category : #assertions }
GtRemotePhlowListViewBasicContextActionsLocalExamples >> assertInspectedSelectionAtIndex: anIndex inSecondPaneOf: aScripter [
	(aScripter inspectorStep)
		onPagerPaneWithIndex: 2;
		assertInspectedObjectValueFor: [ :obj | obj ]
			equals: (self expectedSingleSelectionForIndex: anIndex);
		play.
]

{ #category : #'examples - dynamic actions' }
GtRemotePhlowListViewBasicContextActionsLocalExamples >> dynamicActionsContextMenuOnItem11 [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicActionsViewInPager.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 11; index: 2';
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedDynamicMenuLabels;
		play.

	^ scripter
]

{ #category : #'examples - dynamic actions' }
GtRemotePhlowListViewBasicContextActionsLocalExamples >> dynamicActionsContextMenuOnItem13 [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicActionsViewInPager.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 13; index: 4';
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedDynamicMenuLabelsWithGreaterThan12;
		play.

	^ scripter
]

{ #category : #'examples - dynamic actions' }
GtRemotePhlowListViewBasicContextActionsLocalExamples >> dynamicActionsInspectObjectOnItem13OpensNewPane [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicActionsViewInPager.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 13; index: 4';
		play.

	scripter menuStep
		clickMenuItemWithLabel: 'Inspect object';
		onMenuContainer;
		play.

	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.

	self assertInspectedObjectWithValue: 13 inSecondPaneOf: scripter.

	^ scripter
]

{ #category : #'examples - dynamic actions' }
GtRemotePhlowListViewBasicContextActionsLocalExamples >> dynamicActionsInspectSelectionOnItem13OpensNewPane [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicActionsViewInPager.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 13; index: 4';
		play.

	scripter menuStep
		clickMenuItemWithLabel: 'Inspect selection';
		onMenuContainer;
		play.

	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.

	self assertInspectedSelectionAtIndex: 4 inSecondPaneOf: scripter.

	^ scripter
]

{ #category : #'examples - dynamic actions multiple selection' }
GtRemotePhlowListViewBasicContextActionsLocalExamples >> dynamicActionsMultipleSelectionContextMenuOnSingleItem [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicActionsMultipleSelectionViewInPager.

	scripter click
		onPhlowCellWithString: 'value: 11; index: 2';
		play.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 11; index: 2';
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedDynamicMenuLabels;
		play.

	^ scripter
]

{ #category : #'examples - dynamic actions multiple selection' }
GtRemotePhlowListViewBasicContextActionsLocalExamples >> dynamicActionsMultipleSelectionContextMenuOnThreeItemsIncluding14 [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicActionsMultipleSelectionViewInPager.

	scripter click
		onPhlowCellWithString: 'value: 12; index: 3';
		play.

	scripter click
		modifiers: BlKeyModifiers primary;
		onPhlowCellWithString: 'value: 13; index: 4';
		play.

	scripter click
		modifiers: BlKeyModifiers primary;
		onPhlowCellWithString: 'value: 14; index: 5';
		play.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 14; index: 5';
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedDynamicMenuLabelsWithThreeElementsAndIncludes14;
		play.

	^ scripter
]

{ #category : #'examples - dynamic actions multiple selection' }
GtRemotePhlowListViewBasicContextActionsLocalExamples >> dynamicActionsMultipleSelectionContextMenuOnTwoItemsIncluding14 [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicActionsMultipleSelectionViewInPager.

	scripter click
		onPhlowCellWithString: 'value: 13; index: 4';
		play.

	scripter click
		modifiers: BlKeyModifiers primary;
		onPhlowCellWithString: 'value: 14; index: 5';
		play.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 14; index: 5';
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedDynamicMenuLabelsWithIncludes14;
		play.

	^ scripter
]

{ #category : #'examples - dynamic actions multiple selection' }
GtRemotePhlowListViewBasicContextActionsLocalExamples >> dynamicActionsMultipleSelectionInspectObjectOnSingleItem13 [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicActionsMultipleSelectionViewInPager.

	scripter click
		onPhlowCellWithString: 'value: 13; index: 4';
		play.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 13; index: 4';
		play.

	scripter menuStep
		clickMenuItemWithLabel: 'Inspect object';
		onMenuContainer;
		play.

	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.

	self assertInspectedMultipleSelectionObjectInSecondPaneOf: scripter.

	^ scripter
]

{ #category : #'examples - dynamic actions multiple selection' }
GtRemotePhlowListViewBasicContextActionsLocalExamples >> dynamicActionsMultipleSelectionInspectSelectionOnTwoItems [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicActionsMultipleSelectionViewInPager.

	scripter click
		onPhlowCellWithString: 'value: 13; index: 4';
		play.

	scripter click
		modifiers: BlKeyModifiers primary;
		onPhlowCellWithString: 'value: 14; index: 5';
		play.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 14; index: 5';
		play.

	scripter menuStep
		clickMenuItemWithLabel: 'Inspect selection';
		onMenuContainer;
		play.

	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.

	self assertInspectedMultipleSelectionAtIndices: #(4 5) inSecondPaneOf: scripter.

	^ scripter
]

{ #category : #expected }
GtRemotePhlowListViewBasicContextActionsLocalExamples >> expectedMultipleSelectionForIndices: anArray [
	^ GtPhlowListingViewMultipleSelection new
		selectionItems: (anArray collect: [ :idx |
			GtPhlowListingViewListSelectionItem new
				nodeIdentifier: (GtPhlowNodeIdentifier forListIndex: idx);
				selectionIndex: idx ])
]

{ #category : #expected }
GtRemotePhlowListViewBasicContextActionsLocalExamples >> expectedSingleSelectionForIndex: anIndex [
	^ GtPhlowListingViewSelection forSingleListIndex: anIndex
]

{ #category : #'examples - dynamic actions multiple selection' }
GtRemotePhlowListViewBasicContextActionsLocalExamples >> scripterOnDynamicActionsMultipleSelectionViewInPager [
	<gtExample>
	| scripter |
	scripter := BlScripter new.
	scripter element: (GtPagerSettings usedPager
		createWrappedOn: self createTestObject gtDefaultInspectorTool).
	(scripter inspectorStep)
		scrollToTabWithName: 'Dynamic - multiple selection';
		clickOnTabWithName: 'Dynamic - multiple selection';
		assertSelectedTabWithName: 'Dynamic - multiple selection';
		play.
	^ scripter
]

{ #category : #'examples - dynamic actions' }
GtRemotePhlowListViewBasicContextActionsLocalExamples >> scripterOnDynamicActionsViewInPager [
	<gtExample>
	| scripter |
	scripter := BlScripter new.
	scripter element: (GtPagerSettings usedPager
		createWrappedOn: self createTestObject gtDefaultInspectorTool).
	(scripter inspectorStep)
		scrollToTabWithName: 'Dynamic actions';
		clickOnTabWithName: 'Dynamic actions';
		assertSelectedTabWithName: 'Dynamic actions';
		play.
	^ scripter
]
