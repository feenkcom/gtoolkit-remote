Extension { #name : #Collection }

{ #category : #'*GToolkit-RemotePhlow-PhlowViews' }
Collection >> asGPhlowItemsIterator [
	^ GtRemotePhlowGenericCollectionIterator forCollection: self
]
