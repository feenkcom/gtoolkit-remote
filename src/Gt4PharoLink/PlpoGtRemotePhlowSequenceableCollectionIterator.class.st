Class {
	#name : #PlpoGtRemotePhlowSequenceableCollectionIterator,
	#superclass : #PharoLinkProxyObject,
	#category : #'Gt4PharoLink-Proxies'
}

{ #category : #accessing }
PlpoGtRemotePhlowSequenceableCollectionIterator class >> remoteClassName [
	^ #GtRemotePhlowSequenceableCollectionIterator
]

{ #category : #accessing }
PlpoGtRemotePhlowSequenceableCollectionIterator >> retrieveItems: anItemsCount fromIndex: startIndex [
	| computedElements endIndex remoteElements |

	computedElements := OrderedCollection new: anItemsCount.
	endIndex := startIndex + anItemsCount - 1.
	
	remoteElements := self 
		proxyPerform: #retrieveItems:fromIndex:
		withPrimitiveArguments: {anItemsCount . startIndex} .
	
	1 to: remoteElements size do: [ :anIndex | 
		computedElements add: (remoteElements 
			proxyPerform: #at: 
			withPrimitiveArguments: {anIndex}) ].
	
	^ computedElements
]
