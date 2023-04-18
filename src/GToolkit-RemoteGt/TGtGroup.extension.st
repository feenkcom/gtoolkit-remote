Extension { #name : #TGtGroup }

{ #category : #'*GToolkit-RemoteGt' }
TGtGroup >> asGPhlowItemsIterator [
	^ GtRemotePhlowSequenceableCollectionIterator forCollection: self
]
