Class {
	#name : #GtPhlowText,
	#superclass : #GtPhlowAbstractText,
	#instVars : [
		'sourceString',
		'attributedRuns'
	],
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #'instance creation' }
GtPhlowText class >> forString: aString [
	^ self new 
		initialieWithString: aString
]

{ #category : #attributes }
GtPhlowText >> addAttribute: aPhlowAttribute from: aStartIndex to: anEndIndex [
	| targetRunWithAttributes | 
	targetRunWithAttributes := attributedRuns 
		detect: [ :aRunWithAttributes |
			aRunWithAttributes startIndex = aStartIndex and: [
				aRunWithAttributes endIndex = anEndIndex ] ] 
		ifNone: [
			| newRun |
			newRun := (GtPhlowRun 
				from: aStartIndex
				to: anEndIndex
				attributes: OrderedCollection new).
			attributedRuns addRun: newRun.
			newRun ].
	targetRunWithAttributes addAttribute: aPhlowAttribute
]

{ #category : #converting }
GtPhlowText >> asRopedText [
	^ self 
		gtDo: [ 
			(#GtRemotePhlowLocalTextAttributeRunsStyler asClass new 
				attributedRuns: attributedRuns)
					style: sourceString asRopedText]
		gemstoneDo: [ self ]
]

{ #category : #accessing }
GtPhlowText >> endIndex [
	^ sourceString size
]

{ #category : #'test - accessing' }
GtPhlowText >> from: aStart to: anEnd [
	"Create and return a subtext of this text form aStart to anEnd."
	<return: #GtPhlowSubText>
	
	aStart <= (anEnd + 1) 
		ifFalse: [ Error signal: 'Start must not exceed end' ].
		
	(self notEmpty or: [ aStart = 1 and: [ anEnd isZero ] ]) 
		ifFalse: [ Error signal: 'If I am empty then start must be 1 and end must be zero' ].

	^ GtPhlowSubText text: self from: aStart to: anEnd
]

{ #category : #'gt - extensions' }
GtPhlowText >> gtStringFor: aView [
	<gtView>
	self isEmpty ifTrue: [ ^ aView empty ].
	
	^ aView forward 
		title: 'String';
		priority: 5;
		object: [ sourceString ];
		view: #gtLiveFor:
]

{ #category : #'gt - extensions' }
GtPhlowText >> gtTextFor: aView [
	<gtView>
	
	^ aView textEditor
		title: 'Text';
		priority: 2;
		text: [ self ]
		
	"^ aView textEditor
		title: 'Text';
		priority: 2;
		text: [ sourceString ];
		styler: [ GtRemotePhlowLocalTextAttributeRunsStyler new 
			attributedRuns: runsWithAttributes ]"
]

{ #category : #'gt - extensions' }
GtPhlowText >> gtViewIntervalsFor: aView [
	<gtView>
	
	^ aView forward 
		title: 'Intervals';
		priority: 10;
		object: [ attributedRuns ];
		view: #gtViewIntervalsFor: 
]

{ #category : #initialization }
GtPhlowText >> initialieWithString: aString [ 
	sourceString := aString.
	attributedRuns := GtPhlowRunsGroup new
]

{ #category : #printing }
GtPhlowText >> printOn: aStream [
	aStream << sourceString
]

{ #category : #'test - accessing' }
GtPhlowText >> size [
	^ sourceString size
]

{ #category : #accessing }
GtPhlowText >> startIndex [
	^ 1
]
