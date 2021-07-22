Extension { #name : #String }

{ #category : #'*GToolkit-RemoteGt' }
String >> gtRemoteSubstringMatch [
	^ GtRemoteSubstringFilter substring: self
]
