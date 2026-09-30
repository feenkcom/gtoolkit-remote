"
Scripter-based examples testing context menu actions on the Basic actions view of GtRemotePhlowListViewContextActionsBasicTestObject. Verifies that the correct menu items appear (including conditional showIf: items) and that clicking menu actions spawns the expected objects.
"
Class {
	#name : #GtRemotePhlowListViewBasicContextActionsExamples,
	#superclass : #Object,
	#category : #'GToolkit-RemoteGt-Examples-Inspection'
}

{ #category : #testing }
GtRemotePhlowListViewBasicContextActionsExamples class >> isAbstract [
	^ self name = #GtRemotePhlowListViewBasicContextActionsExamples
]

{ #category : #'examples - context menu' }
GtRemotePhlowListViewBasicContextActionsExamples >> contextMenuOnItem11 [
	<gtExample>
	| scripter |
	scripter := self scripterOnBasicActionsViewInPager.

	scripter menuStep
		openContextMenu;
		// BrLabel;
		@ [ :aLabel | aLabel text asString = 'value: 11; index: 2' ];
		play.

	scripter assert
		label: 'Assert context menu items for item 11';
		value: [ :aMenuContainer | 
			((aMenuContainer query // #'menu--label') result 
				collect: [ :each | each text asString ]) asArray ]
		equals: {'Inspect element'. 'Inspect object'. 'Inspect selection'. 'Inspect parameters'};
		onSpaceRoot;
		// BrMenuSteppedElement;
		play.

	^ scripter
]

{ #category : #'examples - context menu' }
GtRemotePhlowListViewBasicContextActionsExamples >> contextMenuOnItem13 [
	<gtExample>
	| scripter |
	scripter := self scripterOnBasicActionsViewInPager.

	scripter menuStep
		openContextMenu;
		// BrLabel;
		@ [ :aLabel | aLabel text asString = 'value: 13; index: 4' ];
		play.

	scripter assert
		label: 'Assert context menu items for item 13';
		value: [ :aMenuContainer | 
			((aMenuContainer query // #'menu--label') result 
				collect: [ :each | each text asString ]) asArray ]
		equals: {'Inspect element'. 'Inspect object'. 'Inspect selection'. 'Inspect parameters'. 'Show if greater than 12'};
		onSpaceRoot;
		// BrMenuSteppedElement;
		play.

	^ scripter
]

{ #category : #'examples - setup' }
GtRemotePhlowListViewBasicContextActionsExamples >> createTestObject [
	<gtExample>
	^ GtRemotePhlowListViewContextActionsBasicTestObject new
]

{ #category : #expected }
GtRemotePhlowListViewBasicContextActionsExamples >> expectedSingleSelectionForIndex: anIndex [
	^ self subclassResponsibility
]

{ #category : #'examples - actions' }
GtRemotePhlowListViewBasicContextActionsExamples >> inspectObjectOnItem13OpensNewPane [
	<gtExample>
	| scripter |
	scripter := self scripterOnBasicActionsViewInPager.

	scripter menuStep
		openContextMenu;
		// BrLabel;
		@ [ :aLabel | aLabel text asString = 'value: 13; index: 4' ];
		play.

	scripter menuStep
		clickMenuItemWithLabel: 'Inspect object';
		onMenuContainer;
		play.

	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.

	(scripter inspectorStep)
		onPagerPaneWithIndex: 2;
		assertInspectedObjectOfType: SmallInteger;
		assertInspectedObjectValueFor: [ :obj | obj ] equals: 13;
		play.

	^ scripter
]

{ #category : #'examples - actions' }
GtRemotePhlowListViewBasicContextActionsExamples >> inspectSelectionOnItem13OpensNewPane [
	<gtExample>
	| scripter |
	scripter := self scripterOnBasicActionsViewInPager.

	scripter menuStep
		openContextMenu;
		// BrLabel;
		@ [ :aLabel | aLabel text asString = 'value: 13; index: 4' ];
		play.

	scripter menuStep
		clickMenuItemWithLabel: 'Inspect selection';
		onMenuContainer;
		play.

	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.

	(scripter inspectorStep)
		onPagerPaneWithIndex: 2;
		assertInspectedObjectValueFor: [ :obj | obj ]
			equals: (self expectedSingleSelectionForIndex: 4);
		play.

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
