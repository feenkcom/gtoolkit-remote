Extension { #name : 'Collection' }

{ #category : '*GToolkit-RemotePhlow-InspectorExtensions' }
Collection >> gtRemoteItemsFor: aView [
	<gtView>
	^ aView list
		title: 'Items';
		priority: 50;
		itemsProvider: [  
			GtRemotePhlowGenericCollectionIterator forCollection: self ];
		itemText: [ :eachItem | eachItem gtDisplayString ]
]
