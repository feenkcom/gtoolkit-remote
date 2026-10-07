"
Scripter-based examples testing context menu actions on the Basic actions view of GtRemotePhlowListViewContextActionsBasicTestObject. Verifies that the correct menu items appear (including conditional showIf: items) and that clicking menu actions spawns the expected objects.
"
Class {
	#name : #GtRemotePhlowListViewBasicContextActionsExamples,
	#superclass : #Object,
	#category : #'GToolkit-RemoteGt-Examples-Inspection - Actions'
}

{ #category : #testing }
GtRemotePhlowListViewBasicContextActionsExamples class >> isAbstract [
	^ self name = #GtRemotePhlowListViewBasicContextActionsExamples
]

{ #category : #assertions }
GtRemotePhlowListViewBasicContextActionsExamples >> assertInspectedMultipleSelectionAtIndices: anArray inSecondPaneOf: aScripter [
	^ self subclassResponsibility
]

{ #category : #assertions }
GtRemotePhlowListViewBasicContextActionsExamples >> assertInspectedMultipleSelectionObjectInSecondPaneOf: aScripter [
	^ self subclassResponsibility
]

{ #category : #assertions }
GtRemotePhlowListViewBasicContextActionsExamples >> assertInspectedObjectWithValue: aValue inSecondPaneOf: aScripter [
	^ self subclassResponsibility
]

{ #category : #assertions }
GtRemotePhlowListViewBasicContextActionsExamples >> assertInspectedSelectionAtIndex: anIndex inSecondPaneOf: aScripter [
	^ self subclassResponsibility
]

{ #category : #examples }
GtRemotePhlowListViewBasicContextActionsExamples >> contextMenuOnItem11 [
	<gtExample>
	| scripter |
	scripter := self scripterOnBasicActionsViewInPager.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 11; index: 2' ;
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedBasicMenuLabels;
		play.

	^ scripter
]

{ #category : #examples }
GtRemotePhlowListViewBasicContextActionsExamples >> contextMenuOnItem13 [
	<gtExample>
	| scripter |
	scripter := self scripterOnBasicActionsViewInPager.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 13; index: 4';
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedBasicMenuLabelsWithGreaterThan12;
		play.

	^ scripter
]

{ #category : #'examples - setup' }
GtRemotePhlowListViewBasicContextActionsExamples >> createTestObject [
	<gtExample>
	^ GtRemotePhlowListViewContextActionsBasicTestObject new
]

{ #category : #'examples - dynamic context phlow actions' }
GtRemotePhlowListViewBasicContextActionsExamples >> dynamicContextPhlowActionsContextMenuOnItem11 [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicContextPhlowActionsViewInPager.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 11; index: 2';
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedDynamicMenuLabels;
		play.

	^ scripter
]

{ #category : #'examples - dynamic context phlow actions' }
GtRemotePhlowListViewBasicContextActionsExamples >> dynamicContextPhlowActionsContextMenuOnItem13 [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicContextPhlowActionsViewInPager.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 13; index: 4';
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedDynamicMenuLabelsWithGreaterThan12;
		play.

	^ scripter
]

{ #category : #'examples - dynamic context phlow actions' }
GtRemotePhlowListViewBasicContextActionsExamples >> dynamicContextPhlowActionsInspectObjectOnItem13OpensNewPane [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicContextPhlowActionsViewInPager.

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

{ #category : #'examples - dynamic context phlow actions' }
GtRemotePhlowListViewBasicContextActionsExamples >> dynamicContextPhlowActionsInspectSelectionOnItem13OpensNewPane [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicContextPhlowActionsViewInPager.

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

{ #category : #'examples - dynamic context phlow actions multiple selection' }
GtRemotePhlowListViewBasicContextActionsExamples >> dynamicContextPhlowActionsMultipleSelectionContextMenuOnSingleItem [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicContextPhlowActionsMultipleSelectionViewInPager.

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

{ #category : #'examples - dynamic context phlow actions multiple selection' }
GtRemotePhlowListViewBasicContextActionsExamples >> dynamicContextPhlowActionsMultipleSelectionContextMenuOnThreeItemsIncluding14 [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicContextPhlowActionsMultipleSelectionViewInPager.

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

{ #category : #'examples - dynamic context phlow actions multiple selection' }
GtRemotePhlowListViewBasicContextActionsExamples >> dynamicContextPhlowActionsMultipleSelectionContextMenuOnTwoItemsIncluding14 [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicContextPhlowActionsMultipleSelectionViewInPager.

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

{ #category : #'examples - dynamic context phlow actions multiple selection' }
GtRemotePhlowListViewBasicContextActionsExamples >> dynamicContextPhlowActionsMultipleSelectionInspectObjectOnSingleItem13 [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicContextPhlowActionsMultipleSelectionViewInPager.

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

{ #category : #'examples - dynamic context phlow actions multiple selection' }
GtRemotePhlowListViewBasicContextActionsExamples >> dynamicContextPhlowActionsMultipleSelectionInspectSelectionOnTwoItems [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicContextPhlowActionsMultipleSelectionViewInPager.

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

{ #category : #'examples - dynamic phlow actions' }
GtRemotePhlowListViewBasicContextActionsExamples >> dynamicPhlowActionsContextMenuOnItem11 [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicPhlowActionsViewInPager.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 11; index: 2';
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedDynamicMenuLabels;
		play.

	^ scripter
]

{ #category : #'examples - dynamic phlow actions' }
GtRemotePhlowListViewBasicContextActionsExamples >> dynamicPhlowActionsContextMenuOnItem13 [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicPhlowActionsViewInPager.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 13; index: 4';
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedDynamicMenuLabelsWithGreaterThan12;
		play.

	^ scripter
]

{ #category : #'examples - dynamic phlow actions' }
GtRemotePhlowListViewBasicContextActionsExamples >> dynamicPhlowActionsInspectObjectOnItem13OpensNewPane [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicPhlowActionsViewInPager.

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

{ #category : #'examples - dynamic phlow actions' }
GtRemotePhlowListViewBasicContextActionsExamples >> dynamicPhlowActionsInspectSelectionOnItem13OpensNewPane [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicPhlowActionsViewInPager.

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

{ #category : #'examples - dynamic phlow actions multiple selection' }
GtRemotePhlowListViewBasicContextActionsExamples >> dynamicPhlowActionsMultipleSelectionContextMenuOnSingleItem [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicPhlowActionsMultipleSelectionViewInPager.

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

{ #category : #'examples - dynamic phlow actions multiple selection' }
GtRemotePhlowListViewBasicContextActionsExamples >> dynamicPhlowActionsMultipleSelectionContextMenuOnThreeItemsIncluding14 [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicPhlowActionsMultipleSelectionViewInPager.

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

{ #category : #'examples - dynamic phlow actions multiple selection' }
GtRemotePhlowListViewBasicContextActionsExamples >> dynamicPhlowActionsMultipleSelectionContextMenuOnTwoItemsIncluding14 [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicPhlowActionsMultipleSelectionViewInPager.

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

{ #category : #'examples - dynamic phlow actions multiple selection' }
GtRemotePhlowListViewBasicContextActionsExamples >> dynamicPhlowActionsMultipleSelectionInspectObjectOnSingleItem13 [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicPhlowActionsMultipleSelectionViewInPager.

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

{ #category : #'examples - dynamic phlow actions multiple selection' }
GtRemotePhlowListViewBasicContextActionsExamples >> dynamicPhlowActionsMultipleSelectionInspectSelectionOnTwoItems [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicPhlowActionsMultipleSelectionViewInPager.

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

{ #category : #'expected menu labels' }
GtRemotePhlowListViewBasicContextActionsExamples >> expectedBasicMenuLabels [
	^ {'Inspect element'. 'Inspect object'. 'Inspect selection'. 'Inspect parameters'}
]

{ #category : #'expected menu labels' }
GtRemotePhlowListViewBasicContextActionsExamples >> expectedBasicMenuLabelsWithGreaterThan12 [
	^ self expectedBasicMenuLabels , {'Show if greater than 12'}
]

{ #category : #'expected menu labels' }
GtRemotePhlowListViewBasicContextActionsExamples >> expectedBasicMenuLabelsWithIncludes14 [
	^ self expectedBasicMenuLabels , {'Show if 14 in selection'}
]

{ #category : #'expected menu labels' }
GtRemotePhlowListViewBasicContextActionsExamples >> expectedBasicMenuLabelsWithThreeElementsAndIncludes14 [
	^ self expectedBasicMenuLabels , {'Show if 3 elements in selection'. 'Show if 14 in selection'}
]

{ #category : #expected }
GtRemotePhlowListViewBasicContextActionsExamples >> expectedDynamicMenuLabels [
	^ {'Inspect element'. 'Inspect object'. 'Inspect selection'. 'Inspect parameters'. 'Inspect outer parameters'}
]

{ #category : #expected }
GtRemotePhlowListViewBasicContextActionsExamples >> expectedDynamicMenuLabelsWithGreaterThan12 [
	^ self expectedDynamicMenuLabels , {'Show if greater than 12'}
]

{ #category : #expected }
GtRemotePhlowListViewBasicContextActionsExamples >> expectedDynamicMenuLabelsWithIncludes14 [
	^ self expectedDynamicMenuLabels , {'Show if 14 in selection'}
]

{ #category : #expected }
GtRemotePhlowListViewBasicContextActionsExamples >> expectedDynamicMenuLabelsWithThreeElementsAndIncludes14 [
	^ self expectedDynamicMenuLabels , {'Show if 3 elements in selection'. 'Show if 14 in selection'}
]

{ #category : #examples }
GtRemotePhlowListViewBasicContextActionsExamples >> inspectObjectOnItem13OpensNewPane [
	<gtExample>
	| scripter |
	scripter := self scripterOnBasicActionsViewInPager.

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

{ #category : #examples }
GtRemotePhlowListViewBasicContextActionsExamples >> inspectSelectionOnItem13OpensNewPane [
	<gtExample>
	| scripter |
	scripter := self scripterOnBasicActionsViewInPager.

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

{ #category : #'examples - multiple selection' }
GtRemotePhlowListViewBasicContextActionsExamples >> multipleSelectionContextMenuOnSingleItem [
	<gtExample>
	| scripter |
	scripter := self scripterOnMultipleSelectionViewInPager.

	scripter click
		onPhlowCellWithString: 'value: 11; index: 2';
		play.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 11; index: 2';
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedBasicMenuLabels;
		play.

	^ scripter
]

{ #category : #'examples - multiple selection' }
GtRemotePhlowListViewBasicContextActionsExamples >> multipleSelectionContextMenuOnThreeItemsIncluding14 [
	<gtExample>
	| scripter |
	scripter := self scripterOnMultipleSelectionViewInPager.

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
		assertMenuItemLabels: self expectedBasicMenuLabelsWithThreeElementsAndIncludes14;
		play.

	^ scripter
]

{ #category : #'examples - multiple selection' }
GtRemotePhlowListViewBasicContextActionsExamples >> multipleSelectionContextMenuOnTwoItemsIncluding14 [
	<gtExample>
	| scripter |
	scripter := self scripterOnMultipleSelectionViewInPager.

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
		assertMenuItemLabels: self expectedBasicMenuLabelsWithIncludes14;
		play.

	^ scripter
]

{ #category : #'examples - multiple selection' }
GtRemotePhlowListViewBasicContextActionsExamples >> multipleSelectionInspectObjectOnSingleItem13 [
	<gtExample>
	| scripter |
	scripter := self scripterOnMultipleSelectionViewInPager.

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

{ #category : #'examples - multiple selection' }
GtRemotePhlowListViewBasicContextActionsExamples >> multipleSelectionInspectSelectionOnTwoItems [
	<gtExample>
	| scripter |
	scripter := self scripterOnMultipleSelectionViewInPager.

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

{ #category : #'examples - setup' }
GtRemotePhlowListViewBasicContextActionsExamples >> scripterOnBasicActionsViewInPager [
	<gtExample>
	| scripter |
	scripter := BlScripter new.
	scripter element: (GtPagerSettings usedPager
		createWrappedOn: self createTestObject gtDefaultInspectorTool).
	(scripter inspectorStep)
		clickOnTabWithName: 'Basic actions';
		assertSelectedTabWithName: 'Basic actions';
		play.
	^ scripter
]

{ #category : #'examples - dynamic context phlow actions multiple selection' }
GtRemotePhlowListViewBasicContextActionsExamples >> scripterOnDynamicContextPhlowActionsMultipleSelectionViewInPager [
	<gtExample>
	| scripter |
	scripter := BlScripter new.
	scripter element: (GtPagerSettings usedPager
		createWrappedOn: self createTestObject gtDefaultInspectorTool).
	(scripter inspectorStep)
		scrollToTabWithName: 'Dynamic context phlow - multiple selection';
		clickOnTabWithName: 'Dynamic context phlow - multiple selection';
		assertSelectedTabWithName: 'Dynamic context phlow - multiple selection';
		play.
	^ scripter
]

{ #category : #'examples - dynamic context phlow actions' }
GtRemotePhlowListViewBasicContextActionsExamples >> scripterOnDynamicContextPhlowActionsViewInPager [
	<gtExample>
	| scripter |
	scripter := BlScripter new.
	scripter element: (GtPagerSettings usedPager
		createWrappedOn: self createTestObject gtDefaultInspectorTool).
	(scripter inspectorStep)
		scrollToTabWithName: 'Dynamic context phlow';
		clickOnTabWithName: 'Dynamic context phlow';
		assertSelectedTabWithName: 'Dynamic context phlow';
		play.
	^ scripter
]

{ #category : #'examples - dynamic phlow actions multiple selection' }
GtRemotePhlowListViewBasicContextActionsExamples >> scripterOnDynamicPhlowActionsMultipleSelectionViewInPager [
	<gtExample>
	| scripter |
	scripter := BlScripter new.
	scripter element: (GtPagerSettings usedPager
		createWrappedOn: self createTestObject gtDefaultInspectorTool).
	(scripter inspectorStep)
		scrollToTabWithName: 'Dynamic action phlow - multiple selection';
		clickOnTabWithName: 'Dynamic action phlow - multiple selection';
		assertSelectedTabWithName: 'Dynamic action phlow - multiple selection';
		play.
	^ scripter
]

{ #category : #'examples - dynamic phlow actions' }
GtRemotePhlowListViewBasicContextActionsExamples >> scripterOnDynamicPhlowActionsViewInPager [
	<gtExample>
	| scripter |
	scripter := BlScripter new.
	scripter element: (GtPagerSettings usedPager
		createWrappedOn: self createTestObject gtDefaultInspectorTool).
	(scripter inspectorStep)
		scrollToTabWithName: 'Dynamic action phlow';
		clickOnTabWithName: 'Dynamic action phlow';
		assertSelectedTabWithName: 'Dynamic action phlow';
		play.
	^ scripter
]

{ #category : #'examples - multiple selection' }
GtRemotePhlowListViewBasicContextActionsExamples >> scripterOnMultipleSelectionViewInPager [
	<gtExample>
	| scripter |
	scripter := BlScripter new.
	scripter element: (GtPagerSettings usedPager
		createWrappedOn: self createTestObject gtDefaultInspectorTool).
	(scripter inspectorStep)
		clickOnTabWithName: 'Basic - multiple selection';
		assertSelectedTabWithName: 'Basic - multiple selection';
		play.
	^ scripter
]

{ #category : #'examples - various options' }
GtRemotePhlowListViewBasicContextActionsExamples >> scripterOnVariousOptionsViewInPager [
	<gtExample>
	| scripter |
	scripter := BlScripter new.
	scripter element: (GtPagerSettings usedPager
		createWrappedOn: self createTestObject gtDefaultInspectorTool).
	(scripter inspectorStep)
		scrollToTabWithName: 'Basic actions - multiple options';
		clickOnTabWithName: 'Basic actions - multiple options';
		assertSelectedTabWithName: 'Basic actions - multiple options';
		play.
	^ scripter
]

{ #category : #'examples - various options' }
GtRemotePhlowListViewBasicContextActionsExamples >> variousOptionsContextMenuOnItem13 [
	<gtExample>
	| scripter |
	scripter := self scripterOnVariousOptionsViewInPager.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 13; index: 4';
		play.

	scripter menuStep
		assertMenuItemLabels: #('Inspect element' 'Inspect object');
		play.

	scripter assert
		label: 'Assert menu item with custom inspect ID exists';
		exists;
		onSpaceRoot;
		// BrMenuSteppedElement;
		// GtRemotePhlowExampleCustomInspectActionId;
		play.

	scripter assert
		label: 'Assert first action has an icon';
		exists;
		onSpaceRoot;
		// BrMenuSteppedElement;
		// #'menu-icon';
		play.

	scripter assert
		label: 'Assert icon action label is Inspect element';
		value: [ :anElement | anElement text asString ] equals: 'Inspect element';
		onSpaceRoot;
		// BrMenuSteppedElement;
		// BrMenuIconTextLabelElement;
		// #'menu--label';
		play.

	^ scripter
]
