Extension { #name : #TGtGroup }

{ #category : #'*GToolkit-RemotePhlow-PhlowViews' }
TGtGroup >> asGPhlowItemsIterator [
	^ GtRemotePhlowSequenceableCollectionIterator forCollection: self
]
