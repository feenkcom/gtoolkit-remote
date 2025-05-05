Class {
	#name : #GtProxyCacheMatchingConditionExamples,
	#superclass : #Object,
	#traits : 'TAssertable',
	#classTraits : 'TAssertable classTrait',
	#category : #'Gt4PharoLink-Examples'
}

{ #category : #examples }
GtProxyCacheMatchingConditionExamples >> noMatchingCondition [
	<gtExample>
	<return: #GtProxyCacheMatchingConditionExamples>
	self deny: (GtProxyCacheNoMatchingCondition new appliesToMessage: #anything)
]

{ #category : #examples }
GtProxyCacheMatchingConditionExamples >> specificSelectorsMatchingConditionCachesFoo [
	<gtExample>
	<return: #GtProxyCacheSpecifiedSelectorsMatchingCondition>
	| matchingCondition |
	matchingCondition := GtProxyCacheSpecifiedSelectorsMatchingCondition new.
	matchingCondition includeSelector: #foo.
	self assert: (matchingCondition appliesToMessage: (Message selector: #foo)).
	self deny: (matchingCondition appliesToMessage: (Message selector: #bar)).
	^ matchingCondition
]

{ #category : #examples }
GtProxyCacheMatchingConditionExamples >> specificSelectorsMatchingConditionCachesFooPattern [
	<gtExample>
	<return: #GtProxyCacheSpecifiedSelectorsMatchingCondition>
	| matchingCondition |
	matchingCondition := GtProxyCacheSpecifiedSelectorsMatchingCondition new.
	matchingCondition includePattern: 'foo.*'.
	self assert: (matchingCondition appliesToMessage: (Message selector: #foo)).
	self assert: (matchingCondition appliesToMessage: (Message selector: #foobar)).
	self deny: (matchingCondition appliesToMessage: (Message selector: #barfoo)).
	^ matchingCondition
]

{ #category : #examples }
GtProxyCacheMatchingConditionExamples >> specificSelectorsMatchingConditionCachesFooPatternNotFoobPattern [
	<gtExample>
	<return: #GtProxyCacheSpecifiedSelectorsMatchingCondition>
	| matchingCondition |
	matchingCondition := GtProxyCacheSpecifiedSelectorsMatchingCondition new.
	matchingCondition
		includePattern: 'foo.*';
		excludePattern: 'foob.*'.
	self assert: (matchingCondition appliesToMessage: (Message selector: #foo)).
	self assert: (matchingCondition appliesToMessage: (Message selector: #fooey)).
	self deny: (matchingCondition appliesToMessage: (Message selector: #foobar)).
	^ matchingCondition
]

{ #category : #examples }
GtProxyCacheMatchingConditionExamples >> specificSelectorsMatchingConditionCachesFooPatternNotFoobar [
	<gtExample>
	<return: #GtProxyCacheSpecifiedSelectorsMatchingCondition>
	| matchingCondition |
	matchingCondition := GtProxyCacheSpecifiedSelectorsMatchingCondition new.
	matchingCondition
		includePattern: 'foo.*';
		excludeSelector: #foobar.
	self assert: (matchingCondition appliesToMessage: (Message selector: #foo)).
	self deny: (matchingCondition appliesToMessage: (Message selector: #foobar)).
	^ matchingCondition
]

{ #category : #examples }
GtProxyCacheMatchingConditionExamples >> specificSelectorsMatchingConditionNoneIncluded [
	<gtExample>
	<return: #GtProxyCacheMatchingConditionExamples>
	self
		deny: (GtProxyCacheSpecifiedSelectorsMatchingCondition new
				appliesToMessage: (Message selector: #foo))
]

{ #category : #examples }
GtProxyCacheMatchingConditionExamples >> unaryMatchingConditionBinarySelector [
	<gtExample>
	<return: #GtProxyCacheMatchingConditionExamples>
	self
		deny: (GtProxyCacheUnarySelectorsMatchingCondition new
				appliesToMessage: (Message selector: #+ argument: nil))
]

{ #category : #examples }
GtProxyCacheMatchingConditionExamples >> unaryMatchingConditionKeywordSelector [
	<gtExample>
	<return: #GtProxyCacheMatchingConditionExamples>
	self
		deny: (GtProxyCacheUnarySelectorsMatchingCondition new
				appliesToMessage: (Message selector: #foo: argument: nil))
]

{ #category : #examples }
GtProxyCacheMatchingConditionExamples >> unaryMatchingConditionUnarySelector [
	<gtExample>
	<return: #GtProxyCacheMatchingConditionExamples>
	self
		assert: (GtProxyCacheUnarySelectorsMatchingCondition new
				appliesToMessage: (Message selector: #foo))
]
