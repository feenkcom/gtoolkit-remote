Extension { #name : 'Collection' }

{ #category : '*GToolkit-RemotePhlow-InspectorExtensions-Remote' }
Collection >> gtItemsFor: aView [
	<gtView>
	^ aView list
		title: 'Items';
		priority: 50;
		items: [ self ];
		itemText: [ :eachItem | eachItem gtDisplayString ]
]
