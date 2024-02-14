Extension { #name : #SequenceableCollection }

{ #category : #'*GToolkit-RemotePhlow-InspectorExtensions-Remote' }
SequenceableCollection >> gtItemsFor: aView [
	^ aView columnedList
		title: 'Items';
		priority: 50;
		items: [ self ];
		column: 'Index' 
			text: [ :eachItem :eachIndex | eachIndex  ]
			width: 45;
		column: 'Item' 
			text: [ :eachItem | eachItem gtDisplayString ].
]
