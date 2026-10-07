Class {
	#name : #GtRemotePhlowActionTargetTestContainer,
	#superclass : #Object,
	#instVars : [
		'items'
	],
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #'instance creation' }
GtRemotePhlowActionTargetTestContainer class >> new [
	^ super new initialize
]

{ #category : #'gt - extensions' }
GtRemotePhlowActionTargetTestContainer >> gtColumnedListFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Columned list';
		priority: 20;
		items: [ self items ];
		column: 'Label' text: [ :anItem | anItem label ];
		column: 'Value' text: [ :anItem | anItem value ];
		contextActionsForTarget: GtRemotePhlowExampleItemActionTarget
]

{ #category : #views }
GtRemotePhlowActionTargetTestContainer >> gtColumnedListMultipleSelectionFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Columned list - multiple selection';
		priority: 21;
		items: [ self items ];
		column: 'Label' text: [ :anItem | anItem label ];
		column: 'Value' text: [ :anItem | anItem value ];
		withMultipleSelection;
		send: [ :anObject :theIndices |
			theIndices size = 1
				ifTrue: [ anObject ]
				ifFalse: [ GtRemotePhlowActionTargetTestItemGroup withAll: anObject ] ];
		contextActionsForTarget: GtRemotePhlowExampleItemActionTarget
			groupTarget: GtRemotePhlowExampleItemActionTarget
			groupWith: [ :aCollection | 
				GtRemotePhlowActionTargetTestItemGroup withAll: aCollection ]
]

{ #category : #'gt - extensions' }
GtRemotePhlowActionTargetTestContainer >> gtColumnedTreeFor: aView [
	<gtView>
	^ aView columnedTree
		title: 'Columned tree';
		priority: 40;
		items: [ self items ];
		children: [ :anItem | anItem children ];
		column: 'Label' text: [ :anItem | anItem label ];
		column: 'Value' text: [ :anItem | anItem value ];
		contextActionsForTarget: GtRemotePhlowExampleItemActionTarget
]

{ #category : #views }
GtRemotePhlowActionTargetTestContainer >> gtColumnedTreeMultipleSelectionFor: aView [
	<gtView>
	^ aView columnedTree
		title: 'Columned tree - multiple selection';
		priority: 41;
		items: [ self items ];
		children: [ :anItem | anItem children ];
		column: 'Label' text: [ :anItem | anItem label ];
		column: 'Value' text: [ :anItem | anItem value ];
		withMultipleSelection;
		send: [ :anObject :theIndices |
			theIndices size = 1
				ifTrue: [ anObject ]
				ifFalse: [ GtRemotePhlowActionTargetTestItemGroup withAll: anObject ] ];
		contextActionsForTarget: GtRemotePhlowExampleItemActionTarget
			groupTarget: GtRemotePhlowExampleItemActionTarget
			groupWith: [ :aCollection | 
				GtRemotePhlowActionTargetTestItemGroup withAll: aCollection ]
]

{ #category : #'gt - extensions' }
GtRemotePhlowActionTargetTestContainer >> gtListFor: aView [
	<gtView>
	^ aView list
		title: 'List';
		priority: 10;
		items: [ self items ];
		itemText: [ :anItem | anItem label ];
		contextActionsForTarget: GtRemotePhlowExampleItemActionTarget
]

{ #category : #views }
GtRemotePhlowActionTargetTestContainer >> gtListMultipleSelectionFor: aView [
	<gtView>
	^ aView list
		title: 'List - multiple selection';
		priority: 11;
		items: [ self items ];
		itemText: [ :anItem | anItem label ];
		withMultipleSelection;
		send: [ :anObject :theIndices |
			theIndices size = 1
				ifTrue: [ anObject ]
				ifFalse: [ GtRemotePhlowActionTargetTestItemGroup withAll: anObject ] ];
		contextActionsForTarget: GtRemotePhlowExampleItemActionTarget
			groupTarget: GtRemotePhlowExampleItemActionTarget
			groupWith: [ :aCollection | GtRemotePhlowActionTargetTestItemGroup withAll: aCollection ]
]

{ #category : #'gt - extensions' }
GtRemotePhlowActionTargetTestContainer >> gtTreeFor: aView [
	<gtView>
	^ aView tree
		title: 'Tree';
		priority: 30;
		items: [ self items ];
		children: [ :anItem | anItem children ];
		itemText: [ :anItem | anItem label ];
		contextActionsForTarget: GtRemotePhlowExampleItemActionTarget
]

{ #category : #views }
GtRemotePhlowActionTargetTestContainer >> gtTreeMultipleSelectionFor: aView [
	<gtView>
	^ aView tree
		title: 'Tree - multiple selection';
		priority: 31;
		items: [ self items ];
		children: [ :anItem | anItem children ];
		itemText: [ :anItem | anItem label ];
		withMultipleSelection;
		send: [ :anObject :theIndices |
			theIndices size = 1
				ifTrue: [ anObject ]
				ifFalse: [ GtRemotePhlowActionTargetTestItemGroup withAll: anObject ] ];
		contextActionsForTarget: GtRemotePhlowExampleItemActionTarget
			groupTarget: GtRemotePhlowExampleItemActionTarget
			groupWith: [ :aCollection | GtRemotePhlowActionTargetTestItemGroup withAll: aCollection ]
]

{ #category : #initialization }
GtRemotePhlowActionTargetTestContainer >> initialize [
	super initialize.
	items := {
		GtRemotePhlowActionTargetTestItem
			label: 'Alpha' value: 1
			children: {
				GtRemotePhlowActionTargetTestItem label: 'Alpha-1' value: 11.
				GtRemotePhlowActionTargetTestItem label: 'Alpha-2' value: 12 }.
		GtRemotePhlowActionTargetTestItem
			label: 'Beta' value: 2
			children: {
				GtRemotePhlowActionTargetTestItem label: 'Beta-1' value: 21 }.
		GtRemotePhlowActionTargetTestItem label: 'Gamma' value: 3.
		GtRemotePhlowActionTargetTestItem label: 'Delta' value: 4.
		GtRemotePhlowActionTargetTestItem label: 'Epsilon' value: 5 }
]

{ #category : #accessing }
GtRemotePhlowActionTargetTestContainer >> items [
	^ items
]

{ #category : #accessing }
GtRemotePhlowActionTargetTestContainer >> items: aCollection [
	items := aCollection
]
