Class {
	#name : #GtRemotePhlowListViewContextActionsBasicTestObject,
	#superclass : #Object,
	#instVars : [
		'collectionOfObjects'
	],
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #'instance creation' }
GtRemotePhlowListViewContextActionsBasicTestObject class >> new [ 	
	^ self basicNew initialize
]

{ #category : #views }
GtRemotePhlowListViewContextActionsBasicTestObject >> gtListWithBasicContextActionsFor: aView [
	<gtView>

	^aView list
		title: 'Basic actions';
		priority: 15;
		items: [ 10 to: 15 ];
		itemText: [ :anObject :aSelectionIndex | 
			'value: ', anObject printString, '; index: ', aSelectionIndex printString ];
		contextItemLabel: 'Inspect element' action: [ :anElement |
				anElement phlow spawnObject: anElement ];
		contextItemLabel: 'Inspect object' action: [ :anElement :anObject |
				anElement phlow spawnObject: anObject ];
		contextItemLabel: 'Inspect selection index' action: [ :anElement :anObject :aSelection |
				anElement phlow spawnObject: aSelection ];
		contextItemLabel: 'Inspect parameters' action: [ :anElement :anObject :aSelection |
				anElement phlow spawnObject: {anElement . anObject . aSelection} ];
		
		contextItemLabel: 'Show if greater than 12' 
			action: [ :anElement :anObject | anElement phlow spawnObject: anObject ]
			showIf: [ :anObject :aSelection | anObject > 12 ];
				
		send: [ :anObject :aSelectionIndex | {anObject . aSelectionIndex} ]
]

{ #category : #views }
GtRemotePhlowListViewContextActionsBasicTestObject >> gtListWithBasicContextActionsMultipleSelectionFor: aView [
	<gtView>

	^aView list
		title: 'Basic - multiple selection';
		priority:15.1;
		items: [ 10 to: 15 ];
		itemText: [ :anObject :aSelectionIndex | 
			'value: ', anObject printString, '; index: ', aSelectionIndex printString ];
		withMultipleSelection;
		contextItemLabel: 'Inspect element' action: [ :anElement |
				anElement phlow spawnObject: anElement ];
		contextItemLabel: 'Inspect object' action: [ :anElement :anObject |
				anElement phlow spawnObject: anObject ];
		contextItemLabel: 'Inspect selection index' action: [ :anElement :anObject :aSelection |
				anElement phlow spawnObject: aSelection ];
		contextItemLabel: 'Inspect parameters' action: [ :anElement :anObject :aSelection |
				anElement phlow spawnObject: {anElement . anObject . aSelection} ];
				
		contextItemLabel: 'Show if 3 elements in selection' 
			action: [ :anElement | anElement phlow spawnObject: anElement ]
			showIf: [ :anObject :aSelection | 
				aSelection size = 3 ];
		contextItemLabel: 'Show if 14 in selection' 
			action: [ :anElement :aCollectionOfObjects | 
				anElement phlow spawnObject: aCollectionOfObjects  ]
			showIf: [ :aCollectionOfObjects :aSelection | 
				aCollectionOfObjects includes: 14   ];
			
		send: [ :anObject :aSelectionIndex |  {anObject . aSelectionIndex} ]
]

{ #category : #views }
GtRemotePhlowListViewContextActionsBasicTestObject >> gtListWithDynamicContextPhlowActionsFor: aView [
	<gtView>

	^aView list
		title: 'Dynamic context phlow';
		priority: 19.2;
		items: [ 10 to: 15 ];
		itemText: [ :anObject :aSelectionIndex | 
			'value: ', anObject printString, '; index: ', aSelectionIndex printString ];
		dynamicPhlowContextItems: [ :anAction :anElement :anObject :aSelectionIndex |
			{
				anAction contextMenuAction
					label: 'Inspect element';
					action: [ :currentElement |
						currentElement phlow spawnObject: currentElement ].
				anAction contextMenuAction
					label: 'Inspect object';
					action: [ :currentElement :currentObject |
						currentElement phlow spawnObject: currentObject ].
				anAction contextMenuAction
					label: 'Inspect selection index';
					action: [ :currentElement :currentObject :currentIndex |
						currentElement phlow spawnObject: currentIndex ].
				anAction contextMenuAction
					label: 'Inspect parameters';
					action: [ :currentElement :currentObject :currentIndex |
						currentElement phlow spawnObject: {
							currentElement . currentObject . currentIndex } ].
				anAction contextMenuAction
					label: 'Inspect outer parameters';
					action: [ :currentElement |
						currentElement phlow 
							spawnObject: {anAction. anElement . anObject . aSelectionIndex} ].
							
				anAction contextMenuAction
					label: 'Show if greater than 12';
					action: [ :currentElement | currentElement phlow spawnObject: anElement ];
					showIf: [ :currentObject :aSelection | currentObject > 12]
					
			} ];
		send: [ :anObject :aSelectionIndex | {anObject . aSelectionIndex} ]
]

{ #category : #views }
GtRemotePhlowListViewContextActionsBasicTestObject >> gtListWithDynamicContextPhlowActionsMultipleSelectionFor: aView [
	<gtView>

	^aView list
		title: 'Dynamic context phlow - multiple selection';
		priority: 19.4;
		items: [ 10 to: 15 ];
		itemText: [ :anObject :aSelectionIndex | 
			'value: ', anObject printString, '; index: ', aSelectionIndex printString ];
		withMultipleSelection;
		dynamicPhlowContextItems: [ :anAction :anElement :anObject :aSelectionIndex |
			{
				anAction contextMenuAction
					label: 'Inspect element';
					action: [ :currentElement |
						currentElement phlow spawnObject: currentElement ].
				anAction contextMenuAction
					label: 'Inspect object';
					action: [ :currentElement :currentObject |
						currentElement phlow spawnObject: currentObject ].
				anAction contextMenuAction
					label: 'Inspect selection index';
					action: [ :currentElement :currentObject :currentIndex |
						currentElement phlow spawnObject: currentIndex ].
				anAction contextMenuAction
					label: 'Inspect parameters';
					action: [ :currentElement :currentObject :currentIndex |
						currentElement phlow spawnObject: {
							currentElement . currentObject . currentIndex } ].
				anAction contextMenuAction
					label: 'Inspect outer parameters';
					action: [ :currentElement |
						currentElement phlow spawnObject: {anAction. anElement . anObject . aSelectionIndex} ] 
			} ];
		send: [ :anObject :aSelectionIndex | {anObject . aSelectionIndex} ]
]

{ #category : #views }
GtRemotePhlowListViewContextActionsBasicTestObject >> gtListWithDynamicPhlowActionsFor: aView [
	<gtView>

	^aView list
		title: 'Dynamic action phlow';
		priority: 18.2;
		items: [ 10 to: 15 ];
		itemText: [ :anObject :aSelectionIndex | 
			'value: ', anObject printString, '; index: ', aSelectionIndex printString ];
		dynamicPhlowContextItems: [ :anAction :anElement :anObject :aSelectionIndex |
			{
				anAction button
					label: 'Inspect element';
					action: [ :currentElement |
						currentElement phlow spawnObject: currentElement ].
				anAction button
					label: 'Inspect object';
					action: [ :currentElement |
						currentElement phlow spawnObject: anObject ].
				anAction button
					label: 'Inspect selection index';
					action: [ :currentElement |
						currentElement phlow spawnObject: aSelectionIndex ].
				anAction button
					label: 'Inspect parameters';
					action: [ :currentElement |
						currentElement phlow spawnObject: {
							currentElement . anObject . aSelectionIndex} ].
				anAction button
					label: 'Inspect outer parameters';
					action: [ :currentElement |
						currentElement phlow spawnObject: {anElement . anObject . aSelectionIndex} ] 
			}, ((anObject > 12)
				ifTrue: [
					{GtPhlowAction noAction button
						label: 'Show if greater than 12';
						action: [ :currentElement |
							currentElement phlow spawnObject: anObject ]}
				] ifFalse: [#()]) ];
		send: [ :anObject :aSelectionIndex | {anObject . aSelectionIndex} ]
]

{ #category : #views }
GtRemotePhlowListViewContextActionsBasicTestObject >> gtListWithDynamicPhlowActionsMultipleSelectionFor: aView [
	<gtView>

	^aView list
		title: 'Dynamic action phlow - multiple selection';
		priority: 18.4;
		items: [ 10 to: 15 ];
		itemText: [ :anObject :aSelectionIndex | 
			'value: ', anObject printString, '; index: ', aSelectionIndex printString ];
		withMultipleSelection;
		dynamicPhlowContextItems: [ :anAction :anElement :anObject :aSelectionIndex |
			{
				anAction button
					label: 'Inspect element';
					action: [ :currentElement |
						currentElement phlow spawnObject: currentElement ].
				anAction button
					label: 'Inspect object';
					action: [ :currentElement |
						currentElement phlow spawnObject: anObject ].
				anAction button
					label: 'Inspect selection index';
					action: [ :currentElement |
						currentElement phlow spawnObject: aSelectionIndex ].
				anAction button
					label: 'Inspect parameters';
					action: [ :currentElement |
						currentElement phlow spawnObject: {
							currentElement . anObject . aSelectionIndex} ].
				anAction button
					label: 'Inspect outer parameters';
					action: [ :currentElement |
						currentElement phlow spawnObject: {anElement . anObject . aSelectionIndex} ] 
			} ];
		send: [ :anObject :aSelectionIndex | {anObject . aSelectionIndex} ]
]

{ #category : #views }
GtRemotePhlowListViewContextActionsBasicTestObject >> gtTreeWithBasicContext2ActionsFor: aView [
	<gtView>

	^aView columnedTree
		title: 'Columned Tree - Basic actions';
		priority: 29.9;
		items: [ 10 to: 15 ];
		children: [ :aNumber | 
			| targetNumber|
			targetNumber := aNumber \\ 10.
			(targetNumber // 2 = targetNumber)
				ifTrue: [ #() ] 
				ifFalse: [
					targetNumber // 2 to: (targetNumber - 1) ] ];
		column: 'Value' text: [ :x :anIndex | 'value: ', x asString, '; index: ', anIndex class name, '- ', anIndex   asString];
		contextItemLabel: 'Inspect element' action: [ :anElement |
				anElement phlow spawnObject: anElement ];
		contextItemLabel: 'Inspect object' action: [ :anElement :anObject |
				anElement phlow spawnObject: anObject ];
		contextItemLabel: 'Inspect selection index' action: [ :anElement :anObject :aSelection |
				anElement phlow spawnObject: aSelection ];
		contextItemLabel: 'Inspect parameters' action: [ :anElement :anObject :aSelection |
				anElement phlow spawnObject: {anElement . anObject . aSelection} ];
		send: [ :anObject :aSelection |
			{anObject . aSelection} ]
]

{ #category : #views }
GtRemotePhlowListViewContextActionsBasicTestObject >> gtTreeWithBasicContextActionsFor: aView [
	<gtView>

	^aView tree
		title: 'Tree - Basic actions';
		priority: 30;
		items: [ 10 to: 15 ];
		children: [ :aNumber | 
			| targetNumber|
			targetNumber := aNumber \\ 10.
			(targetNumber // 2 = targetNumber)
				ifTrue: [ #() ] 
				ifFalse: [
					targetNumber // 2 to: (targetNumber - 1) ] ];
		itemText: [ :x :aSelectionIndex | 
			'value: ', x asString, '; index: ', aSelectionIndex class name, ' - ', aSelectionIndex   asString];
		contextItemLabel: 'Inspect element' action: [ :anElement |
				anElement phlow spawnObject: anElement ];
		contextItemLabel: 'Inspect object' action: [ :anElement :anObject |
				anElement phlow spawnObject: anObject ];
		contextItemLabel: 'Inspect selection index' action: [ :anElement :anObject :aSelection |
				anElement phlow spawnObject: aSelection ];
		contextItemLabel: 'Inspect parameters' action: [ :anElement :anObject :aSelection |
				anElement phlow spawnObject: {anElement . anObject . aSelection} ];
		send: [ :anObject :aSelectionIndex |
			{anObject . aSelectionIndex} ]
]

{ #category : #views }
GtRemotePhlowListViewContextActionsBasicTestObject >> gtTreeWithBasicContextActionsMultipleSelectionFor: aView [
	<gtView>

	^aView tree
		title: 'Tree - Multiple Selection';
		priority: 35;
		items: [ 10 to: 15 ];
		children: [ :aNumber | 
			| targetNumber|
			targetNumber := aNumber \\ 10.
			(targetNumber // 2 = targetNumber)
				ifTrue: [ #() ] 
				ifFalse: [
					targetNumber // 2 to: (targetNumber - 1) ] ];
		itemText: [ :x :aSelectionIndex | 
			'value: ', x asString, '; index: ', aSelectionIndex class name, ' - ', aSelectionIndex   asString ];
		withMultipleSelection;
		contextItemLabel: 'Inspect element' action: [ :anElement |
				anElement phlow spawnObject: anElement ];
		contextItemLabel: 'Inspect object' action: [ :anElement :anObject |
				anElement phlow spawnObject: anObject ];
		contextItemLabel: 'Inspect selection index' action: [ :anElement :anObject :aSelection |
				anElement phlow spawnObject: aSelection ];
		contextItemLabel: 'Inspect parameters' action: [ :anElement :anObject :aSelection |
				anElement phlow spawnObject: {anElement . anObject . aSelection} ];
		send: [ :anObject :aSelectionIndex |
			{anObject . aSelectionIndex} ]
]

{ #category : #initialization }
GtRemotePhlowListViewContextActionsBasicTestObject >> initialize [
	super initialize.
	
	collectionOfObjects := { 
		42. 
		'Hello'. 
		44. 
		'Hello World'. 
		DateAndTime readFrom: '2021-04-06T14:43:50.123456+02:00' readStream }.
]
