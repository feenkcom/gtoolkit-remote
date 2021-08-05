Extension { #name : 'Dictionary' }

{ #category : '*GToolkit-RemotePhlow-InspectorExtensions-Pharo' }
Dictionary >> gtRemoteItemsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Items';
		priority: 1;
		itemsProvider: [  
			GtRemotePhlowDictionaryAssociationsIterator forCollection: self ];
		column: 'Key' item: [ :assoc | assoc key ];
		column: 'Value' item: [ :assoc | assoc value ];
		send: [ :assoc | assoc value ]
]

{ #category : '*GToolkit-RemotePhlow-InspectorExtensions-Pharo' }
Dictionary >> gtRemoteKeysFor: aView [
	<gtView>
	^ aView list
		title: 'Keys';
		priority: 5;
		itemsProvider: [  
			GtRemotePhlowDictionaryKeysIterator forCollection: self ]
]
