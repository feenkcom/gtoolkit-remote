Class {
	#name : #GtRemotePhlowColumnedListViewBasicContextActionsExamples,
	#superclass : #Object,
	#category : #'GToolkit-RemoteGt-Examples-Inspection - Actions'
}

{ #category : #testing }
GtRemotePhlowColumnedListViewBasicContextActionsExamples class >> isAbstract [
	^ self name = #GtRemotePhlowColumnedListViewBasicContextActionsExamples
]

{ #category : #assertions }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> assertInspectedMultipleSelectionAtIndices: anArray inSecondPaneOf: aScripter [
	^ self subclassResponsibility
]

{ #category : #assertions }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> assertInspectedMultipleSelectionObjectInSecondPaneOf: aScripter [
	^ self subclassResponsibility
]

{ #category : #assertions }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> assertInspectedObjectWithValue: aValue inSecondPaneOf: aScripter [
	^ self subclassResponsibility
]

{ #category : #assertions }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> assertInspectedSelectionAtIndex: anIndex inSecondPaneOf: aScripter [
	^ self subclassResponsibility
]

{ #category : #'examples - basic' }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> contextMenuOnItem11 [
	<gtExample>
	| scripter |
	scripter := self scripterOnBasicActionsViewInPager.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 11; index: 2';
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedBasicMenuLabels;
		play.

	^ scripter
]

{ #category : #'examples - basic' }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> contextMenuOnItem13 [
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

{ #category : #examples }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> createTestObject [
	<gtExample>
	^ GtRemotePhlowColumnedListViewContextActionsBasicTestObject new
]

{ #category : #'examples - dynamic context phlow' }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> dynamicContextPhlowActionsContextMenuOnItem11 [
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

{ #category : #'examples - dynamic context phlow' }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> dynamicContextPhlowActionsContextMenuOnItem13 [
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

{ #category : #'examples - dynamic context phlow' }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> dynamicContextPhlowActionsInspectObjectOnItem13OpensNewPane [
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

{ #category : #'examples - dynamic context phlow' }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> dynamicContextPhlowActionsInspectSelectionOnItem13OpensNewPane [
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

{ #category : #'examples - dynamic context phlow multiple' }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> dynamicContextPhlowActionsMultipleSelectionContextMenuOnSingleItem [
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

{ #category : #'examples - dynamic context phlow multiple' }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> dynamicContextPhlowActionsMultipleSelectionContextMenuOnThreeItemsIncluding14 [
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

{ #category : #'examples - dynamic context phlow multiple' }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> dynamicContextPhlowActionsMultipleSelectionContextMenuOnTwoItemsIncluding14 [
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

{ #category : #'examples - dynamic context phlow multiple' }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> dynamicContextPhlowActionsMultipleSelectionInspectObjectOnSingleItem13 [
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

{ #category : #'examples - dynamic context phlow multiple' }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> dynamicContextPhlowActionsMultipleSelectionInspectSelectionOnTwoItems [
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

{ #category : #expected }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> expectedBasicMenuLabels [
	^ {'Inspect element'. 'Inspect object'. 'Inspect selection'. 'Inspect parameters'}
]

{ #category : #expected }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> expectedBasicMenuLabelsWithGreaterThan12 [
	^ self expectedBasicMenuLabels , {'Show if greater than 12'}
]

{ #category : #expected }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> expectedBasicMenuLabelsWithIncludes14 [
	^ self expectedBasicMenuLabels , {'Show if 14 in selection'}
]

{ #category : #expected }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> expectedBasicMenuLabelsWithThreeElementsAndIncludes14 [
	^ self expectedBasicMenuLabels , {'Show if 3 elements in selection'. 'Show if 14 in selection'}
]

{ #category : #expected }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> expectedDynamicMenuLabels [
	^ {'Inspect element'. 'Inspect object'. 'Inspect selection'. 'Inspect parameters'. 'Inspect outer parameters'}
]

{ #category : #expected }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> expectedDynamicMenuLabelsWithGreaterThan12 [
	^ self expectedDynamicMenuLabels , {'Show if greater than 12'}
]

{ #category : #expected }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> expectedDynamicMenuLabelsWithIncludes14 [
	^ self expectedDynamicMenuLabels , {'Show if 14 in selection'}
]

{ #category : #expected }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> expectedDynamicMenuLabelsWithThreeElementsAndIncludes14 [
	^ self expectedDynamicMenuLabels , {'Show if 3 elements in selection'. 'Show if 14 in selection'}
]

{ #category : #'examples - basic' }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> inspectObjectOnItem13OpensNewPane [
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

{ #category : #'examples - basic' }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> inspectSelectionOnItem13OpensNewPane [
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

{ #category : #'examples - multiple' }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> multipleSelectionContextMenuOnSingleItem [
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

{ #category : #'examples - multiple' }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> multipleSelectionContextMenuOnThreeItemsIncluding14 [
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

{ #category : #'examples - multiple' }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> multipleSelectionContextMenuOnTwoItemsIncluding14 [
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

{ #category : #'examples - multiple' }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> multipleSelectionInspectObjectOnSingleItem13 [
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

{ #category : #'examples - multiple' }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> multipleSelectionInspectSelectionOnTwoItems [
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

{ #category : #'examples - scripter' }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> scripterOnBasicActionsViewInPager [
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

{ #category : #'examples - scripter' }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> scripterOnDynamicContextPhlowActionsMultipleSelectionViewInPager [
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

{ #category : #'examples - scripter' }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> scripterOnDynamicContextPhlowActionsViewInPager [
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

{ #category : #'examples - scripter' }
GtRemotePhlowColumnedListViewBasicContextActionsExamples >> scripterOnMultipleSelectionViewInPager [
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
