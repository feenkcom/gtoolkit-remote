Class {
	#name : #GtRemotePhlowViewSendExamples,
	#superclass : #Object,
	#category : #'GToolkit-RemoteGt-Examples-Inspection - Actions'
}

{ #category : #testing }
GtRemotePhlowViewSendExamples class >> isAbstract [
	^ self = GtRemotePhlowViewSendExamples
]

{ #category : #'private - assertions' }
GtRemotePhlowViewSendExamples >> assertMultiSelectionSendResultForValues: valuesArray indices: indicesArray inSecondPaneOf: aScripter [
	(aScripter inspectorStep)
		onPagerPaneWithIndex: 2;
		assertInspectedObjectOfType: Array;
		assertInspectedObjectValueFor: [ :arr | arr size ] equals: [ 2 ];
		assertInspectedObjectValueFor: [ :arr | arr first size ] equals: [ valuesArray size ];
		assertInspectedObjectValueFor: [ :arr | arr second size ] equals: [ indicesArray size ];
		assertInspectedObjectValueFor: [ :arr |
			| v idx |
			v := arr first.
			idx := arr second.
			(1 to: v size) allSatisfy: [ :i | (v at: i) = (valuesArray at: i) ] ]
			equals: [ true ];
		assertInspectedObjectValueFor: [ :arr |
			| idx |
			idx := arr second.
			(1 to: idx size) allSatisfy: [ :i | (idx at: i) = (indicesArray at: i) ] ]
			equals: [ true ];
		play.
]

{ #category : #'private - assertions' }
GtRemotePhlowViewSendExamples >> assertSendResultForValue: aValue index: anIndex inSecondPaneOf: aScripter [
	(aScripter inspectorStep)
		onPagerPaneWithIndex: 2;
		assertInspectedObjectOfType: Array;
		assertInspectedObjectValueFor: [ :arr | arr first ] equals: [ aValue ];
		assertInspectedObjectValueFor: [ :arr | arr second ] equals: [ anIndex ];
		play.
]

{ #category : #'private - assertions' }
GtRemotePhlowViewSendExamples >> assertTreeMultiSelectionSendResultForValues: valuesArray indices: indicesArray inSecondPaneOf: aScripter [
	(aScripter inspectorStep)
		onPagerPaneWithIndex: 2;
		assertInspectedObjectOfType: Array;
		assertInspectedObjectValueFor: [ :arr | arr size ] equals: [ 2 ];
		assertInspectedObjectValueFor: [ :arr | (arr first collect: [ :node | node value ]) asArray ] equals: [ valuesArray asArray ];
		assertInspectedObjectValueFor: [ :arr | arr second asArray ] equals: [ indicesArray asArray ];
		play.
]

{ #category : #'examples - columned list send' }
GtRemotePhlowViewSendExamples >> columnedListMultipleSelectionSendOnSingleItem [
	<gtExample>
	| scripter |
	scripter := self scripterOnColumnedListMultipleSelectionView.
	scripter doubleClick
		onPhlowCellWithString: self listCellTextForItem13;
		play.
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
	self assertSendResultForValue: 13 index: #(4) inSecondPaneOf: scripter.
	^ scripter
]

{ #category : #'examples - columned list send' }
GtRemotePhlowViewSendExamples >> columnedListMultipleSelectionSendOnTwoItems [
	<gtExample>
	| scripter |
	scripter := self scripterOnColumnedListMultipleSelectionView.
	scripter doubleClick
		onPhlowCellWithString: self listCellTextForItem13;
		play.
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
	scripter click
		modifiers: BlKeyModifiers shift;
		onPhlowCellWithString: self listCellTextForItem14;
		play.
	self assertMultiSelectionSendResultForValues: #(13 14) indices: #(4 5) inSecondPaneOf: scripter.
	^ scripter
]

{ #category : #'examples - columned list send' }
GtRemotePhlowViewSendExamples >> columnedListSendOnItem13 [
	<gtExample>
	| scripter |
	scripter := self scripterOnColumnedListBasicActionsView.
	scripter doubleClick
		onPhlowCellWithString: self listCellTextForItem13;
		play.
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
	self assertSendResultForValue: 13 index: #(4) inSecondPaneOf: scripter.
	^ scripter
]

{ #category : #'private - tree' }
GtRemotePhlowViewSendExamples >> columnedTreeElementClass [
	^ BrColumnedTree
]

{ #category : #'examples - columned tree send' }
GtRemotePhlowViewSendExamples >> columnedTreeMultipleSelectionSendOnExpandedChild [
	<gtExample>
	| scripter |
	scripter := self scripterWithExpandedColumnedTreeOnMultipleSelectionView.
	scripter doubleClick
		onPhlowCellWithString: self treeExpandedChildCellText;
		play.
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
	self assertSendResultForValue: 11 index: #(5) inSecondPaneOf: scripter.
	^ scripter
]

{ #category : #'examples - columned tree send' }
GtRemotePhlowViewSendExamples >> columnedTreeMultipleSelectionSendOnRootAndExpandedChild [
	<gtExample>
	| scripter |
	scripter := self scripterWithExpandedColumnedTreeOnMultipleSelectionView.
	scripter doubleClick
		onPhlowCellWithString: self treeCellTextForItem13;
		play.
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
	scripter click
		modifiers: BlKeyModifiers shift;
		onPhlowCellWithString: self treeExpandedChildCellText;
		play.
	self assertTreeMultiSelectionSendResultForValues: #(13 11) indices: #(4 5) inSecondPaneOf: scripter.
	^ scripter
]

{ #category : #'examples - columned tree send' }
GtRemotePhlowViewSendExamples >> columnedTreeMultipleSelectionSendOnSingleItem [
	<gtExample>
	| scripter |
	scripter := self scripterOnColumnedTreeMultipleSelectionView.
	scripter doubleClick
		onPhlowCellWithString: self treeCellTextForItem13;
		play.
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
	self assertSendResultForValue: 13 index: #(4) inSecondPaneOf: scripter.
	^ scripter
]

{ #category : #'examples - columned tree send' }
GtRemotePhlowViewSendExamples >> columnedTreeMultipleSelectionSendOnTwoItems [
	<gtExample>
	| scripter |
	scripter := self scripterOnColumnedTreeMultipleSelectionView.
	scripter doubleClick
		onPhlowCellWithString: self treeCellTextForItem13;
		play.
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
	scripter click
		modifiers: BlKeyModifiers shift;
		onPhlowCellWithString: self treeCellTextForItem14;
		play.
	self assertTreeMultiSelectionSendResultForValues: #(13 14) indices: #(4 5) inSecondPaneOf: scripter.
	^ scripter
]

{ #category : #'examples - columned tree send' }
GtRemotePhlowViewSendExamples >> columnedTreeSendOnExpandedChild [
	<gtExample>
	| scripter |
	scripter := self scripterWithExpandedColumnedTreeOnBasicActionsView.
	scripter doubleClick
		onPhlowCellWithString: self treeExpandedChildCellText;
		play.
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
	self assertSendResultForValue: 11 index: #(5) inSecondPaneOf: scripter.
	^ scripter
]

{ #category : #'examples - columned tree send' }
GtRemotePhlowViewSendExamples >> columnedTreeSendOnItem13 [
	<gtExample>
	| scripter |
	scripter := self scripterOnColumnedTreeBasicActionsView.
	scripter doubleClick
		onPhlowCellWithString: self treeCellTextForItem13;
		play.
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
	self assertSendResultForValue: 13 index: #(4) inSecondPaneOf: scripter.
	^ scripter
]

{ #category : #'examples - test objects' }
GtRemotePhlowViewSendExamples >> createColumnedListTestObject [
	<gtExample>
	^ self wrapTestObject: GtRemotePhlowColumnedListViewContextActionsBasicTestObject new
]

{ #category : #'examples - test objects' }
GtRemotePhlowViewSendExamples >> createColumnedTreeTestObject [
	<gtExample>
	^ self wrapTestObject: GtRemotePhlowColumnedTreeViewContextActionsBasicTestObject new
]

{ #category : #'examples - test objects' }
GtRemotePhlowViewSendExamples >> createListTestObject [
	<gtExample>
	^ self wrapTestObject: GtRemotePhlowListViewContextActionsBasicTestObject new
]

{ #category : #'private - scripter' }
GtRemotePhlowViewSendExamples >> createScripterOnObject: anObject tabNamed: aTabName [
	| scripter |
	scripter := BlScripter new.
	scripter element: (GtPagerSettings usedPager
		createWrappedOn: anObject gtDefaultInspectorTool).
	(scripter inspectorStep)
		clickOnTabWithName: aTabName;
		assertSelectedTabWithName: aTabName;
		play.
	^ scripter
]

{ #category : #'examples - test objects' }
GtRemotePhlowViewSendExamples >> createTreeTestObject [
	<gtExample>
	^ self wrapTestObject: GtRemotePhlowTreeViewContextActionsBasicTestObject new
]

{ #category : #'private - tree' }
GtRemotePhlowViewSendExamples >> expandItem13InScripter: scripter treeClass: aTreeClass [
	scripter clickStep: [ :s |
		s
			label: 'Expand item 13';
			onPagerToolInPaneWithIndex: 1;
			// GtInspectorContentElement;
			// aTreeClass;
			onChildAt: 1;
			onChildAt: 4;
			id: #toggle ].
	scripter clickStep: [ :s |
		s
			label: 'Expand child 11';
			onPagerToolInPaneWithIndex: 1;
			// GtInspectorContentElement;
			// aTreeClass;
			onChildAt: 1;
			onChildAt: 5;
			id: #toggle ]
]

{ #category : #'private - cell text' }
GtRemotePhlowViewSendExamples >> listCellTextForItem13 [
	^ 'value: 13; index: 4'
]

{ #category : #'private - cell text' }
GtRemotePhlowViewSendExamples >> listCellTextForItem14 [
	^ 'value: 14; index: 5'
]

{ #category : #'examples - list send' }
GtRemotePhlowViewSendExamples >> listMultipleSelectionSendOnSingleItem [
	<gtExample>
	| scripter |
	scripter := self scripterOnListMultipleSelectionView.
	scripter doubleClick
		onPhlowCellWithString: self listCellTextForItem13;
		play.
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
	self assertSendResultForValue: 13 index: #(4) inSecondPaneOf: scripter.
	^ scripter
]

{ #category : #'examples - list send' }
GtRemotePhlowViewSendExamples >> listMultipleSelectionSendOnTwoItems [
	<gtExample>
	| scripter |
	scripter := self scripterOnListMultipleSelectionView.
	scripter doubleClick
		onPhlowCellWithString: self listCellTextForItem13;
		play.
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
	scripter click
		modifiers: BlKeyModifiers shift;
		onPhlowCellWithString: self listCellTextForItem14;
		play.
	self assertMultiSelectionSendResultForValues: #(13 14) indices: #(4 5) inSecondPaneOf: scripter.
	^ scripter
]

{ #category : #'examples - list send' }
GtRemotePhlowViewSendExamples >> listSendOnItem13 [
	<gtExample>
	| scripter |
	scripter := self scripterOnListBasicActionsView.
	scripter doubleClick
		onPhlowCellWithString: self listCellTextForItem13;
		play.
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
	self assertSendResultForValue: 13 index: #(4) inSecondPaneOf: scripter.
	^ scripter
]

{ #category : #'examples - scripter - columned list' }
GtRemotePhlowViewSendExamples >> scripterOnColumnedListBasicActionsView [
	<gtExample>
	^ self createScripterOnObject: self createColumnedListTestObject tabNamed: 'Basic actions'
]

{ #category : #'examples - scripter - columned list' }
GtRemotePhlowViewSendExamples >> scripterOnColumnedListMultipleSelectionView [
	<gtExample>
	^ self createScripterOnObject: self createColumnedListTestObject tabNamed: 'Basic - multiple selection'
]

{ #category : #'examples - scripter - columned tree' }
GtRemotePhlowViewSendExamples >> scripterOnColumnedTreeBasicActionsView [
	<gtExample>
	^ self createScripterOnObject: self createColumnedTreeTestObject tabNamed: 'Columned Tree - Basic actions'
]

{ #category : #'examples - scripter - columned tree' }
GtRemotePhlowViewSendExamples >> scripterOnColumnedTreeMultipleSelectionView [
	<gtExample>
	^ self createScripterOnObject: self createColumnedTreeTestObject tabNamed: 'Columned Tree - Multiple Selection'
]

{ #category : #'examples - scripter - list' }
GtRemotePhlowViewSendExamples >> scripterOnListBasicActionsView [
	<gtExample>
	^ self createScripterOnObject: self createListTestObject tabNamed: 'Basic actions'
]

{ #category : #'examples - scripter - list' }
GtRemotePhlowViewSendExamples >> scripterOnListMultipleSelectionView [
	<gtExample>
	^ self createScripterOnObject: self createListTestObject tabNamed: 'Basic - multiple selection'
]

{ #category : #'examples - scripter - tree' }
GtRemotePhlowViewSendExamples >> scripterOnTreeBasicActionsView [
	<gtExample>
	^ self createScripterOnObject: self createTreeTestObject tabNamed: 'Tree - Basic actions'
]

{ #category : #'examples - scripter - tree' }
GtRemotePhlowViewSendExamples >> scripterOnTreeMultipleSelectionView [
	<gtExample>
	^ self createScripterOnObject: self createTreeTestObject tabNamed: 'Tree - Multiple Selection'
]

{ #category : #'examples - scripter - columned tree' }
GtRemotePhlowViewSendExamples >> scripterWithExpandedColumnedTreeOnBasicActionsView [
	<gtExample>
	| scripter |
	scripter := self scripterOnColumnedTreeBasicActionsView.
	self expandItem13InScripter: scripter treeClass: self columnedTreeElementClass.
	^ scripter
]

{ #category : #'examples - scripter - columned tree' }
GtRemotePhlowViewSendExamples >> scripterWithExpandedColumnedTreeOnMultipleSelectionView [
	<gtExample>
	| scripter |
	scripter := self scripterOnColumnedTreeMultipleSelectionView.
	self expandItem13InScripter: scripter treeClass: self columnedTreeElementClass.
	^ scripter
]

{ #category : #'examples - scripter - tree' }
GtRemotePhlowViewSendExamples >> scripterWithExpandedTreeOnBasicActionsView [
	<gtExample>
	| scripter |
	scripter := self scripterOnTreeBasicActionsView.
	self expandItem13InScripter: scripter treeClass: self treeElementClass.
	^ scripter
]

{ #category : #'examples - scripter - tree' }
GtRemotePhlowViewSendExamples >> scripterWithExpandedTreeOnMultipleSelectionView [
	<gtExample>
	| scripter |
	scripter := self scripterOnTreeMultipleSelectionView.
	self expandItem13InScripter: scripter treeClass: self treeElementClass.
	^ scripter
]

{ #category : #'private - cell text' }
GtRemotePhlowViewSendExamples >> treeCellTextForItem13 [
	^ 'value: 13; index: SmallInteger - 4'
]

{ #category : #'private - cell text' }
GtRemotePhlowViewSendExamples >> treeCellTextForItem14 [
	^ 'value: 14; index: SmallInteger - 5'
]

{ #category : #'private - tree' }
GtRemotePhlowViewSendExamples >> treeElementClass [
	^ BrSimpleTree
]

{ #category : #'private - cell text' }
GtRemotePhlowViewSendExamples >> treeExpandedChildCellText [
	^ 'value: 11; index: SmallInteger - 5'
]

{ #category : #'examples - tree send' }
GtRemotePhlowViewSendExamples >> treeMultipleSelectionSendOnExpandedChild [
	<gtExample>
	| scripter |
	scripter := self scripterWithExpandedTreeOnMultipleSelectionView.
	scripter doubleClick
		onPhlowCellWithString: self treeExpandedChildCellText;
		play.
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
	self assertSendResultForValue: 11 index: #(5) inSecondPaneOf: scripter.
	^ scripter
]

{ #category : #'examples - tree send' }
GtRemotePhlowViewSendExamples >> treeMultipleSelectionSendOnRootAndExpandedChild [
	<gtExample>
	| scripter |
	scripter := self scripterWithExpandedTreeOnMultipleSelectionView.
	scripter doubleClick
		onPhlowCellWithString: self treeCellTextForItem13;
		play.
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
	scripter click
		modifiers: BlKeyModifiers shift;
		onPhlowCellWithString: self treeExpandedChildCellText;
		play.
	self assertTreeMultiSelectionSendResultForValues: #(13 11) indices: #(4 5) inSecondPaneOf: scripter.
	^ scripter
]

{ #category : #'examples - tree send' }
GtRemotePhlowViewSendExamples >> treeMultipleSelectionSendOnSingleItem [
	<gtExample>
	| scripter |
	scripter := self scripterOnTreeMultipleSelectionView.
	scripter doubleClick
		onPhlowCellWithString: self treeCellTextForItem13;
		play.
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
	self assertSendResultForValue: 13 index: #(4) inSecondPaneOf: scripter.
	^ scripter
]

{ #category : #'examples - tree send' }
GtRemotePhlowViewSendExamples >> treeMultipleSelectionSendOnTwoItems [
	<gtExample>
	| scripter |
	scripter := self scripterOnTreeMultipleSelectionView.
	scripter doubleClick
		onPhlowCellWithString: self treeCellTextForItem13;
		play.
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
	scripter click
		modifiers: BlKeyModifiers shift;
		onPhlowCellWithString: self treeCellTextForItem14;
		play.
	self assertTreeMultiSelectionSendResultForValues: #(13 14) indices: #(4 5) inSecondPaneOf: scripter.
	^ scripter
]

{ #category : #'examples - tree send' }
GtRemotePhlowViewSendExamples >> treeSendOnExpandedChild [
	<gtExample>
	| scripter |
	scripter := self scripterWithExpandedTreeOnBasicActionsView.
	scripter doubleClick
		onPhlowCellWithString: self treeExpandedChildCellText;
		play.
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
	self assertSendResultForValue: 11 index: #(5) inSecondPaneOf: scripter.
	^ scripter
]

{ #category : #'examples - tree send' }
GtRemotePhlowViewSendExamples >> treeSendOnItem13 [
	<gtExample>
	| scripter |
	scripter := self scripterOnTreeBasicActionsView.
	scripter doubleClick
		onPhlowCellWithString: self treeCellTextForItem13;
		play.
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
	self assertSendResultForValue: 13 index: #(4) inSecondPaneOf: scripter.
	^ scripter
]

{ #category : #'private - test objects' }
GtRemotePhlowViewSendExamples >> wrapTestObject: anObject [
	^ anObject
]
