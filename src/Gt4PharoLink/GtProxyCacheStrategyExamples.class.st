Class {
	#name : #GtProxyCacheStrategyExamples,
	#superclass : #Object,
	#traits : 'TAssertable',
	#classTraits : 'TAssertable classTrait',
	#category : #'Gt4PharoLink-Examples'
}

{ #category : #examples }
GtProxyCacheStrategyExamples >> cacheForMatchingSelectors [
	<gtExample>
	<return: #GtProxyCacheStrategy>
	| matchingCondition cache computation result1 result2 message |
	matchingCondition := GtProxyCacheSpecifiedSelectorsMatchingCondition new
			includeSelectors: #(#foo1 #foo2).
	cache := GtProxyCacheStrategy new matchingCondition: matchingCondition.
	computation := [ :x | x + 1 ].
	message := Message selector: #foo1.	"First call should compute"
	result1 := cache send: message withComputation: [ computation value: 41 ].	"Second call with same selector should get cached value, computation block is not evaluated"
	result2 := cache
			send: message
			withComputation: [ self error: 'Should not be called' ].
	self assert: result1 equals: 42.
	self assert: result2 equals: 42.
	^ cache
]

{ #category : #examples }
GtProxyCacheStrategyExamples >> cacheSpecifiedSelector [
	"Create and test caching behavior with assertions"

	<gtExample>
	<return: #GtProxyCacheStrategyExamples>
	| cache message result1 result2 |
	cache := GtProxyCacheStrategy new.
	cache
		matchingCondition: (GtProxyCacheSpecifiedSelectorsMatchingCondition new
				includeSelectors: #(#foo1 #foo2)).

	message := Message selector: #foo1.
	result1 := cache send: message withComputation: [ 'computed value!' ].
	result2 := cache send: message withComputation: [ 'should not be used' ].

	self assert: result1 equals: 'computed value!'.
	self assert: result2 equals: 'computed value!'
]

{ #category : #examples }
GtProxyCacheStrategyExamples >> noCacheForNonMatchingSelectors [
	<gtExample>
	<return: #GtProxyCacheStrategy>
	| matchingCondition cache callCount result1 result2 message |
	matchingCondition := GtProxyCacheSpecifiedSelectorsMatchingCondition new
			includeSelectors: #(#foo1 #foo2).
	cache := GtProxyCacheStrategy new matchingCondition: matchingCondition.
	callCount := 0.
	message := Message selector: #bar.

	result1 := cache
			send: message
			withComputation: [ callCount := callCount + 1.
				40 ].
	result2 := cache
			send: message
			withComputation: [ callCount := callCount + 1.
				40 ].
	self assert: callCount equals: 2.
	self assert: result1 equals: 40.
	self assert: result2 equals: 40.
	^ cache
]

{ #category : #examples }
GtProxyCacheStrategyExamples >> removeFromCacheMessage [
	<gtExample>
	<return: #GtProxyCacheStrategy>
	| cache result1 result2 message |
	cache := GtProxyCacheStrategy forSelectors: #(#foo1).
	message := Message selector: #foo1.

	result1 := cache send: message withComputation: [ 1 ].
	cache removeFromCacheMessage: message.	"Second call with same selector should get cached value, computation block is not evaluated"
	result2 := cache send: message withComputation: [ 2 ].
	self assert: result1 equals: 1.
	self assert: result2 equals: 2.
	^ cache
]
