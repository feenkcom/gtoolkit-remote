Class {
	#name : #GtRemotePhlowCollectionIterator,
	#superclass : #Object,
	#instVars : [
		'targetCollection'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #'as yet unclassified' }
GtRemotePhlowCollectionIterator class >> forCollection: aCollection [
	^ self new
		targetCollection: aCollection
]

{ #category : #converting }
GtRemotePhlowCollectionIterator >> asGPhlowItemsIterator [
	^ self
]

{ #category : #iterating }
GtRemotePhlowCollectionIterator >> forElementsFrom: startIndex to: endIndex withIndexDo: aBlock [
	self subclassResponsibility
]

{ #category : #iterating }
GtRemotePhlowCollectionIterator >> retrieveItems: anItemsCount fromIndex: startIndex [
	| computedElements endIndex |

	computedElements := OrderedCollection new: anItemsCount.
	endIndex := startIndex + anItemsCount - 1.
	
	self 
		forElementsFrom: startIndex 
		to: endIndex 
		withIndexDo: [ :anItem :anIndex |
			computedElements add: anItem ].
	
	^ computedElements asArray
]

{ #category : #accessing }
GtRemotePhlowCollectionIterator >> targetCollection: aCollection [
	targetCollection := aCollection
]

{ #category : #accessing }
GtRemotePhlowCollectionIterator >> totalItemsCount [
	^ targetCollection 
		ifNil: [ 0 ] 
		ifNotNil:  [ :aCollection | aCollection size ]
]
