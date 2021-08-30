Class {
	#name : 'GtRemotePhlowDictionaryKeysIterator',
	#superclass : 'GtRemotePhlowUnindexedCollectionIterator',
	#category : 'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : 'accessing' }
GtRemotePhlowDictionaryKeysIterator >> iterationSelector [
	^ #keysDo:
]
