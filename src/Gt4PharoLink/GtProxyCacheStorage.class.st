Class {
	#name : #GtProxyCacheStorage,
	#superclass : #Object,
	#category : #'Gt4PharoLink-Cache'
}

{ #category : #'as yet unclassified' }
GtProxyCacheStorage >> at: aKey ifAbsentPut: aBlockClosure [
	self subclassResponsibility
]
