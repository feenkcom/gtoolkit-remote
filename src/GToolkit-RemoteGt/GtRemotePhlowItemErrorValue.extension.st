Extension { #name : #GtRemotePhlowItemErrorValue }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowItemErrorValue >> remoteExceptionWrapper [
	^ GtRemotePhlowItemExceptionWrapper new
		exceptionDescription: self itemText
]
