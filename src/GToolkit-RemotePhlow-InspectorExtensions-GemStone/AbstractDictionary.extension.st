Extension { #name : 'AbstractDictionary' }

{ #category : '*GToolkit-RemotePhlow-InspectorExtensions-GemStone' }
AbstractDictionary >> gtRemoteItemsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Items';
		priority: 1;
		itemsProvider: [  
			GtRemotePhlowDictionaryAssociationsIterator forCollection: self ];
		column: 'Key' text: [ :assoc | assoc key ];
		column: 'Value' text: [ :assoc | assoc value ];
		send: [ :assoc | assoc value ]
]

{ #category : '*GToolkit-RemotePhlow-InspectorExtensions-GemStone' }
AbstractDictionary >> gtRemoteKeysFor: aView [
	<gtView>
	^ aView list
		title: 'Keys';
		priority: 5;
		itemsProvider: [  
			GtRemotePhlowDictionaryKeysIterator forCollection: self ]
]
