Extension { #name : #SequenceableCollection }

{ #category : #'*GToolkit-RemotePhlow-PhlowViews' }
SequenceableCollection >> asGPhlowItemsIterator [
	^ GtRemotePhlowSequenceableCollectionIterator forCollection: self
]
