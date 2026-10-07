Class {
	#name : #GtRemotePhlowColumnedTreeViewContextActionsBasicTestObject,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #views }
GtRemotePhlowColumnedTreeViewContextActionsBasicTestObject >> gtColumnedTreeWithBasicContextActionsFor: aView [
	<gtView>

	^aView columnedTree
		title: 'Columned Tree - Basic actions';
		priority: 15;
		items: [ 10 to: 15 ];
		children: [ :aNumber | 
			| targetNumber|
			targetNumber := aNumber \\ 10.
			(targetNumber // 2 = targetNumber)
				ifTrue: [ #() ] 
				ifFalse: [
					(targetNumber // 2 to: (targetNumber - 1)) collect: [ :each | each + 10 ] ] ];
		column: 'Value' text: [ :x | 'value: ', x asString ];
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
		send: [ :anObject :aSelection |
			{anObject . aSelection} ]
]

{ #category : #views }
GtRemotePhlowColumnedTreeViewContextActionsBasicTestObject >> gtColumnedTreeWithBasicContextActionsMultipleSelectionFor: aView [
	<gtView>

	^aView columnedTree
		title: 'Columned Tree - Multiple Selection';
		priority: 15.1;
		items: [ 10 to: 15 ];
		children: [ :aNumber | 
			| targetNumber|
			targetNumber := aNumber \\ 10.
			(targetNumber // 2 = targetNumber)
				ifTrue: [ #() ] 
				ifFalse: [
					(targetNumber // 2 to: (targetNumber - 1)) collect: [ :each | each + 10 ] ] ];
		column: 'Value' text: [ :x | 'value: ', x asString ];
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
		send: [ :anObject :aSelection |
			{anObject . aSelection} ]
]

{ #category : #views }
GtRemotePhlowColumnedTreeViewContextActionsBasicTestObject >> gtColumnedTreeWithDynamicContextPhlowActionsFor: aView [
	<gtView>

	^aView columnedTree
		title: 'Dynamic context phlow';
		priority: 19.2;
		items: [ 10 to: 15 ];
		children: [ :aNumber | 
			| targetNumber|
			targetNumber := aNumber \\ 10.
			(targetNumber // 2 = targetNumber)
				ifTrue: [ #() ] 
				ifFalse: [
					(targetNumber // 2 to: (targetNumber - 1)) collect: [ :each | each + 10 ] ] ];
		column: 'Value' text: [ :x | 'value: ', x asString ];
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
GtRemotePhlowColumnedTreeViewContextActionsBasicTestObject >> gtColumnedTreeWithDynamicContextPhlowActionsMultipleSelectionFor: aView [
	<gtView>

	^aView columnedTree
		title: 'Dynamic context phlow - multiple selection';
		priority: 19.4;
		items: [ 10 to: 15 ];
		children: [ :aNumber | 
			| targetNumber|
			targetNumber := aNumber \\ 10.
			(targetNumber // 2 = targetNumber)
				ifTrue: [ #() ] 
				ifFalse: [
					targetNumber // 2 to: (targetNumber - 1) ] ];
		column: 'Value' text: [ :x | 'value: ', x asString ];
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
