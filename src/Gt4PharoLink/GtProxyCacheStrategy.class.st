Class {
	#name : #GtProxyCacheStrategy,
	#superclass : #GtProxyAbstractCacheStrategy,
	#instVars : [
		'storage',
		'matchingCondition'
	],
	#category : #'Gt4PharoLink-Cache'
}

{ #category : #'instance creation' }
GtProxyCacheStrategy class >> forSelectors: aCollection [
	"Answer an instance of the receiver configured to cache the supplied collection of selectors"

	^ self new matchingCondition:
		(GtProxyCacheSpecifiedSelectorsMatchingCondition new
			includeSelectors: aCollection)
]

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

{ #category : #accessing }
GtProxyCacheStrategy >> removeFromCacheMessage: aMessage [
	"Remove the supplied message's cached value from the receiver"
	
	storage removeKey: (self storageKeyFor: aMessage)
		ifAbsent: [].
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
