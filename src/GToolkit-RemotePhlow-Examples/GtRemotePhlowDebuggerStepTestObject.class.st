"
Test object with methods designed to exercise debugger stepping operations (step-over, step-into, step-through) across various control flow patterns: loops, nested blocks, conditionals, recursion, and method calls.
"
Class {
	#name : #GtRemotePhlowDebuggerStepTestObject,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #'stepping - blocks' }
GtRemotePhlowDebuggerStepTestObject >> doBlockEvaluation [
	| result |
	result := 0.
	self doSomething: [ result := result + 1 ].
	self doSomething: [ result := result + 2 ].
	^ result
]

{ #category : #actions }
GtRemotePhlowDebuggerStepTestObject >> doCallMethodWithHalt [
	| a b |

	a := self helperMethod: 3.
	b := self methodThatHalts.
	^ a + b
]

{ #category : #'stepping - loops' }
GtRemotePhlowDebuggerStepTestObject >> doCollect [
	^ (1 to: 5) collect: [ :each | each * each ]
]

{ #category : #'stepping - loops' }
GtRemotePhlowDebuggerStepTestObject >> doConditionalLoop [
	| result |
	result := OrderedCollection new.
	(1 to: 10) do: [ :i |
		i even
			ifTrue: [ result add: i ]
			ifFalse: [ result add: i negated ] ].
	^ result
]

{ #category : #'stepping - blocks' }
GtRemotePhlowDebuggerStepTestObject >> doFourLevelNesting [
	| result |
	result := 0.
	(1 to: 2) do: [ :i |
		self doSomething: [
			(1 to: 2) do: [ :j |
				self doSomething: [
					result := result + (i * j) ] ] ] ].
	^ result
]

{ #category : #actions }
GtRemotePhlowDebuggerStepTestObject >> doLongComputation [
	| a b c d e f result |

	a := 1.
	b := 2.
	c := a + b.
	d := c * 3.
	e := d factorial.
	f := e printString size.
	result := OrderedCollection new.
	result add: a.
	result add: b.
	result add: c.
	result add: d.
	result add: e.
	result add: f.
	a := self helperMethod: c.
	b := self helperMethod: d.
	c := a + b.
	d := c * 2.
	e := self factorial: d.
	f := e printString.
	result add: a.
	result add: b.
	result add: c.
	result add: d.
	result add: e.
	result add: f.
	^ result
]

{ #category : #'stepping - loops' }
GtRemotePhlowDebuggerStepTestObject >> doLoop [
	(1 to: 10) do: [ :each |
		(each + 1 + 1) printString ]
]

{ #category : #'stepping - loops' }
GtRemotePhlowDebuggerStepTestObject >> doLoopCallingMethod [
	| result |
	result := 0.
	(1 to: 5) do: [ :i |
		result := result + (self helperMethod: i) ].
	^ result
]

{ #category : #'stepping - loops' }
GtRemotePhlowDebuggerStepTestObject >> doLoopWithHalt [
	| result |
	result := 0.
	self halt.
	(1 to: 5) do: [ :i |
		result := result + i ].
	^ result
]

{ #category : #'stepping - loops' }
GtRemotePhlowDebuggerStepTestObject >> doMultipleMessageSendsInLoop [
	| result |
	result := 0.
	#(3 7 2 9 1) do: [ :each |
		result := result + each abs.
		result := result + 1 ].
	^ result
]

{ #category : #'stepping - method calls' }
GtRemotePhlowDebuggerStepTestObject >> doMultipleMethodCalls [
	| a b c |
	a := self helperMethod: 3.
	b := self helperMethod: a.
	c := self factorial: 4.
	^ a + b + c
]

{ #category : #examples }
GtRemotePhlowDebuggerStepTestObject >> doNestedBlocks [
	| result |
	result := 0.
	self doSomething: [
		result := result + 1.
		self doSomething: [
			result := result + 2 ].
		result := result + 10 ].
	^ result
]

{ #category : #'stepping - blocks' }
GtRemotePhlowDebuggerStepTestObject >> doNestedBlocksWithLoop [
	| result |
	result := 0.
	(1 to: 3) do: [ :i |
		self doSomething: [
			result := result + i ] ].
	^ result
]

{ #category : #'stepping - loops' }
GtRemotePhlowDebuggerStepTestObject >> doNestedLoop [
	| result |
	result := 0.
	(1 to: 3) do: [ :i |
		(1 to: 3) do: [ :j |
			result := result + (i * j) ] ].
	^ result
]

{ #category : #'stepping - blocks' }
GtRemotePhlowDebuggerStepTestObject >> doSomething: aBlock [
	^ aBlock value
]

{ #category : #'test methods' }
GtRemotePhlowDebuggerStepTestObject >> doThreeLevelCall [
	^ self doThreeLevelMiddle
]

{ #category : #'test methods' }
GtRemotePhlowDebuggerStepTestObject >> doThreeLevelMiddle [
	^ self helperMethod: 42
]

{ #category : #'stepping - recursion' }
GtRemotePhlowDebuggerStepTestObject >> factorial: n [
	n <= 1 ifTrue: [ ^ 1 ].
	^ n * (self factorial: n - 1)
]

{ #category : #'stepping - helpers' }
GtRemotePhlowDebuggerStepTestObject >> helperMethod: aValue [
	^ aValue * 2 + 1
]

{ #category : #actions }
GtRemotePhlowDebuggerStepTestObject >> methodThatHalts [
	<gtIgnoreConstraint: #GtSendersOfHaltSelectorsInGtPackagesConstraint>
	nil halt.
	^ 42
]
