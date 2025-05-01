Class {
	#name : #GtProxyAbstractCacheStrategy,
	#superclass : #Object,
	#category : #'Gt4PharoLink-Cache'
}

{ #category : #accessing }
GtProxyAbstractCacheStrategy >> removeFromCacheMessage: aMessage [
	"Remove the supplied message's cached value from the receiver"
	
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
GtProxyAbstractCacheStrategy >> send: aMessage withComputation: aBlockClosure [
	^ self subclassResponsibility
]
