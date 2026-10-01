Class {
	#name : #GtRemotePhlowColumnedListViewContextActionsBasicTestObject,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #'gt - views' }
GtRemotePhlowColumnedListViewContextActionsBasicTestObject >> gtColumnedListWithBasicContextActionsFor: aView [
	<gtView>

	^aView columnedList
		title: 'Basic actions';
		priority: 15;
		items: [ 10 to: 15 ];
		column: 'Value' text: [ :x :anIndex | 
			'value: ', x printString, '; index: ', anIndex printString ];
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

{ #category : #'gt - views' }
GtRemotePhlowColumnedListViewContextActionsBasicTestObject >> gtColumnedListWithBasicContextActionsMultipleSelectionFor: aView [
	<gtView>

	^aView columnedList
		title: 'Basic - multiple selection';
		priority: 15.1;
		items: [ 10 to: 15 ];
		column: 'Value' text: [ :x :anIndex | 
			'value: ', x printString, '; index: ', anIndex printString ];
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
			showIf: [ :anObject :aSelection | aSelection size = 3 ];
		contextItemLabel: 'Show if 14 in selection' 
			action: [ :anElement :aCollectionOfObjects | 
				anElement phlow spawnObject: aCollectionOfObjects ]
			showIf: [ :aCollectionOfObjects :aSelection | 
				aCollectionOfObjects includes: 14 ];
		send: [ :anObject :aSelectionIndex | {anObject . aSelectionIndex} ]
]

{ #category : #'gt - views' }
GtRemotePhlowColumnedListViewContextActionsBasicTestObject >> gtColumnedListWithDynamicContextPhlowActionsFor: aView [
	<gtView>

	^aView columnedList
		title: 'Dynamic context phlow';
		priority: 19.2;
		items: [ 10 to: 15 ];
		column: 'Value' text: [ :x :anIndex | 
			'value: ', x printString, '; index: ', anIndex printString ];
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

{ #category : #'gt - views' }
GtRemotePhlowColumnedListViewContextActionsBasicTestObject >> gtColumnedListWithDynamicContextPhlowActionsMultipleSelectionFor: aView [
	<gtView>

	^aView columnedList
		title: 'Dynamic context phlow - multiple selection';
		priority: 19.4;
		items: [ 10 to: 15 ];
		column: 'Value' text: [ :x :anIndex | 
			'value: ', x printString, '; index: ', anIndex printString ];
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
