Extension { #name : #GtRemotePhlowBasicId }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowBasicId >> asBlocElementCode [
	^ self class name asString
]

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowBasicId class >> asElementQuerySelector [
	^ BlElementQueryByIdStep new elementId: self
]
