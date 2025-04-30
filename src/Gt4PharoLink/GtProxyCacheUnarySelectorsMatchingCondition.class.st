Class {
	#name : #GtProxyCacheUnarySelectorsMatchingCondition,
	#superclass : #GtProxyCacheMatchingCondition,
	#category : #'Gt4PharoLink-Cache'
}

{ #category : #'as yet unclassified' }
GtProxyCacheUnarySelectorsMatchingCondition >> appliesToMessage: aMessage [
	^ aMessage selector isUnary
]
