Class {
	#name : #GtRemotePhlowActionTargetDynamicTestContainer,
	#superclass : #Object,
	#instVars : [
		'items'
	],
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #'instance creation' }
GtRemotePhlowActionTargetDynamicTestContainer class >> new [
	^ super new initialize
]

{ #category : #'gt - extensions' }
GtRemotePhlowActionTargetDynamicTestContainer >> gtColumnedListFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Columned list - dynamic';
		priority: 20;
		items: [ self items ];
		column: 'Label' text: [ :anItem | anItem label ];
		column: 'Value' text: [ :anItem | anItem value ];
		dynamicPhlowContextItems: [ :anAction :anElement :anObject |
			GtRemotePhlowExampleItemActionTarget default
				contextPhlowActionsForObject: anObject ]
]

{ #category : #'gt - extensions - views' }
GtRemotePhlowActionTargetDynamicTestContainer >> gtColumnedListMultipleSelectionFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Columned list - dynamic multiple selection';
		priority: 21;
		items: [ self items ];
		column: 'Label' text: [ :anItem | anItem label ];
		column: 'Value' text: [ :anItem | anItem value ];
		withMultipleSelection;
		send: [ :anObject :theIndices |
			theIndices size = 1
				ifTrue: [ anObject ]
				ifFalse: [ GtRemotePhlowActionTargetTestItemGroup withAll: anObject ] ];
		dynamicPhlowContextItems: [ :anAction :anElement :aCollection |
			| effectiveObject |
			effectiveObject := aCollection size = 1
				ifTrue: [ aCollection first ]
				ifFalse: [ GtRemotePhlowActionTargetTestItemGroup withAll: aCollection ].
			GtRemotePhlowExampleItemActionTarget default
				contextPhlowActionsForObject: effectiveObject ]
]

{ #category : #'gt - extensions' }
GtRemotePhlowActionTargetDynamicTestContainer >> gtColumnedTreeFor: aView [
	<gtView>
	^ aView columnedTree
		title: 'Columned tree - dynamic';
		priority: 40;
		items: [ self items ];
		children: [ :anItem | anItem children ];
		column: 'Label' text: [ :anItem | anItem label ];
		column: 'Value' text: [ :anItem | anItem value ];
		dynamicPhlowContextItems: [ :anAction :anElement :anObject |
			GtRemotePhlowExampleItemActionTarget default
				contextPhlowActionsForObject: anObject ]
]

{ #category : #'gt - extensions - views' }
GtRemotePhlowActionTargetDynamicTestContainer >> gtColumnedTreeMultipleSelectionFor: aView [
	<gtView>
	^ aView columnedTree
		title: 'Columned tree - dynamic multiple selection';
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
		dynamicPhlowContextItems: [ :anAction :anElement :aCollection |
			| effectiveObject |
			effectiveObject := aCollection size = 1
				ifTrue: [ aCollection first ]
				ifFalse: [ GtRemotePhlowActionTargetTestItemGroup withAll: aCollection ].
			GtRemotePhlowExampleItemActionTarget default
				contextPhlowActionsForObject: effectiveObject ]
]

{ #category : #'gt - extensions' }
GtRemotePhlowActionTargetDynamicTestContainer >> gtListFor: aView [
	<gtView>
	^ aView list
		title: 'List - dynamic';
		priority: 10;
		items: [ self items ];
		itemText: [ :anItem | anItem label ];
		dynamicPhlowContextItems: [ :anAction :anElement :anObject |
			GtRemotePhlowExampleItemActionTarget default
				contextPhlowActionsForObject: anObject ]
]

{ #category : #'gt - extensions - views' }
GtRemotePhlowActionTargetDynamicTestContainer >> gtListMultipleSelectionFor: aView [
	<gtView>
	^ aView list
		title: 'List - dynamic multiple selection';
		priority: 11;
		items: [ self items ];
		itemText: [ :anItem | anItem label ];
		withMultipleSelection;
		send: [ :anObject :theIndices |
			theIndices size = 1
				ifTrue: [ anObject ]
				ifFalse: [ GtRemotePhlowActionTargetTestItemGroup withAll: anObject ] ];
		dynamicPhlowContextItems: [ :anAction :anElement :aCollection |
			| effectiveObject |
			effectiveObject := aCollection size = 1
				ifTrue: [ aCollection first ]
				ifFalse: [ GtRemotePhlowActionTargetTestItemGroup withAll: aCollection ].
			GtRemotePhlowExampleItemActionTarget default
				contextPhlowActionsForObject: effectiveObject ]
]

{ #category : #'gt - extensions' }
GtRemotePhlowActionTargetDynamicTestContainer >> gtTreeFor: aView [
	<gtView>
	^ aView tree
		title: 'Tree - dynamic';
		priority: 30;
		items: [ self items ];
		children: [ :anItem | anItem children ];
		itemText: [ :anItem | anItem label ];
		dynamicPhlowContextItems: [ :anAction :anElement :anObject |
			GtRemotePhlowExampleItemActionTarget default
				contextPhlowActionsForObject: anObject ]
]

{ #category : #'gt - extensions - views' }
GtRemotePhlowActionTargetDynamicTestContainer >> gtTreeMultipleSelectionFor: aView [
	<gtView>
	^ aView tree
		title: 'Tree - dynamic multiple selection';
		priority: 31;
		items: [ self items ];
		children: [ :anItem | anItem children ];
		itemText: [ :anItem | anItem label ];
		withMultipleSelection;
		send: [ :anObject :theIndices |
			theIndices size = 1
				ifTrue: [ anObject ]
				ifFalse: [ GtRemotePhlowActionTargetTestItemGroup withAll: anObject ] ];
		dynamicPhlowContextItems: [ :anAction :anElement :aCollection |
			| effectiveObject |
			effectiveObject := aCollection size = 1
				ifTrue: [ aCollection first ]
				ifFalse: [ GtRemotePhlowActionTargetTestItemGroup withAll: aCollection ].
			GtRemotePhlowExampleItemActionTarget default
				contextPhlowActionsForObject: effectiveObject ]
]

{ #category : #initialization }
GtRemotePhlowActionTargetDynamicTestContainer >> initialize [
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
GtRemotePhlowActionTargetDynamicTestContainer >> items [
	^ items
]

{ #category : #accessing }
GtRemotePhlowActionTargetDynamicTestContainer >> items: aCollection [
	items := aCollection
]
