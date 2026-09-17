Extension { #name : #GtRemotePhlowListViewContextActionsBasicTestObject }

{ #category : #'*GToolkit-RemoteGt-Examples' }
GtRemotePhlowListViewContextActionsBasicTestObject >> gtListWithDynamicActionsFor: aView [
	<gtView>

	^aView list
		title: 'Dynamic actions';
		priority: 17;
		items: [ collectionOfObjects ];
		itemText: [ :anObject :anIndex | anObject printString, '; index: ', anIndex printString ];
		dynamicContextItems: [ :anElement :anObject :anIndex |
			{
				GtPhlowAction noAction button
					label: 'Inspect element';
					action: [ :currentElement |
						currentElement phlow spawnObject: anElement ].
				GtPhlowAction noAction button
					label: 'Inspect object';
					action: [ :currentElement |
						currentElement phlow spawnObject: anObject ].
				GtPhlowAction noAction button
					label: 'Inspect index';
					action: [ :currentElement |
						currentElement phlow spawnObject: anIndex ] 
			} ]
]
