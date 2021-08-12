Class {
	#name : #GtRemotePhlowDictionaryAssociationsIterator,
	#superclass : #GtRemotePhlowUnindexedCollectionIterator,
	#category : 'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #accessing }
GtRemotePhlowDictionaryAssociationsIterator >> iterationSelector [
	^ #associationsDo:
]
