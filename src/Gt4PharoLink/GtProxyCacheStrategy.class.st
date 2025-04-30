Class {
	#name : #GtProxyCacheStrategy,
	#superclass : #GtProxyAbstractCacheStrategy,
	#instVars : [
		'storage',
		'matchingCondition'
	],
	#category : #'Gt4PharoLink-Cache'
}

{ #category : #'as yet unclassified' }
GtProxyCacheStrategy >> appliesToMessage: aMessage [
	^ matchingCondition appliesToMessage: aMessage
]

{ #category : #'as yet unclassified' }
GtProxyCacheStrategy >> cachedValueFor: aMessage ifAbsentPut: aBlockClosure [ 
	^ storage 
		at: (self storageKeyFor: aMessage)
		ifAbsentPut: aBlockClosure
]

{ #category : #'as yet unclassified' }
GtProxyCacheStrategy >> initialize [ 
	super initialize.
	
	storage := GtProxyCacheStaticStorage new.
	matchingCondition := GtProxyCacheNoMatchingCondition new.
]

{ #category : #'as yet unclassified' }
GtProxyCacheStrategy >> matchAllUnarySelectors [
	matchingCondition := GtProxyCacheUnarySelectorsMatchingCondition new
]

{ #category : #'as yet unclassified' }
GtProxyCacheStrategy >> matchUnarySelectors: aListOfSelectors [
	matchingCondition := GtProxyCacheUnarySelectorsMatchingCondition new
]

{ #category : #'as yet unclassified' }
GtProxyCacheStrategy >> send: aMessage withComputation: aBlockClosure [
	(self appliesToMessage: aMessage)
		ifFalse: [ ^ aBlockClosure value ].
		
	^ self cachedValueFor: aMessage ifAbsentPut: aBlockClosure
]

{ #category : #'as yet unclassified' }
GtProxyCacheStrategy >> storageKeyFor: aMessage [
	^ aMessage selector
]
