Class {
	#name : #GtProxyNoCacheStrategy,
	#superclass : #GtProxyAbstractCacheStrategy,
	#category : #'Gt4PharoLink-Cache'
}

{ #category : #'as yet unclassified' }
GtProxyNoCacheStrategy >> appliesToMessage: aMessage [
	^ false
]

{ #category : #accessing }
GtProxyNoCacheStrategy >> send: aMessage withComputation: aBlockClosure [
	^ aBlockClosure value
]
