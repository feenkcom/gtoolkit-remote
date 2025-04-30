Class {
	#name : #GtProxyCacheStaticStorage,
	#superclass : #GtProxyCacheStorage,
	#instVars : [
		'cachedResults'
	],
	#category : #'Gt4PharoLink-Cache'
}

{ #category : #'as yet unclassified' }
GtProxyCacheStaticStorage >> at: aKey ifAbsentPut: aBlockClosure [
	^ cachedResults at: aKey ifAbsentPut: aBlockClosure
]

{ #category : #'as yet unclassified' }
GtProxyCacheStaticStorage >> initialize [

	super initialize.
	cachedResults := Dictionary new.
]
