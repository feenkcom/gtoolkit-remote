Class {
	#name : #GtProxyNoCacheStrategy,
	#superclass : #GtProxyAbstractCacheStrategy,
	#traits : 'TGtUniqueInstance',
	#classTraits : 'TGtUniqueInstance classTrait',
	#category : #'Gt4PharoLink-Cache'
}

{ #category : #'as yet unclassified' }
GtProxyNoCacheStrategy >> appliesToMessage: aMessage [
	^ false
]

{ #category : #accessing }
GtProxyNoCacheStrategy >> removeFromCacheMessage: aMessage [
	"Remove the supplied message's cached value from the receiver.
	No action required."
]

{ #category : #accessing }
GtProxyNoCacheStrategy >> send: aMessage withComputation: aBlockClosure [
	^ aBlockClosure value
]
