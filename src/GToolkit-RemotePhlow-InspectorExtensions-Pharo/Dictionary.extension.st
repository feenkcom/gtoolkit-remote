Extension { #name : 'Dictionary' }

{ #category : '*GToolkit-RemotePhlow-InspectorExtensions-Pharo' }
Dictionary >> gtRemoteItemsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Items';
		priority: 1;
		items: [ self asGPhlowAssociationsIterator ];
		column: 'Key' text: [ :assoc | assoc key ];
		column: 'Value' text: [ :assoc | assoc value ];
		send: [ :assoc | assoc value ]
]

{ #category : '*GToolkit-RemotePhlow-InspectorExtensions-Pharo' }
Dictionary >> gtRemoteKeysFor: aView [
	<gtView>
	^ aView list
		title: 'Keys';
		priority: 5;
		items: [ self asGPhlowKeysIterator ]
]
