Extension { #name : #GtRemotePhlowId }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowId >> asBlocElementCode [
	<return: #String>
	^ self asSymbol printString
]

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowId >> asElementQuerySelector [
	^ BlElementQueryByIdStep new elementId: self
]
