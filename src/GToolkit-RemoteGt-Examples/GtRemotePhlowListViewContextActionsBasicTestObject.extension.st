Extension { #name : #GtRemotePhlowListViewContextActionsBasicTestObject }

{ #category : #'*GToolkit-RemoteGt-Examples' }
GtRemotePhlowListViewContextActionsBasicTestObject >> gtListWithDynamicActionsFor: aView [
	<gtView>

	^aView list
		title: 'Dynamic actions';
		priority: 17;
		items: [ 10 to: 15 ];
		itemText: [ :anObject :aSelectionIndex | 
			'value: ', anObject printString, '; index: ', aSelectionIndex printString ];
		dynamicContextItems: [ :anElement :anObject :aSelection |
			{
				GtPhlowAction noAction button
					label: 'Inspect element';
					action: [ :currentElement |
						currentElement phlow spawnObject: currentElement ].
				GtPhlowAction noAction button
					label: 'Inspect object';
					action: [ :currentElement |
						currentElement phlow spawnObject: anObject ].
				GtPhlowAction noAction button
					label: 'Inspect selection';
					action: [ :currentElement |
						currentElement phlow spawnObject: aSelection ].
				GtPhlowAction noAction button
					label: 'Inspect parameters';
					action: [ :currentElement |
						currentElement phlow spawnObject: {currentElement . anObject . aSelection} ].
				GtPhlowAction noAction button
					label: 'Inspect outer parameters';
					action: [ :currentElement |
						currentElement phlow spawnObject: {anElement . anObject . aSelection} ] 
			}, ((anObject > 12)
				ifTrue: [
					{GtPhlowAction noAction button
						label: 'Show if greater than 12';
						action: [ :currentElement |
							currentElement phlow spawnObject: anObject ]}
				] ifFalse: [#()]) ];
	send: [ :anObject :aSelectionIndex |  {anObject . aSelectionIndex} ]
]

{ #category : #'*GToolkit-RemoteGt-Examples' }
GtRemotePhlowListViewContextActionsBasicTestObject >> gtListWithDynamicActionsMultipleSelectinFor: aView [
	<gtView>

	^aView list
		title: 'Dynamic - multiple selection';
		priority: 17.2;
		items: [ 10 to: 15 ];
		itemText: [ :anObject :aSelectionIndex | 
			'value: ', anObject printString, '; index: ', aSelectionIndex printString ];
		withMultipleSelection;
		dynamicContextItems: [ :anElement :anObject :aSelection |
			{
				GtPhlowAction noAction button
					label: 'Inspect element';
					action: [ :currentElement |
						currentElement phlow spawnObject: currentElement ].
				GtPhlowAction noAction button
					label: 'Inspect object';
					action: [ :currentElement |
						currentElement phlow spawnObject: anObject ].
				GtPhlowAction noAction button
					label: 'Inspect selection';
					action: [ :currentElement |
						currentElement phlow spawnObject: aSelection ].
				GtPhlowAction noAction button
					label: 'Inspect parameters';
					action: [ :currentElement |
						currentElement phlow spawnObject: {currentElement . anObject . aSelection} ].
				GtPhlowAction noAction button
					label: 'Inspect outer parameters';
					action: [ :currentElement |
						currentElement phlow spawnObject: {anElement . anObject . aSelection} ] 
			} ];
		send: [ :anObject :aSelectionIndex |  {anObject . aSelectionIndex} ]
]
