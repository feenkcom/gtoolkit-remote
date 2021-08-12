Extension { #name : #Dictionary }

{ #category : #'*GToolkit-RemotePhlow-Pharo' }
Dictionary >> asGPhlowAssociationsIterator [
	^ GtRemotePhlowDictionaryAssociationsIterator forCollection: self
]

{ #category : #'*GToolkit-RemotePhlow-Pharo' }
Dictionary >> asGPhlowKeysIterator [
	^ GtRemotePhlowDictionaryKeysIterator forCollection: self
]
