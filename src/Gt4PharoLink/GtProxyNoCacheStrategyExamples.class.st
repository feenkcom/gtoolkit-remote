Class {
	#name : #GtProxyNoCacheStrategyExamples,
	#superclass : #Object,
	#category : #'Gt4PharoLink-Examples'
}

{ #category : #examples }
GtProxyNoCacheStrategyExamples >> sendWithComputation [
	<gtExample>
	| strategy firstResult secondResult |

	strategy := GtProxyNoCacheStrategy new.
	firstResult := strategy send: #foo withComputation: [ 42 ].
	secondResult := strategy send: #foo withComputation: [ 4 + 3 ].
	self assert: firstResult equals: 42.
	self assert: secondResult equals: 7.
	^ strategy
]
