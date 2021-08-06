Extension { #name : 'Dictionary' }

{ #category : '*GToolkit-RemotePhlow-InspectorExtensions-GtAndPharo' }
Dictionary >> asGPhlowAssociationsIterator [
	^ GtRemotePhlowDictionaryAssociationsIterator forCollection: self
]

{ #category : '*GToolkit-RemotePhlow-InspectorExtensions-GtAndPharo' }
Dictionary >> asGPhlowKeysIterator [
	^ GtRemotePhlowDictionaryKeysIterator forCollection: self
]
