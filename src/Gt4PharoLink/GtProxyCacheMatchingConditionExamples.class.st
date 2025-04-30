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

	self deny: (GtProxyCacheNoMatchingCondition new appliesToMessage: #anything)
]

{ #category : #examples }
GtProxyCacheMatchingConditionExamples >> specificSelectorsMatchingConditionCachesFoo [
	<gtExample>
	| matchingCondition |

	matchingCondition := GtProxyCacheSpecifiedSelectorsMatchingCondition new.
	matchingCondition includeSelector: #foo.
	self assert: (matchingCondition appliesToMessage: (Message
			selector: #foo)).
	self deny: (matchingCondition appliesToMessage: (Message
			selector: #bar)).
	^ matchingCondition
]

{ #category : #examples }
GtProxyCacheMatchingConditionExamples >> specificSelectorsMatchingConditionCachesFooPattern [
	<gtExample>
	| matchingCondition |

	matchingCondition := GtProxyCacheSpecifiedSelectorsMatchingCondition new.
	matchingCondition includePattern: 'foo.*'.
	self assert: (matchingCondition appliesToMessage: (Message
			selector: #foo)).
	self assert: (matchingCondition appliesToMessage: (Message
			selector: #foobar)).
	self deny: (matchingCondition appliesToMessage: (Message
			selector: #barfoo)).
	^ matchingCondition
]

{ #category : #examples }
GtProxyCacheMatchingConditionExamples >> specificSelectorsMatchingConditionCachesFooPatternNotFoobPattern [
	<gtExample>
	| matchingCondition |

	matchingCondition := GtProxyCacheSpecifiedSelectorsMatchingCondition new.
	matchingCondition 
		includePattern: 'foo.*';
		excludePattern: 'foob.*'.
	self assert: (matchingCondition appliesToMessage: (Message
			selector: #foo)).
	self assert: (matchingCondition appliesToMessage: (Message
			selector: #fooey)).
	self deny: (matchingCondition appliesToMessage: (Message
			selector: #foobar)).
	^ matchingCondition
]

{ #category : #examples }
GtProxyCacheMatchingConditionExamples >> specificSelectorsMatchingConditionCachesFooPatternNotFoobar [
	<gtExample>
	| matchingCondition |

	matchingCondition := GtProxyCacheSpecifiedSelectorsMatchingCondition new.
	matchingCondition 
		includePattern: 'foo.*';
		excludeSelector: #foobar.
	self assert: (matchingCondition appliesToMessage: (Message
			selector: #foo)).
	self deny: (matchingCondition appliesToMessage: (Message
			selector: #foobar)).
	^ matchingCondition
]

{ #category : #examples }
GtProxyCacheMatchingConditionExamples >> specificSelectorsMatchingConditionNoneIncluded [
	<gtExample>

	self deny: (GtProxyCacheSpecifiedSelectorsMatchingCondition new appliesToMessage: (Message
			selector: #foo))
]

{ #category : #examples }
GtProxyCacheMatchingConditionExamples >> unaryMatchingConditionBinarySelector [
	<gtExample>

	self deny: (GtProxyCacheUnarySelectorsMatchingCondition new 
		appliesToMessage: (Message
			selector: #+
			argument: nil))
]

{ #category : #examples }
GtProxyCacheMatchingConditionExamples >> unaryMatchingConditionKeywordSelector [
	<gtExample>

	self deny: (GtProxyCacheUnarySelectorsMatchingCondition new 
		appliesToMessage: (Message
			selector: #foo:
			argument: nil))
]

{ #category : #examples }
GtProxyCacheMatchingConditionExamples >> unaryMatchingConditionUnarySelector [
	<gtExample>

	self assert: (GtProxyCacheUnarySelectorsMatchingCondition new 
		appliesToMessage: (Message
			selector: #foo))
]
