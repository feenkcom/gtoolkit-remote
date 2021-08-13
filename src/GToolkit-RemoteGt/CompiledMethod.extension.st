Extension { #name : 'CompiledMethod' }

{ #category : '*GToolkit-RemoteGt' }
CompiledMethod >> gtRemoteStoreOn: aStream [

	self methodClass gtRemoteStoreOn: aStream.
	aStream nextPutAll: '>>'.
	self selector gtRemoteStoreOn: aStream
]
