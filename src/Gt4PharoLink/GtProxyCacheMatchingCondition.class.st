Class {
	#name : #GtProxyCacheMatchingCondition,
	#superclass : #Object,
	#category : #'Gt4PharoLink-Cache'
}

{ #category : #'as yet unclassified' }
GtProxyCacheMatchingCondition >> appliesToMessage: aMessage [
	^ self subclassResponsibility
]
