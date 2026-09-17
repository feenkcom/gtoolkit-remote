Class {
	#name : #GtRemotePhlowListViewContextActionsBasicTestObject,
	#superclass : #Object,
	#instVars : [
		'collectionOfObjects'
	],
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #views }
GtRemotePhlowListViewContextActionsBasicTestObject >> gtListWithBasicContextActionsFor: aView [
	<gtView>

	^aView list
		title: 'Basic actions';
		priority: 15;
		items: [ collectionOfObjects ];
		itemText: [ :anObject :anIndex | anObject printString, '; index: ', anIndex printString ];
		contextItemLabel: 'Inspect element' action: [ :anElement |
				anElement phlow spawnObject: anElement ];
		contextItemLabel: 'Inspect object' action: [ :anElement :anObject |
				anElement phlow spawnObject: anObject ];
		contextItemLabel: 'Inspect index' action: [ :anElement :anObject :anIndex |
				anElement phlow spawnObject: anIndex ];
		send: [ :anObject :aSelection | anObject ]
]

{ #category : #views }
GtRemotePhlowListViewContextActionsBasicTestObject >> gtListWithBasicContextActionsMultipleSelectionFor: aView [
	<gtView>

	^aView list
		title: 'Basic Multiple Selection';
		priority:15.1;
		items: [ collectionOfObjects ];
		withMultipleSelection;
		contextItemLabel: 'Inspect element' action: [ :anElement |
				anElement phlow spawnObject: anElement ];
		contextItemLabel: 'Inspect object' action: [ :anElement :anObject |
				anElement phlow spawnObject: anObject ];
		contextItemLabel: 'Inspect index' action: [ :anElement :anObject :anIndex |
				anElement phlow spawnObject: anIndex ];
		send: [ :anObject :aSelection | anObject ]
]

{ #category : #views }
GtRemotePhlowListViewContextActionsBasicTestObject >> gtListWithDynamicActionsMultipleSelectinFor: aView [
	<gtView>

	^aView list
		title: 'Dynamic actions - Multiple Selection';
		priority: 17.2;
		items: [ collectionOfObjects ];
		itemText: [ :anObject :anIndex | anObject printString, '; index: ', anIndex printString ];
		withMultipleSelection;
		dynamicContextItems: [ :anElement :anObject :anIndex |
			{'Action' -> [ :a :b |] } ]
]

{ #category : #views }
GtRemotePhlowListViewContextActionsBasicTestObject >> gtListWithDynamicPhlowActionsFor: aView [
	<gtView>

	^aView list
		title: 'Dynamic phlow actions';
		priority: 18.2;
		items: [ collectionOfObjects ];
		itemText: [ :anObject :anIndex | anObject printString, '; index: ', anIndex printString ];
		dynamicPhlowContextItems: [ :anAction :anElement :anObject :anIndex |
			{
				anAction button
					label: 'Inspect element';
					action: [ :currentElement |
						currentElement phlow spawnObject: anElement ].
				anAction button
					label: 'Inspect object';
					action: [ :currentElement |
						currentElement phlow spawnObject: anObject ].
				anAction button
					label: 'Inspect index';
					action: [ :currentElement |
						currentElement phlow spawnObject: anIndex ] 
			} ]
]

{ #category : #views }
GtRemotePhlowListViewContextActionsBasicTestObject >> gtTreeWithBasicContextActionsFor: aView [
	<gtView>

	^aView tree
		title: 'Tree - Basic actions';
		priority: 30;
		items: [ 1 to: 5 ];
		children: [ :aNumber | 
			(aNumber // 2 = aNumber)
				ifTrue: [ #() ] 
				ifFalse: [
					aNumber // 2 to: (aNumber - 1) ] ];
		itemText: [ :x :anIndex | x asString, ' number; index: ', anIndex  asString];
		contextItemLabel: 'Inspect first object' 
			action: [ :anElement :anObject |
				anElement phlow spawnObject: anObject ];
		contextItemLabel: 'Inspect first index' 
			action: [ :anElement :anObject |
				anElement phlow spawnObject: 'TODO' ];
		send: [ :anObject :aSelection |
			anObject ]
]

{ #category : #views }
GtRemotePhlowListViewContextActionsBasicTestObject >> gtTreeWithBasicContextActionsMultipleSelectionFor: aView [
	<gtView>

	^aView tree
		title: 'Tree - Multiple Selection';
		priority: 35;
		items: [ 1 to: 5 ];
		children: [ :aNumber | 
			(aNumber // 2 = aNumber)
				ifTrue: [ #() ] 
				ifFalse: [
					aNumber // 2 to: (aNumber - 1) ] ];
		itemText: [ :x :anIndex | x asString, ' number; index: ', anIndex  asString];
		withMultipleSelection;
		contextItemLabel: 'Inspect first object' 
			action: [ :anElement :anObject |
				anElement phlow spawnObject: anObject ];
		contextItemLabel: 'Inspect first index' 
			action: [ :anElement :anObject |
				anElement phlow spawnObject: 'TODO' ];
		send: [ :anObject :aSelection |
			anObject ]
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
