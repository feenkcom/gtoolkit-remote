Extension { #name : 'AbstractDictionary' }

{ #category : '*GToolkit-RemotePhlow-InspectorExtensions-GemStone' }
AbstractDictionary >> asGPhlowAssociationsIterator [
	^ GtRemotePhlowDictionaryAssociationsIterator forCollection: self
]

{ #category : '*GToolkit-RemotePhlow-InspectorExtensions-GemStone' }
AbstractDictionary >> asGPhlowKeysIterator [
	^ GtRemotePhlowDictionaryKeysIterator forCollection: self
]

{ #category : '*GToolkit-RemotePhlow-InspectorExtensions-GemStone' }
AbstractDictionary >> gtRemoteItemsFor: aView [
	^ aView columnedList
		title: 'Items';
		priority: 1;
		items: [ self asGPhlowAssociationsIterator ];
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
		items: [ self asGPhlowKeysIterator ]
]
