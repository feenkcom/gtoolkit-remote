Extension { #name : 'SequenceableCollection' }

{ #category : '*GToolkit-RemotePhlow-InspectorExtensions' }
SequenceableCollection >> gtRemoteItemsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Items';
		priority: 50;
		items: [ self ];
		column: 'Index' 
			item: [ :eachItem :eachIndex | eachIndex  ]
			width: 45;
		column: 'Item' 
			item: [ :eachItem | eachItem gtDisplayString ].
]
