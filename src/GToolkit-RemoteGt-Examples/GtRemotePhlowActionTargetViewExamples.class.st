Class {
	#name : #GtRemotePhlowActionTargetViewExamples,
	#superclass : #Object,
	#category : #'GToolkit-RemoteGt-Examples-Inspection - Actions'
}

{ #category : #testing }
GtRemotePhlowActionTargetViewExamples class >> isAbstract [
	^ self = GtRemotePhlowActionTargetViewExamples
]

{ #category : #asserting }
GtRemotePhlowActionTargetViewExamples >> assertInspectedGroupItemsWithSize: aSize inSecondPaneOf: aScripter [
	(aScripter inspectorStep)
		onPagerPaneWithIndex: 2;
		assertInspectedObjectOfType: Array;
		assertInspectedObjectValueFor: [ :arr | arr size ] equals: [ aSize ];
		play.
]

{ #category : #asserting }
GtRemotePhlowActionTargetViewExamples >> assertInspectedGroupWithSize: aSize inSecondPaneOf: aScripter [
	(aScripter inspectorStep)
		onPagerPaneWithIndex: 2;
		assertInspectedObjectOfType: GtRemotePhlowActionTargetTestItemGroup;
		assertInspectedObjectValueFor: [ :group | group items size ] equals: [ aSize ];
		play.
]

{ #category : #asserting }
GtRemotePhlowActionTargetViewExamples >> assertInspectedItemWithLabel: aLabel value: aValue inSecondPaneOf: aScripter [
	(aScripter inspectorStep)
		onPagerPaneWithIndex: 2;
		assertInspectedObjectOfType: GtRemotePhlowActionTargetTestItem;
		assertInspectedObjectValueFor: [ :item | item label ] equals: [ aLabel ];
		assertInspectedObjectValueFor: [ :item | item value ] equals: [ aValue ];
		play.
]

{ #category : #asserting }
GtRemotePhlowActionTargetViewExamples >> assertInspectedPrintStringEquals: aString inSecondPaneOf: aScripter [
	(aScripter inspectorStep)
		onPagerPaneWithIndex: 2;
		assertInspectedObjectOfType: ByteString;
		assertInspectedObjectValueFor: [ :s | s ] equals: [ aString ];
		play.
]

{ #category : #asserting }
GtRemotePhlowActionTargetViewExamples >> assertInspectedValueEquals: aValue inSecondPaneOf: aScripter [
	(aScripter inspectorStep)
		onPagerPaneWithIndex: 2;
		assertInspectedObjectOfType: SmallInteger;
		assertInspectedObjectValueFor: [ :v | v ] equals: [ aValue ];
		play.
]

{ #category : #'examples - columned list' }
GtRemotePhlowActionTargetViewExamples >> columnedListContextMenuOnDelta [
	<gtExample>
	| scripter |
	scripter := self scripterOnColumnedListViewInPager.
	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'Delta';
		play.
	scripter menuStep
		assertMenuItemLabels: self expectedSingleItemMenuLabels;
		play.
	^ scripter
]

{ #category : #'examples - columned list' }
GtRemotePhlowActionTargetViewExamples >> columnedListInspectItemOnDelta [
	<gtExample>
	| scripter |
	scripter := self scripterOnColumnedListViewInPager.
	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'Delta';
		play.
	scripter menuStep
		clickMenuItemWithId: GtRemotePhlowExampleInspectItemActionId new;
		onMenuContainer;
		play.
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
	self assertInspectedItemWithLabel: 'Delta' value: 4 inSecondPaneOf: scripter.
	^ scripter
]

{ #category : #'examples - columned list' }
GtRemotePhlowActionTargetViewExamples >> columnedListMultipleSelectionContextMenuOnTwoItems [
	<gtExample>
	| scripter |
	scripter := self scripterOnColumnedListMultipleSelectionViewInPager.
	scripter click
		onPhlowCellWithString: 'Delta';
		play.
	scripter click
		modifiers: BlKeyModifiers primary;
		onPhlowCellWithString: 'Epsilon';
		play.
	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'Epsilon';
		play.
	scripter menuStep
		assertMenuItemLabels: self expectedGroupMenuLabelsForTwoItems;
		play.
	^ scripter
]

{ #category : #'examples - columned list' }
GtRemotePhlowActionTargetViewExamples >> columnedListMultipleSelectionInspectGroup [
	<gtExample>
	| scripter |
	scripter := self scripterOnColumnedListMultipleSelectionViewInPager.
	scripter click
		onPhlowCellWithString: 'Delta';
		play.
	scripter click
		modifiers: BlKeyModifiers primary;
		onPhlowCellWithString: 'Epsilon';
		play.
	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'Epsilon';
		play.
	scripter menuStep
		clickMenuItemWithLabel: 'Inspect group';
		onMenuContainer;
		play.
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
	self assertInspectedGroupWithSize: 2 inSecondPaneOf: scripter.
	^ scripter
]

{ #category : #accessing }
GtRemotePhlowActionTargetViewExamples >> columnedListMultipleSelectionViewTabName [
	^ 'Columned list - multiple selection'
]

{ #category : #accessing }
GtRemotePhlowActionTargetViewExamples >> columnedListViewTabName [
	^ 'Columned list'
]

{ #category : #'examples - columned tree' }
GtRemotePhlowActionTargetViewExamples >> columnedTreeContextMenuOnAlpha1 [
	<gtExample>
	| scripter |
	scripter := self scripterOnColumnedTreeViewInPager.
	self expandAlphaInTreeScripter: scripter treeClass: BrColumnedTree.
	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'Alpha-1';
		play.
	scripter menuStep
		assertMenuItemLabels: self expectedChildItemMenuLabels;
		play.
	^ scripter
]

{ #category : #'examples - columned tree' }
GtRemotePhlowActionTargetViewExamples >> columnedTreeContextMenuOnDelta [
	<gtExample>
	| scripter |
	scripter := self scripterOnColumnedTreeViewInPager.
	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'Delta';
		play.
	scripter menuStep
		assertMenuItemLabels: self expectedSingleItemMenuLabels;
		play.
	^ scripter
]

{ #category : #'examples - columned tree' }
GtRemotePhlowActionTargetViewExamples >> columnedTreeInspectItemOnAlpha1 [
	<gtExample>
	| scripter |
	scripter := self scripterOnColumnedTreeViewInPager.
	self expandAlphaInTreeScripter: scripter treeClass: BrColumnedTree.
	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'Alpha-1';
		play.
	scripter menuStep
		clickMenuItemWithId: GtRemotePhlowExampleInspectItemActionId new;
		onMenuContainer;
		play.
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
	self assertInspectedItemWithLabel: 'Alpha-1' value: 11 inSecondPaneOf: scripter.
	^ scripter
]

{ #category : #'examples - columned tree' }
GtRemotePhlowActionTargetViewExamples >> columnedTreeInspectItemOnDelta [
	<gtExample>
	| scripter |
	scripter := self scripterOnColumnedTreeViewInPager.
	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'Delta';
		play.
	scripter menuStep
		clickMenuItemWithId: GtRemotePhlowExampleInspectItemActionId new;
		onMenuContainer;
		play.
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
	self assertInspectedItemWithLabel: 'Delta' value: 4 inSecondPaneOf: scripter.
	^ scripter
]

{ #category : #'examples - columned tree' }
GtRemotePhlowActionTargetViewExamples >> columnedTreeMultipleSelectionContextMenuOnTwoItems [
	<gtExample>
	| scripter |
	scripter := self scripterOnColumnedTreeMultipleSelectionViewInPager.
	scripter click
		onPhlowCellWithString: 'Delta';
		play.
	scripter click
		modifiers: BlKeyModifiers primary;
		onPhlowCellWithString: 'Epsilon';
		play.
	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'Epsilon';
		play.
	scripter menuStep
		assertMenuItemLabels: self expectedGroupMenuLabelsForTwoItems;
		play.
	^ scripter
]

{ #category : #'examples - columned tree' }
GtRemotePhlowActionTargetViewExamples >> columnedTreeMultipleSelectionInspectGroup [
	<gtExample>
	| scripter |
	scripter := self scripterOnColumnedTreeMultipleSelectionViewInPager.
	scripter click
		onPhlowCellWithString: 'Delta';
		play.
	scripter click
		modifiers: BlKeyModifiers primary;
		onPhlowCellWithString: 'Epsilon';
		play.
	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'Epsilon';
		play.
	scripter menuStep
		clickMenuItemWithLabel: 'Inspect group';
		onMenuContainer;
		play.
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
	self assertInspectedGroupWithSize: 2 inSecondPaneOf: scripter.
	^ scripter
]

{ #category : #accessing }
GtRemotePhlowActionTargetViewExamples >> columnedTreeMultipleSelectionViewTabName [
	^ 'Columned tree - multiple selection'
]

{ #category : #accessing }
GtRemotePhlowActionTargetViewExamples >> columnedTreeViewTabName [
	^ 'Columned tree'
]

{ #category : #private }
GtRemotePhlowActionTargetViewExamples >> createScripterOnTabNamed: aTabName [
	| scripter |
	scripter := BlScripter new.
	scripter element: (GtPagerSettings usedPager
		createWrappedOn: self createTestObject gtDefaultInspectorTool).
	(scripter inspectorStep)
		scrollToTabWithName: aTabName;
		play.
	(scripter inspectorStep)
		clickOnTabWithName: aTabName;
		assertSelectedTabWithName: aTabName;
		play.
	^ scripter
]

{ #category : #accessing }
GtRemotePhlowActionTargetViewExamples >> createTestObject [
	^ self subclassResponsibility
]

{ #category : #private }
GtRemotePhlowActionTargetViewExamples >> expandAlphaInTreeScripter: scripter treeClass: aTreeClass [
	scripter clickStep: [ :s |
		s
			label: 'Expand Alpha';
			onPagerToolInPaneWithIndex: 1;
			// GtInspectorContentElement;
			// aTreeClass;
			onChildAt: 1;
			onChildAt: 1;
			id: #toggle ]
]

{ #category : #accessing }
GtRemotePhlowActionTargetViewExamples >> expectedChildItemMenuLabels [
	^ {'Inspect item'. 'Inspect value 11'. 'Disabled action'. 'Copy label Alpha-1'. 'Basic action'. 'Print item (Alpha-1: 11)'. 'Print label Alpha-1'}
]

{ #category : #accessing }
GtRemotePhlowActionTargetViewExamples >> expectedGroupMenuLabelsForTwoItems [
	^ {'Inspect group'. 'Inspect group items 2 items'. 'Disabled group action'. 'Basic group action'. 'Print group Group(2 items)'}
]

{ #category : #accessing }
GtRemotePhlowActionTargetViewExamples >> expectedSingleItemMenuLabels [
	^ {'Inspect item'. 'Inspect value 4'. 'Disabled action'. 'Copy label Delta'. 'Basic action'. 'Print item (Delta: 4)'. 'Print label Delta'}
]

{ #category : #'examples - list' }
GtRemotePhlowActionTargetViewExamples >> listContextMenuOnDelta [
	<gtExample>
	| scripter |
	scripter := self scripterOnListViewInPager.
	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'Delta';
		play.
	scripter menuStep
		assertMenuItemLabels: self expectedSingleItemMenuLabels;
		play.
	^ scripter
]

{ #category : #'examples - list' }
GtRemotePhlowActionTargetViewExamples >> listCopyLabelOnDelta [
	<gtExample>
	| scripter |
	scripter := self scripterOnListViewInPager.
	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'Delta';
		play.
	scripter menuStep
		clickMenuItemWithId: GtRemotePhlowExampleCopyLabelActionId new;
		onMenuContainer;
		play.
	(scripter treePager)
		assertNumberOfPaneElements: 1;
		play.
	self assert: GtClipboard default clipboardText asString equals: 'Delta'.
	^ scripter
]

{ #category : #'examples - list' }
GtRemotePhlowActionTargetViewExamples >> listInspectItemOnDelta [
	<gtExample>
	| scripter |
	scripter := self scripterOnListViewInPager.
	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'Delta';
		play.
	scripter menuStep
		clickMenuItemWithId: GtRemotePhlowExampleInspectItemActionId new;
		onMenuContainer;
		play.
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
	self assertInspectedItemWithLabel: 'Delta' value: 4 inSecondPaneOf: scripter.
	^ scripter
]

{ #category : #'examples - list' }
GtRemotePhlowActionTargetViewExamples >> listInspectValueOnDelta [
	<gtExample>
	| scripter |
	scripter := self scripterOnListViewInPager.
	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'Delta';
		play.
	scripter menuStep
		clickMenuItemWithLabel: 'Inspect value 4';
		onMenuContainer;
		play.
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
	self assertInspectedValueEquals: 4 inSecondPaneOf: scripter.
	^ scripter
]

{ #category : #'examples - list' }
GtRemotePhlowActionTargetViewExamples >> listMultipleSelectionContextMenuOnSingleItem [
	<gtExample>
	| scripter |
	scripter := self scripterOnListMultipleSelectionViewInPager.
	scripter click
		onPhlowCellWithString: 'Delta';
		play.
	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'Delta';
		play.
	scripter menuStep
		assertMenuItemLabels: self expectedSingleItemMenuLabels;
		play.
	^ scripter
]

{ #category : #'examples - list' }
GtRemotePhlowActionTargetViewExamples >> listMultipleSelectionContextMenuOnTwoItems [
	<gtExample>
	| scripter |
	scripter := self scripterOnListMultipleSelectionViewInPager.
	scripter click
		onPhlowCellWithString: 'Delta';
		play.
	scripter click
		modifiers: BlKeyModifiers primary;
		onPhlowCellWithString: 'Epsilon';
		play.
	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'Epsilon';
		play.
	scripter menuStep
		assertMenuItemLabels: self expectedGroupMenuLabelsForTwoItems;
		play.
	^ scripter
]

{ #category : #'examples - list' }
GtRemotePhlowActionTargetViewExamples >> listMultipleSelectionInspectGroup [
	<gtExample>
	| scripter |
	scripter := self scripterOnListMultipleSelectionViewInPager.
	scripter click
		onPhlowCellWithString: 'Delta';
		play.
	scripter click
		modifiers: BlKeyModifiers primary;
		onPhlowCellWithString: 'Epsilon';
		play.
	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'Epsilon';
		play.
	scripter menuStep
		clickMenuItemWithLabel: 'Inspect group';
		onMenuContainer;
		play.
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
	self assertInspectedGroupWithSize: 2 inSecondPaneOf: scripter.
	^ scripter
]

{ #category : #'examples - list' }
GtRemotePhlowActionTargetViewExamples >> listMultipleSelectionInspectGroupItems [
	<gtExample>
	| scripter |
	scripter := self scripterOnListMultipleSelectionViewInPager.
	scripter click
		onPhlowCellWithString: 'Delta';
		play.
	scripter click
		modifiers: BlKeyModifiers primary;
		onPhlowCellWithString: 'Epsilon';
		play.
	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'Epsilon';
		play.
	scripter menuStep
		clickMenuItemWithLabel: 'Inspect group items 2 items';
		onMenuContainer;
		play.
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
	self assertInspectedGroupItemsWithSize: 2 inSecondPaneOf: scripter.
	^ scripter
]

{ #category : #accessing }
GtRemotePhlowActionTargetViewExamples >> listMultipleSelectionViewTabName [
	^ 'List - multiple selection'
]

{ #category : #'examples - list' }
GtRemotePhlowActionTargetViewExamples >> listPrintItemOnDelta [
	<gtExample>
	| scripter |
	scripter := self scripterOnListViewInPager.
	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'Delta';
		play.
	scripter menuStep
		clickMenuItemWithLabel: 'Print item (Delta: 4)';
		onMenuContainer;
		play.
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
	self assertInspectedPrintStringEquals: '(Delta: 4)' inSecondPaneOf: scripter.
	^ scripter
]

{ #category : #accessing }
GtRemotePhlowActionTargetViewExamples >> listViewTabName [
	^ 'List'
]

{ #category : #'examples - setup' }
GtRemotePhlowActionTargetViewExamples >> scripterOnColumnedListMultipleSelectionViewInPager [
	<gtExample>
	^ self createScripterOnTabNamed: self columnedListMultipleSelectionViewTabName
]

{ #category : #'examples - setup' }
GtRemotePhlowActionTargetViewExamples >> scripterOnColumnedListViewInPager [
	<gtExample>
	^ self createScripterOnTabNamed: self columnedListViewTabName
]

{ #category : #'examples - setup' }
GtRemotePhlowActionTargetViewExamples >> scripterOnColumnedTreeMultipleSelectionViewInPager [
	<gtExample>
	^ self createScripterOnTabNamed: self columnedTreeMultipleSelectionViewTabName
]

{ #category : #'examples - setup' }
GtRemotePhlowActionTargetViewExamples >> scripterOnColumnedTreeViewInPager [
	<gtExample>
	^ self createScripterOnTabNamed: self columnedTreeViewTabName
]

{ #category : #'examples - setup' }
GtRemotePhlowActionTargetViewExamples >> scripterOnListMultipleSelectionViewInPager [
	<gtExample>
	^ self createScripterOnTabNamed: self listMultipleSelectionViewTabName
]

{ #category : #'examples - setup' }
GtRemotePhlowActionTargetViewExamples >> scripterOnListViewInPager [
	<gtExample>
	^ self createScripterOnTabNamed: self listViewTabName
]

{ #category : #'examples - setup' }
GtRemotePhlowActionTargetViewExamples >> scripterOnTreeMultipleSelectionViewInPager [
	<gtExample>
	^ self createScripterOnTabNamed: self treeMultipleSelectionViewTabName
]

{ #category : #'examples - setup' }
GtRemotePhlowActionTargetViewExamples >> scripterOnTreeViewInPager [
	<gtExample>
	^ self createScripterOnTabNamed: self treeViewTabName
]

{ #category : #'examples - tree' }
GtRemotePhlowActionTargetViewExamples >> treeContextMenuOnAlpha1 [
	<gtExample>
	| scripter |
	scripter := self scripterOnTreeViewInPager.
	self expandAlphaInTreeScripter: scripter treeClass: BrSimpleTree.
	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'Alpha-1';
		play.
	scripter menuStep
		assertMenuItemLabels: self expectedChildItemMenuLabels;
		play.
	^ scripter
]

{ #category : #'examples - tree' }
GtRemotePhlowActionTargetViewExamples >> treeContextMenuOnDelta [
	<gtExample>
	| scripter |
	scripter := self scripterOnTreeViewInPager.
	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'Delta';
		play.
	scripter menuStep
		assertMenuItemLabels: self expectedSingleItemMenuLabels;
		play.
	^ scripter
]

{ #category : #'examples - tree' }
GtRemotePhlowActionTargetViewExamples >> treeInspectItemOnAlpha1 [
	<gtExample>
	| scripter |
	scripter := self scripterOnTreeViewInPager.
	self expandAlphaInTreeScripter: scripter treeClass: BrSimpleTree.
	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'Alpha-1';
		play.
	scripter menuStep
		clickMenuItemWithId: GtRemotePhlowExampleInspectItemActionId new;
		onMenuContainer;
		play.
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
	self assertInspectedItemWithLabel: 'Alpha-1' value: 11 inSecondPaneOf: scripter.
	^ scripter
]

{ #category : #'examples - tree' }
GtRemotePhlowActionTargetViewExamples >> treeInspectItemOnDelta [
	<gtExample>
	| scripter |
	scripter := self scripterOnTreeViewInPager.
	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'Delta';
		play.
	scripter menuStep
		clickMenuItemWithId: GtRemotePhlowExampleInspectItemActionId new;
		onMenuContainer;
		play.
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
	self assertInspectedItemWithLabel: 'Delta' value: 4 inSecondPaneOf: scripter.
	^ scripter
]

{ #category : #'examples - tree' }
GtRemotePhlowActionTargetViewExamples >> treeMultipleSelectionContextMenuOnTwoItems [
	<gtExample>
	| scripter |
	scripter := self scripterOnTreeMultipleSelectionViewInPager.
	scripter click
		onPhlowCellWithString: 'Delta';
		play.
	scripter click
		modifiers: BlKeyModifiers primary;
		onPhlowCellWithString: 'Epsilon';
		play.
	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'Epsilon';
		play.
	scripter menuStep
		assertMenuItemLabels: self expectedGroupMenuLabelsForTwoItems;
		play.
	^ scripter
]

{ #category : #'examples - tree' }
GtRemotePhlowActionTargetViewExamples >> treeMultipleSelectionInspectGroup [
	<gtExample>
	| scripter |
	scripter := self scripterOnTreeMultipleSelectionViewInPager.
	scripter click
		onPhlowCellWithString: 'Delta';
		play.
	scripter click
		modifiers: BlKeyModifiers primary;
		onPhlowCellWithString: 'Epsilon';
		play.
	scripter menuStep
		openContextMenu;
		onPhlowCellWithString: 'Epsilon';
		play.
	scripter menuStep
		clickMenuItemWithLabel: 'Inspect group';
		onMenuContainer;
		play.
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
	self assertInspectedGroupWithSize: 2 inSecondPaneOf: scripter.
	^ scripter
]

{ #category : #accessing }
GtRemotePhlowActionTargetViewExamples >> treeMultipleSelectionViewTabName [
	^ 'Tree - multiple selection'
]

{ #category : #accessing }
GtRemotePhlowActionTargetViewExamples >> treeViewTabName [
	^ 'Tree'
]
