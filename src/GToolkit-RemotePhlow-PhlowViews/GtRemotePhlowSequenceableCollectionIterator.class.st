Class {
	#name : #GtRemotePhlowSequenceableCollectionIterator,
	#superclass : #GtRemotePhlowCollectionIterator,
	#category : 'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #iterating }
GtRemotePhlowSequenceableCollectionIterator >> forElementsFrom: startIndex to: endIndex withIndexDo: aBlock [
	| limitedStartIndex limitedEndIndex |
	
	limitedStartIndex := 1 max: startIndex.
	limitedEndIndex := targetCollection size min: endIndex.
	limitedStartIndex to: limitedEndIndex do: [ :anIndex |
		aBlock value: (targetCollection at: anIndex) value: anIndex ]
]
