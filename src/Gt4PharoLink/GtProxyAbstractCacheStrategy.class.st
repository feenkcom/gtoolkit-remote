Class {
	#name : #GtProxyAbstractCacheStrategy,
	#superclass : #Object,
	#category : #'Gt4PharoLink-Cache'
}

{ #category : #'as yet unclassified' }
GtProxyAbstractCacheStrategy >> send: aMessage withComputation: aBlockClosure [
	^ self subclassResponsibility
]
