Extension { #name : 'Dictionary' }

{ #category : '*GToolkit-RemoteGt' }
Dictionary >> asGPhlowAssociationsIterator [
	^ GtRemotePhlowDictionaryAssociationsIterator forCollection: self
]

{ #category : '*GToolkit-RemoteGt' }
Dictionary >> asGPhlowKeysIterator [
	^ GtRemotePhlowDictionaryKeysIterator forCollection: self
]
