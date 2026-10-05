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
		contextItemLabel: 'Inspect selection' action: [ :anElement :anObject :aSelection |
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
		contextItemLabel: 'Inspect selection' action: [ :anElement :anObject :aSelection |
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
GtRemotePhlowListViewContextActionsBasicTestObject >> gtListWithBasicContextActionsWithVariousOptionsFor: aView [
	<gtView>

	^aView list
		title: 'Basic actions - multiple options';
		priority: 30;
		items: [ 10 to: 15 ];
		itemText: [ :anObject :aSelectionIndex | 
			'value: ', anObject printString, '; index: ', aSelectionIndex printString ];
		contextItemIcon: (GtPhlowGlamorousVectorIconNameStencil new iconName: #inspect) 
			label: 'Inspect element' 
			action: [ :anElement |
				anElement phlow spawnObject: anElement ];
		contextItemLabel: 'Inspect object' 
			id:  GtRemotePhlowExampleCustomInspectActionId new
			action: [ :anElement :anObject |
				anElement phlow spawnObject: anObject ];
				
		send: [ :anObject :aSelectionIndex | {anObject . aSelectionIndex} ]
]

{ #category : #views }
GtRemotePhlowListViewContextActionsBasicTestObject >> gtListWithDynamicContextPhlowActionsFor: aView [
	<gtView>

	^aView list
		title: 'Dynamic context phlow';
		priority: 19.2;
		items: [ 10 to: 15 ];
		itemText: [ :anObject :aSelection | 
			'value: ', anObject printString, '; index: ', aSelection printString ];
		dynamicPhlowContextItems: [ :anAction :anElement :anObject :aSelection |
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
					label: 'Inspect selection';
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
							spawnObject: {anAction. anElement . anObject . aSelection} ].
							
				anAction contextMenuAction
					label: 'Show if greater than 12';
					action: [ :currentElement | currentElement phlow spawnObject: anElement ];
					showIf: [ :currentObject :currentSelection | currentObject > 12]
					
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
		itemText: [ :anObject :aSelection | 
			'value: ', anObject printString, '; index: ', aSelection printString ];
		withMultipleSelection;
		dynamicPhlowContextItems: [ :anAction :anElement :aCollectionOfObjects :aSelection |
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
					label: 'Inspect selection';
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
							spawnObject: {anAction. anElement . aCollectionOfObjects . aSelection} ] 
			}, (aSelection size = 3  
						ifTrue: [
							{anAction contextMenuAction
								label: 'Show if 3 elements in selection';
								action: [ :currentElement |
									currentElement phlow spawnObject: currentElement ]}] 
							ifFalse: [{}]),
						((aCollectionOfObjects includes: 14)
						ifTrue: [
							{anAction contextMenuAction
								label: 'Show if 14 in selection';
								action: [ :currentElement :currentCollectionOfObjects |
									currentElement phlow spawnObject: currentCollectionOfObjects ]}] 
						ifFalse: [{}]) ];
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
		dynamicPhlowContextItems: [ :anAction :anElement :anObject :aSelection |
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
					label: 'Inspect selection';
					action: [ :currentElement |
						currentElement phlow spawnObject: aSelection ].
				anAction button
					label: 'Inspect parameters';
					action: [ :currentElement |
						currentElement phlow spawnObject: {
							currentElement . anObject . aSelection} ].
				anAction button
					label: 'Inspect outer parameters';
					action: [ :currentElement |
						currentElement phlow spawnObject: {anElement . anObject . aSelection} ] 
			}, ((anObject > 12)
				ifTrue: [
					{anAction button
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
		dynamicPhlowContextItems: [ :anAction :anElement :aCollectionOfObjects :aSelection |
			{
				anAction button
					label: 'Inspect element';
					action: [ :currentElement |
						currentElement phlow spawnObject: currentElement ].
				anAction button
					label: 'Inspect object';
					action: [ :currentElement |
						currentElement phlow spawnObject: aCollectionOfObjects ].
				anAction button
					label: 'Inspect selection';
					action: [ :currentElement |
						currentElement phlow spawnObject: aSelection ].
				anAction button
					label: 'Inspect parameters';
					action: [ :currentElement |
						currentElement phlow spawnObject: {
							currentElement . aCollectionOfObjects . aSelection} ].
				anAction button
					label: 'Inspect outer parameters';
					action: [ :currentElement |
						currentElement phlow spawnObject: {anElement . aCollectionOfObjects . aSelection} ] 
			}, (aSelection size = 3  
						ifTrue: [
							{anAction button
								label: 'Show if 3 elements in selection';
								action: [ :currentElement |
									currentElement phlow spawnObject: currentElement ]}] 
							ifFalse: [{}]),
						((aCollectionOfObjects includes: 14)
						ifTrue: [
							{anAction button
								label: 'Show if 14 in selection';
								action: [ :currentElement |
									currentElement phlow spawnObject: aCollectionOfObjects ]}] 
						ifFalse: [{}]) ];
		send: [ :anObject :aSelectionIndex | {anObject . aSelectionIndex} ]
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
