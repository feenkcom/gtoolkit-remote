Class {
	#name : #GtRemotePhlowColumnedTreeViewBasicContextActionsExamples,
	#superclass : #Object,
	#category : #'GToolkit-RemoteGt-Examples-Inspection - Actions'
}

{ #category : #testing }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples class >> isAbstract [
	^ self name = #GtRemotePhlowColumnedTreeViewBasicContextActionsExamples
]

{ #category : #assertions }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> assertInspectedMultipleSelectionAtIndices: anArray inSecondPaneOf: aScripter [
	^ self subclassResponsibility
]

{ #category : #assertions }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> assertInspectedMultipleSelectionAtItems: anArray inSecondPaneOf: aScripter [
	^ self subclassResponsibility
]

{ #category : #assertions }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> assertInspectedMultipleSelectionObjectInSecondPaneOf: aScripter [
	^ self subclassResponsibility
]

{ #category : #assertions }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> assertInspectedObjectWithValue: aValue inSecondPaneOf: aScripter [
	^ self subclassResponsibility
]

{ #category : #assertions }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> assertInspectedSelectionAtIndex: anIndex inSecondPaneOf: aScripter [
	^ self subclassResponsibility
]

{ #category : #assertions }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> assertInspectedSelectionAtTreePath: aPath atIndex: anIndex inSecondPaneOf: aScripter [
	^ self subclassResponsibility
]

{ #category : #'examples - basic' }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> contextMenuOnItem11 [
	<gtExample>
	| scripter |
	scripter := self scripterOnBasicActionsViewInPager.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 11; index: SmallInteger - 2';
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedBasicMenuLabels;
		play.

	^ scripter
]

{ #category : #'examples - basic' }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> contextMenuOnItem13 [
	<gtExample>
	| scripter |
	scripter := self scripterOnBasicActionsViewInPager.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 13; index: SmallInteger - 4';
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedBasicMenuLabelsWithGreaterThan12;
		play.

	^ scripter
]

{ #category : #examples }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> createTestObject [
	<gtExample>
	^ GtRemotePhlowColumnedTreeViewContextActionsBasicTestObject new
]

{ #category : #'examples - dynamic context phlow' }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> dynamicContextPhlowActionsContextMenuOnItem11 [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicContextPhlowActionsViewInPager.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 11; index: SmallInteger - 2';
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedDynamicMenuLabels;
		play.

	^ scripter
]

{ #category : #'examples - dynamic context phlow' }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> dynamicContextPhlowActionsContextMenuOnItem13 [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicContextPhlowActionsViewInPager.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 13; index: SmallInteger - 4';
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedDynamicMenuLabelsWithGreaterThan12;
		play.

	^ scripter
]

{ #category : #'examples - dynamic context phlow' }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> dynamicContextPhlowActionsInspectObjectOnItem13OpensNewPane [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicContextPhlowActionsViewInPager.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 13; index: SmallInteger - 4';
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
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> dynamicContextPhlowActionsInspectSelectionOnItem13OpensNewPane [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicContextPhlowActionsViewInPager.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 13; index: SmallInteger - 4';
		play.

	scripter menuStep
		clickMenuItemWithLabel: 'Inspect selection index';
		onMenuContainer;
		play.

	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.

	self assertInspectedSelectionAtIndex: 4 inSecondPaneOf: scripter.

	^ scripter
]

{ #category : #'examples - dynamic context phlow multiple' }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> dynamicContextPhlowActionsMultipleSelectionContextMenuOnSingleItem [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicContextPhlowActionsMultipleSelectionViewInPager.

	scripter click
		onPhlowCellWithString: 'value: 11; index: SmallInteger - 2';
		play.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 11; index: SmallInteger - 2';
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedDynamicMenuLabels;
		play.

	^ scripter
]

{ #category : #'examples - dynamic context phlow multiple' }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> dynamicContextPhlowActionsMultipleSelectionContextMenuOnThreeItemsIncluding14 [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicContextPhlowActionsMultipleSelectionViewInPager.

	scripter click
		onPhlowCellWithString: 'value: 12; index: SmallInteger - 3';
		play.

	scripter click
		modifiers: BlKeyModifiers primary;
		onPhlowCellWithString: 'value: 13; index: SmallInteger - 4';
		play.

	scripter click
		modifiers: BlKeyModifiers primary;
		onPhlowCellWithString: 'value: 14; index: SmallInteger - 5';
		play.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 14; index: SmallInteger - 5';
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedDynamicMenuLabelsWithThreeElementsAndIncludes14;
		play.

	^ scripter
]

{ #category : #'examples - dynamic context phlow multiple' }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> dynamicContextPhlowActionsMultipleSelectionContextMenuOnTwoItemsIncluding14 [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicContextPhlowActionsMultipleSelectionViewInPager.

	scripter click
		onPhlowCellWithString: 'value: 13; index: SmallInteger - 4';
		play.

	scripter click
		modifiers: BlKeyModifiers primary;
		onPhlowCellWithString: 'value: 14; index: SmallInteger - 5';
		play.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 14; index: SmallInteger - 5';
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedDynamicMenuLabelsWithIncludes14;
		play.

	^ scripter
]

{ #category : #'examples - dynamic context phlow multiple' }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> dynamicContextPhlowActionsMultipleSelectionInspectObjectOnSingleItem13 [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicContextPhlowActionsMultipleSelectionViewInPager.

	scripter click
		onPhlowCellWithString: 'value: 13; index: SmallInteger - 4';
		play.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 13; index: SmallInteger - 4';
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
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> dynamicContextPhlowActionsMultipleSelectionInspectSelectionOnTwoItems [
	<gtExample>
	| scripter |
	scripter := self scripterOnDynamicContextPhlowActionsMultipleSelectionViewInPager.

	scripter click
		onPhlowCellWithString: 'value: 13; index: SmallInteger - 4';
		play.

	scripter click
		modifiers: BlKeyModifiers primary;
		onPhlowCellWithString: 'value: 14; index: SmallInteger - 5';
		play.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 14; index: SmallInteger - 5';
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

{ #category : #'examples - expanded tree' }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> expandedChildCellText [
	^ self subclassResponsibility
]

{ #category : #'examples - expanded tree' }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> expandedTreeContextMenuOnExpandedChild [
	<gtExample>
	| scripter |
	scripter := self scripterWithExpandedTreeOnBasicActionsViewInPager.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: self expandedChildCellText;
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedBasicMenuLabels;
		onMenuContainer;
		play.

	^ scripter
]

{ #category : #'examples - actions' }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> expandedTreeInspectSelectionOnExpandedChild [
	<gtExample>
	| scripter |
	scripter := self scripterWithExpandedTreeOnBasicActionsViewInPager.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: self expandedChildCellText;
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

{ #category : #'examples - actions' }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> expandedTreeMultipleSelectionContextMenuOnRootAndExpandedChild [
	<gtExample>
	| scripter |
	scripter := self scripterWithExpandedTreeOnMultipleSelectionViewInPager.

	scripter click
		onPhlowCellWithString: 'value: 13; index: SmallInteger - 4';
		play.

	scripter click
		modifiers: BlKeyModifiers primary;
		onPhlowCellWithString: self expandedChildCellText;
		play.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: self expandedChildCellText;
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedBasicMenuLabels;
		onMenuContainer;
		play.

	^ scripter
]

{ #category : #'examples - actions' }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> expandedTreeMultipleSelectionInspectOnRootAndExpandedChild [
	<gtExample>
	| scripter |
	scripter := self scripterWithExpandedTreeOnMultipleSelectionViewInPager.

	scripter click
		onPhlowCellWithString: 'value: 13; index: SmallInteger - 4';
		play.

	scripter click
		modifiers: BlKeyModifiers primary;
		onPhlowCellWithString: self expandedChildCellText;
		play.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: self expandedChildCellText;
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
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> expectedBasicMenuLabels [
	^ {'Inspect element'. 'Inspect object'. 'Inspect selection'. 'Inspect parameters'}
]

{ #category : #expected }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> expectedBasicMenuLabelsWithGreaterThan12 [
	^ self expectedBasicMenuLabels , {'Show if greater than 12'}
]

{ #category : #expected }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> expectedBasicMenuLabelsWithIncludes14 [
	^ self expectedBasicMenuLabels , {'Show if 14 in selection'}
]

{ #category : #expected }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> expectedBasicMenuLabelsWithThreeElementsAndIncludes14 [
	^ self expectedBasicMenuLabels , {'Show if 3 elements in selection'. 'Show if 14 in selection'}
]

{ #category : #accessing }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> expectedDynamicMenuLabels [
	^ {'Inspect element'. 'Inspect object'. 'Inspect selection'. 'Inspect parameters'. 'Inspect outer parameters'}
]

{ #category : #expected }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> expectedDynamicMenuLabelsWithGreaterThan12 [
	^ self expectedDynamicMenuLabels , {'Show if greater than 12'}
]

{ #category : #expected }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> expectedDynamicMenuLabelsWithIncludes14 [
	^ self expectedDynamicMenuLabels , {'Show if 14 in selection'}
]

{ #category : #expected }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> expectedDynamicMenuLabelsWithThreeElementsAndIncludes14 [
	^ self expectedDynamicMenuLabels , {'Show if 3 elements in selection'. 'Show if 14 in selection'}
]

{ #category : #'examples - basic' }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> inspectObjectOnItem13OpensNewPane [
	<gtExample>
	| scripter |
	scripter := self scripterOnBasicActionsViewInPager.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 13; index: SmallInteger - 4';
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

{ #category : #'examples - actions' }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> inspectSelectionOnItem13OpensNewPane [
	<gtExample>
	| scripter |
	scripter := self scripterOnBasicActionsViewInPager.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 13; index: SmallInteger - 4';
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
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> multipleSelectionContextMenuOnSingleItem [
	<gtExample>
	| scripter |
	scripter := self scripterOnMultipleSelectionViewInPager.

	scripter click
		onPhlowCellWithString: 'value: 11; index: SmallInteger - 2';
		play.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 11; index: SmallInteger - 2';
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedBasicMenuLabels;
		play.

	^ scripter
]

{ #category : #'examples - multiple' }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> multipleSelectionContextMenuOnThreeItemsIncluding14 [
	<gtExample>
	| scripter |
	scripter := self scripterOnMultipleSelectionViewInPager.

	scripter click
		onPhlowCellWithString: 'value: 12; index: SmallInteger - 3';
		play.

	scripter click
		modifiers: BlKeyModifiers primary;
		onPhlowCellWithString: 'value: 13; index: SmallInteger - 4';
		play.

	scripter click
		modifiers: BlKeyModifiers primary;
		onPhlowCellWithString: 'value: 14; index: SmallInteger - 5';
		play.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 14; index: SmallInteger - 5';
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedBasicMenuLabelsWithThreeElementsAndIncludes14;
		play.

	^ scripter
]

{ #category : #'examples - multiple' }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> multipleSelectionContextMenuOnTwoItemsIncluding14 [
	<gtExample>
	| scripter |
	scripter := self scripterOnMultipleSelectionViewInPager.

	scripter click
		onPhlowCellWithString: 'value: 13; index: SmallInteger - 4';
		play.

	scripter click
		modifiers: BlKeyModifiers primary;
		onPhlowCellWithString: 'value: 14; index: SmallInteger - 5';
		play.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 14; index: SmallInteger - 5';
		play.

	scripter menuStep
		assertMenuItemLabels: self expectedBasicMenuLabelsWithIncludes14;
		play.

	^ scripter
]

{ #category : #'examples - multiple' }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> multipleSelectionInspectObjectOnSingleItem13 [
	<gtExample>
	| scripter |
	scripter := self scripterOnMultipleSelectionViewInPager.

	scripter click
		onPhlowCellWithString: 'value: 13; index: SmallInteger - 4';
		play.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 13; index: SmallInteger - 4';
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

{ #category : #'examples - actions' }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> multipleSelectionInspectSelectionOnTwoItems [
	<gtExample>
	| scripter |
	scripter := self scripterOnMultipleSelectionViewInPager.

	scripter click
		onPhlowCellWithString: 'value: 13; index: SmallInteger - 4';
		play.

	scripter click
		modifiers: BlKeyModifiers primary;
		onPhlowCellWithString: 'value: 14; index: SmallInteger - 5';
		play.

	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'value: 14; index: SmallInteger - 5';
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
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> scripterOnBasicActionsViewInPager [
	<gtExample>
	| scripter |
	scripter := BlScripter new.
	scripter element: (GtPagerSettings usedPager
		createWrappedOn: self createTestObject gtDefaultInspectorTool).
	(scripter inspectorStep)
		clickOnTabWithName: 'Columned Tree - Basic actions';
		assertSelectedTabWithName: 'Columned Tree - Basic actions';
		play.
	^ scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> scripterOnDynamicContextPhlowActionsMultipleSelectionViewInPager [
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
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> scripterOnDynamicContextPhlowActionsViewInPager [
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
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> scripterOnMultipleSelectionViewInPager [
	<gtExample>
	| scripter |
	scripter := BlScripter new.
	scripter element: (GtPagerSettings usedPager
		createWrappedOn: self createTestObject gtDefaultInspectorTool).
	(scripter inspectorStep)
		clickOnTabWithName: 'Columned Tree - Multiple Selection';
		assertSelectedTabWithName: 'Columned Tree - Multiple Selection';
		play.
	^ scripter
]

{ #category : #'examples - expanded tree' }
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> scripterWithExpandedTreeOnBasicActionsViewInPager [
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
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> scripterWithExpandedTreeOnMultipleSelectionViewInPager [
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
GtRemotePhlowColumnedTreeViewBasicContextActionsExamples >> treeElementClass [
	^ BrColumnedTree
]
