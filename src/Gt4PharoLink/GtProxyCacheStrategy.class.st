Class {
	#name : #GtProxyCacheStrategy,
	#superclass : #GtProxyAbstractCacheStrategy,
	#instVars : [
		'storage',
		'matchingCondition'
	],
	#category : #'Gt4PharoLink-Cache'
}

{ #category : #testing }
GtProxyCacheStrategy >> appliesToMessage: aMessage [
	^ matchingCondition appliesToMessage: aMessage
]

{ #category : #private }
GtProxyCacheStrategy >> cachedValueFor: aMessage ifAbsentPut: aBlockClosure [ 
	^ storage 
		at: (self storageKeyFor: aMessage)
		ifAbsentPut: aBlockClosure
]

{ #category : #initialization }
GtProxyCacheStrategy >> initialize [ 
	super initialize.
	
	storage := GtProxyCacheStaticStorage new.
	matchingCondition := GtProxyCacheNoMatchingCondition new.
]

{ #category : #initialization }
GtProxyCacheStrategy >> matchAllUnarySelectors [
	matchingCondition := GtProxyCacheUnarySelectorsMatchingCondition new
]

{ #category : #initialization }
GtProxyCacheStrategy >> matchUnarySelectors: aListOfSelectors [
	matchingCondition := GtProxyCacheUnarySelectorsMatchingCondition new
]

{ #category : #accessing }
GtProxyCacheStrategy >> matchingCondition [
	^ matchingCondition
]

{ #category : #accessing }
GtProxyCacheStrategy >> matchingCondition: anObject [
	matchingCondition := anObject
]

{ #category : #'as yet unclassified' }
GtProxyCacheStrategy >> send: aMessage withComputation: aBlockClosure [
	(self appliesToMessage: aMessage)
		ifFalse: [ ^ aBlockClosure value ].
		
	^ self cachedValueFor: aMessage ifAbsentPut: aBlockClosure
]

{ #category : #private }
GtProxyCacheStrategy >> storageKeyFor: aMessage [
	^ aMessage selector
]
