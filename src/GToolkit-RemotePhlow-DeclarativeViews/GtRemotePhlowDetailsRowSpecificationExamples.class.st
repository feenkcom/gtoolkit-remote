Class {
	#name : #GtRemotePhlowDetailsRowSpecificationExamples,
	#superclass : #TestCase,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews-Examples'
}

{ #category : #examples }
GtRemotePhlowDetailsRowSpecificationExamples >> equality [
	<gtExample>
	| first second |
	first := GtRemotePhlowDetailsRowSpecification new
		name: 'Class';
		index: 1;
		yourself.
	second := GtRemotePhlowDetailsRowSpecification new
		name: 'Class';
		index: 1;
		yourself.
	self assert: first equals: second.
	self assert: first hash equals: second hash.
	^ first
]

{ #category : #examples }
GtRemotePhlowDetailsRowSpecificationExamples >> inequalityByIndex [
	<gtExample>
	| first second |
	first := GtRemotePhlowDetailsRowSpecification new
		name: 'Class';
		index: 1;
		yourself.
	second := GtRemotePhlowDetailsRowSpecification new
		name: 'Class';
		index: 2;
		yourself.
	self deny: first = second.
	^ first
]
