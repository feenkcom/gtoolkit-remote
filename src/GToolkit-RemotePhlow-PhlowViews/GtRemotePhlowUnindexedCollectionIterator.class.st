Class {
	#name : 'GtRemotePhlowUnindexedCollectionIterator',
	#superclass : 'GtRemotePhlowCollectionIterator',
	#instVars : [
		'iterationSelector'
	],
	#category : 'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : 'iterating' }
GtRemotePhlowUnindexedCollectionIterator >> forElementsFrom: startIndex to: endIndex withIndexDo: aBlock [
	| limitedStartIndex limitedEndIndex iterationIndex|
	
	limitedStartIndex := 1 max: startIndex.
	limitedEndIndex := targetCollection size min: endIndex.
	
	iterationIndex := 1.
	targetCollection perform: self iterationSelector with: [ :anElement |
		"Terminate the iteration if the last element was visited."
		iterationIndex > limitedEndIndex ifTrue: [ ^ self ].
		
		"While between the start and stop indexes visit each element."
		iterationIndex >= limitedStartIndex ifTrue: [ aBlock value: anElement value: iterationIndex ].
		iterationIndex := iterationIndex + 1 ]
]

{ #category : 'accessing' }
GtRemotePhlowUnindexedCollectionIterator >> iterationSelector [
	self subclassResponsibility
]
