Class {
	#name : #GtRemotePhlowTreeViewBasicContextActionsExamples,
	#superclass : #Object,
	#category : #'GToolkit-RemoteGt-Examples-Inspection - Actions'
}

{ #category : #testing }
GtRemotePhlowTreeViewBasicContextActionsExamples class >> isAbstract [
	^ self name = #GtRemotePhlowTreeViewBasicContextActionsExamples
]

{ #category : #assertions }
GtRemotePhlowTreeViewBasicContextActionsExamples >> assertInspectedMultipleSelectionAtItems: anArray inSecondPaneOf: aScripter [
	^ self subclassResponsibility
]

{ #category : #assertions }
GtRemotePhlowTreeViewBasicContextActionsExamples >> assertInspectedMultipleSelectionObjectInSecondPaneOf: aScripter [
	^ self subclassResponsibility
]

{ #category : #assertions }
GtRemotePhlowTreeViewBasicContextActionsExamples >> assertInspectedObjectWithValue: aValue inSecondPaneOf: aScripter [
	^ self subclassResponsibility
]

{ #category : #assertions }
GtRemotePhlowTreeViewBasicContextActionsExamples >> assertInspectedSelectionAtTreePath: aPath atIndex: anIndex inSecondPaneOf: aScripter [
	^ self subclassResponsibility
]

{ #category : #examples }
GtRemotePhlowTreeViewBasicContextActionsExamples >> contextMenuOnItem11 [
	<gtExample>
	| scripter |
	scripter := self scripterOnBasicActionsViewInPager.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 11';
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedBasicMenuLabels;
		play.

	^ scripter
]

{ #category : #examples }
GtRemotePhlowTreeViewBasicContextActionsExamples >> contextMenuOnItem13 [
	<gtExample>
	| scripter |
	scripter := self scripterOnBasicActionsViewInPager.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 13';
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedBasicMenuLabelsWithGreaterThan12;
		play.

	^ scripter
]

{ #category : #examples }
GtRemotePhlowTreeViewBasicContextActionsExamples >> createTestObject [
	<gtExample>
	^ GtRemotePhlowTreeViewContextActionsBasicTestObject new
]

{ #category : #examples }
GtRemotePhlowTreeViewBasicContextActionsExamples >> dynamicContextPhlowActionsContextMenuOnItem11 [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicContextPhlowActionsViewInPager.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 11';
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedDynamicMenuLabels;
		play.

	^ scripter
]

{ #category : #examples }
GtRemotePhlowTreeViewBasicContextActionsExamples >> dynamicContextPhlowActionsContextMenuOnItem13 [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicContextPhlowActionsViewInPager.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 13';
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedDynamicMenuLabelsWithGreaterThan12;
		play.

	^ scripter
]

{ #category : #examples }
GtRemotePhlowTreeViewBasicContextActionsExamples >> dynamicContextPhlowActionsInspectObjectOnItem13OpensNewPane [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicContextPhlowActionsViewInPager.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 13';
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
GtRemotePhlowTreeViewBasicContextActionsExamples >> dynamicContextPhlowActionsInspectSelectionOnItem13OpensNewPane [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicContextPhlowActionsViewInPager.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 13';
		play.

	scripter menuStep
		clickMenuItemWithLabel: 'Inspect selection';
		onMenuContainer;
		play.

	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.

	self
		assertInspectedSelectionAtTreePath: #(4)
		atIndex: 4
		inSecondPaneOf: scripter.

	^ scripter
]

{ #category : #examples }
GtRemotePhlowTreeViewBasicContextActionsExamples >> dynamicContextPhlowActionsMultipleSelectionContextMenuOnSingleItem [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicContextPhlowActionsMultipleSelectionViewInPager.

	scripter click
		onPhlowCellWithString: 'value: 11';
		play.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 11';
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedDynamicMenuLabels;
		play.

	^ scripter
]

{ #category : #examples }
GtRemotePhlowTreeViewBasicContextActionsExamples >> dynamicContextPhlowActionsMultipleSelectionContextMenuOnThreeItemsIncluding14 [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicContextPhlowActionsMultipleSelectionViewInPager.

	scripter click
		onPhlowCellWithString: 'value: 12';
		play.

	scripter click
		modifiers: BlKeyModifiers primary;
		onPhlowCellWithString: 'value: 13';
		play.

	scripter click
		modifiers: BlKeyModifiers primary;
		onPhlowCellWithString: 'value: 14';
		play.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 14';
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedDynamicMenuLabelsWithThreeElementsAndIncludes14;
		play.

	^ scripter
]

{ #category : #examples }
GtRemotePhlowTreeViewBasicContextActionsExamples >> dynamicContextPhlowActionsMultipleSelectionContextMenuOnTwoItemsIncluding14 [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicContextPhlowActionsMultipleSelectionViewInPager.

	scripter click
		onPhlowCellWithString: 'value: 13';
		play.

	scripter click
		modifiers: BlKeyModifiers primary;
		onPhlowCellWithString: 'value: 14';
		play.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 14';
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedDynamicMenuLabelsWithIncludes14;
		play.

	^ scripter
]

{ #category : #examples }
GtRemotePhlowTreeViewBasicContextActionsExamples >> dynamicContextPhlowActionsMultipleSelectionInspectObjectOnSingleItem13 [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicContextPhlowActionsMultipleSelectionViewInPager.

	scripter click
		onPhlowCellWithString: 'value: 13';
		play.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 13';
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

{ #category : #examples }
GtRemotePhlowTreeViewBasicContextActionsExamples >> dynamicContextPhlowActionsMultipleSelectionInspectSelectionOnTwoItems [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicContextPhlowActionsMultipleSelectionViewInPager.

	scripter click
		onPhlowCellWithString: 'value: 13';
		play.

	scripter click
		modifiers: BlKeyModifiers primary;
		onPhlowCellWithString: 'value: 14';
		play.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 14';
		play.

	scripter menuStep
		clickMenuItemWithLabel: 'Inspect selection';
		onMenuContainer;
		play.

	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.

	self
		assertInspectedMultipleSelectionAtItems: {
			{#(4). 4}.
			{#(5). 5}}
		inSecondPaneOf: scripter.

	^ scripter
]

{ #category : #accessing }
GtRemotePhlowTreeViewBasicContextActionsExamples >> expandedChildCellText [
	^ 'value: 11'
]

{ #category : #'examples - tree' }
GtRemotePhlowTreeViewBasicContextActionsExamples >> expandedTreeContextMenuOnExpandedChild [
	<gtExample>
	| scripter |
	scripter := self scripterWithExpandedTreeOnBasicActionsViewInPager.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: self expandedChildCellText index: 2;
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedBasicMenuLabels;
		onMenuContainer;
		play.

	^ scripter
]

{ #category : #'examples - tree' }
GtRemotePhlowTreeViewBasicContextActionsExamples >> expandedTreeInspectSelectionOnExpandedChild [
	<gtExample>
	| scripter |
	scripter := self scripterWithExpandedTreeOnBasicActionsViewInPager.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: self expandedChildCellText index: 2;
		play.

	scripter menuStep
		clickMenuItemWithLabel: 'Inspect selection';
		onMenuContainer;
		play.

	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.

	self 
		assertInspectedSelectionAtTreePath: #(4 1) 
		atIndex: 5 
		inSecondPaneOf: scripter.

	^ scripter
]

{ #category : #'examples - tree' }
GtRemotePhlowTreeViewBasicContextActionsExamples >> expandedTreeMultipleSelectionContextMenuOnRootAndExpandedChild [
	<gtExample>
	| scripter |
	scripter := self scripterWithExpandedTreeOnMultipleSelectionViewInPager.

	scripter click
		onPhlowCellWithString: 'value: 13';
		play.

	scripter click
		modifiers: BlKeyModifiers primary;
		onPhlowCellWithString: self expandedChildCellText index: 2;
		play.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: self expandedChildCellText index: 2;
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedBasicMenuLabels;
		onMenuContainer;
		play.

	^ scripter
]

{ #category : #'examples - tree' }
GtRemotePhlowTreeViewBasicContextActionsExamples >> expandedTreeMultipleSelectionInspectOnRootAndExpandedChild [
	<gtExample>
	| scripter |
	scripter := self scripterWithExpandedTreeOnMultipleSelectionViewInPager.

	scripter click
		onPhlowCellWithString: 'value: 13';
		play.

	scripter click
		modifiers: BlKeyModifiers primary;
		onPhlowCellWithString: self expandedChildCellText index: 2;
		play.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: self expandedChildCellText index: 2;
		play.

	scripter menuStep
		clickMenuItemWithLabel: 'Inspect selection';
		onMenuContainer;
		play.

	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.

	self
		assertInspectedMultipleSelectionAtItems: {
			{#(4). 4}.
			{#(4 1). 5}}
		inSecondPaneOf: scripter.

	^ scripter
]

{ #category : #accessing }
GtRemotePhlowTreeViewBasicContextActionsExamples >> expectedBasicMenuLabels [
	^ {'Inspect element'. 'Inspect object'. 'Inspect selection'. 'Inspect parameters'}
]

{ #category : #expected }
GtRemotePhlowTreeViewBasicContextActionsExamples >> expectedBasicMenuLabelsWithGreaterThan12 [
	^ self expectedBasicMenuLabels , {'Show if greater than 12'}
]

{ #category : #expected }
GtRemotePhlowTreeViewBasicContextActionsExamples >> expectedBasicMenuLabelsWithIncludes14 [
	^ self expectedBasicMenuLabels , {'Show if 14 in selection'}
]

{ #category : #expected }
GtRemotePhlowTreeViewBasicContextActionsExamples >> expectedBasicMenuLabelsWithThreeElementsAndIncludes14 [
	^ self expectedBasicMenuLabels , {'Show if 3 elements in selection'. 'Show if 14 in selection'}
]

{ #category : #accessing }
GtRemotePhlowTreeViewBasicContextActionsExamples >> expectedDynamicMenuLabels [
	^ {'Inspect element'. 'Inspect object'. 'Inspect selection'. 'Inspect parameters'. 'Inspect outer parameters'}
]

{ #category : #expected }
GtRemotePhlowTreeViewBasicContextActionsExamples >> expectedDynamicMenuLabelsWithGreaterThan12 [
	^ self expectedDynamicMenuLabels , {'Show if greater than 12'}
]

{ #category : #expected }
GtRemotePhlowTreeViewBasicContextActionsExamples >> expectedDynamicMenuLabelsWithIncludes14 [
	^ self expectedDynamicMenuLabels , {'Show if 14 in selection'}
]

{ #category : #expected }
GtRemotePhlowTreeViewBasicContextActionsExamples >> expectedDynamicMenuLabelsWithThreeElementsAndIncludes14 [
	^ self expectedDynamicMenuLabels , {'Show if 3 elements in selection'. 'Show if 14 in selection'}
]

{ #category : #examples }
GtRemotePhlowTreeViewBasicContextActionsExamples >> inspectObjectOnItem13OpensNewPane [
	<gtExample>
	| scripter |
	scripter := self scripterOnBasicActionsViewInPager.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 13';
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
GtRemotePhlowTreeViewBasicContextActionsExamples >> inspectSelectionOnItem13OpensNewPane [
	<gtExample>
	| scripter |
	scripter := self scripterOnBasicActionsViewInPager.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 13';
		play.

	scripter menuStep
		clickMenuItemWithLabel: 'Inspect selection';
		onMenuContainer;
		play.

	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.

	self
		assertInspectedSelectionAtTreePath: #(4)
		atIndex: 4
		inSecondPaneOf: scripter.

	^ scripter
]

{ #category : #examples }
GtRemotePhlowTreeViewBasicContextActionsExamples >> multipleSelectionContextMenuOnSingleItem [
	<gtExample>
	| scripter |
	scripter := self scripterOnMultipleSelectionViewInPager.

	scripter click
		onPhlowCellWithString: 'value: 11';
		play.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 11';
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedBasicMenuLabels;
		play.

	^ scripter
]

{ #category : #examples }
GtRemotePhlowTreeViewBasicContextActionsExamples >> multipleSelectionContextMenuOnThreeItemsIncluding14 [
	<gtExample>
	| scripter |
	scripter := self scripterOnMultipleSelectionViewInPager.

	scripter click
		onPhlowCellWithString: 'value: 12';
		play.

	scripter click
		modifiers: BlKeyModifiers primary;
		onPhlowCellWithString: 'value: 13';
		play.

	scripter click
		modifiers: BlKeyModifiers primary;
		onPhlowCellWithString: 'value: 14';
		play.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 14';
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedBasicMenuLabelsWithThreeElementsAndIncludes14;
		play.

	^ scripter
]

{ #category : #examples }
GtRemotePhlowTreeViewBasicContextActionsExamples >> multipleSelectionContextMenuOnTwoItemsIncluding14 [
	<gtExample>
	| scripter |
	scripter := self scripterOnMultipleSelectionViewInPager.

	scripter click
		onPhlowCellWithString: 'value: 13';
		play.

	scripter click
		modifiers: BlKeyModifiers primary;
		onPhlowCellWithString: 'value: 14';
		play.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 14';
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedBasicMenuLabelsWithIncludes14;
		play.

	^ scripter
]

{ #category : #examples }
GtRemotePhlowTreeViewBasicContextActionsExamples >> multipleSelectionInspectObjectOnSingleItem13 [
	<gtExample>
	| scripter |
	scripter := self scripterOnMultipleSelectionViewInPager.

	scripter click
		onPhlowCellWithString: 'value: 13';
		play.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 13';
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

{ #category : #examples }
GtRemotePhlowTreeViewBasicContextActionsExamples >> multipleSelectionInspectSelectionOnTwoItems [
	<gtExample>
	| scripter |
	scripter := self scripterOnMultipleSelectionViewInPager.

	scripter click
		onPhlowCellWithString: 'value: 13';
		play.

	scripter click
		modifiers: BlKeyModifiers primary;
		onPhlowCellWithString: 'value: 14';
		play.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 14';
		play.

	scripter menuStep
		clickMenuItemWithLabel: 'Inspect selection';
		onMenuContainer;
		play.

	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.

	self
		assertInspectedMultipleSelectionAtItems: {
			{#(4). 4}.
			{#(5). 5}}
		inSecondPaneOf: scripter.

	^ scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowTreeViewBasicContextActionsExamples >> scripterOnBasicActionsViewInPager [
	<gtExample>
	| scripter |
	scripter := BlScripter new.
	scripter element: (GtPagerSettings usedPager
		createWrappedOn: self createTestObject gtDefaultInspectorTool).
	(scripter inspectorStep)
		clickOnTabWithName: 'Tree - Basic actions';
		assertSelectedTabWithName: 'Tree - Basic actions';
		play.
	^ scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowTreeViewBasicContextActionsExamples >> scripterOnDynamicContextPhlowActionsMultipleSelectionViewInPager [
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
GtRemotePhlowTreeViewBasicContextActionsExamples >> scripterOnDynamicContextPhlowActionsViewInPager [
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
GtRemotePhlowTreeViewBasicContextActionsExamples >> scripterOnMultipleSelectionViewInPager [
	<gtExample>
	| scripter |
	scripter := BlScripter new.
	scripter element: (GtPagerSettings usedPager
		createWrappedOn: self createTestObject gtDefaultInspectorTool).
	(scripter inspectorStep)
		clickOnTabWithName: 'Tree - Multiple Selection';
		assertSelectedTabWithName: 'Tree - Multiple Selection';
		play.
	^ scripter
]

{ #category : #'examples - expanded tree' }
GtRemotePhlowTreeViewBasicContextActionsExamples >> scripterWithExpandedTreeOnBasicActionsViewInPager [
	<gtExample>
	| scripter |
	scripter := self scripterOnBasicActionsViewInPager.

	scripter clickStep: [ :s |
		s
			label: 'Expand item 13';
			onPagerToolInPaneWithIndex: 1;
			// GtInspectorContentElement;
			// self treeElementClass;
			onChildAt: 1;
			onChildAt: 4;
			id: #toggle ].

	scripter clickStep: [ :s |
		s
			label: 'Expand child 11';
			onPagerToolInPaneWithIndex: 1;
			// GtInspectorContentElement;
			// self treeElementClass;
			onChildAt: 1;
			onChildAt: 5;
			id: #toggle ].

	^ scripter
]

{ #category : #'examples - setup' }
GtRemotePhlowTreeViewBasicContextActionsExamples >> scripterWithExpandedTreeOnMultipleSelectionViewInPager [
	<gtExample>
	| scripter |
	scripter := self scripterOnMultipleSelectionViewInPager.

	scripter clickStep: [ :s |
		s
			label: 'Expand item 13';
			onPagerToolInPaneWithIndex: 1;
			// GtInspectorContentElement;
			// self treeElementClass;
			onChildAt: 1;
			onChildAt: 4;
			id: #toggle ].

	scripter clickStep: [ :s |
		s
			label: 'Expand child 11';
			onPagerToolInPaneWithIndex: 1;
			// GtInspectorContentElement;
			// self treeElementClass;
			onChildAt: 1;
			onChildAt: 5;
			id: #toggle ].

	^ scripter
]

{ #category : #accessing }
GtRemotePhlowTreeViewBasicContextActionsExamples >> treeElementClass [
	^ BrSimpleTree
]
