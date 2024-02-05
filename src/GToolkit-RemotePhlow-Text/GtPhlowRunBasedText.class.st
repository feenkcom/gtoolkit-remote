Class {
	#name : #GtPhlowRunBasedText,
	#superclass : #GtPhlowText,
	#instVars : [
		'sourceString',
		'attributeRuns'
	],
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #attributes }
GtPhlowRunBasedText >> addAttribute: aPhlowAttribute from: aStartIndex to: anEndIndex [
	| targetRun | 
	targetRun := attributeRuns 
		detect: [ :aRunWithAttributes |
			aRunWithAttributes startIndex = aStartIndex and: [
				aRunWithAttributes endIndex = anEndIndex ] ] 
		ifNone: [
			| newRun |
			newRun := (GtPhlowRun 
				from: aStartIndex
				to: anEndIndex
				attributes: OrderedCollection new).
			attributeRuns addRun: newRun.
			newRun ].
	targetRun addAttribute: aPhlowAttribute
]

{ #category : #converting }
GtPhlowRunBasedText >> asRopedText [
	^ self 
		gtDo: [ 
			(#GtRemotePhlowLocalTextAttributeRunsStyler asClass new 
				attributeRuns: attributeRuns)
					style: sourceString asRopedText]
		gemstoneDo: [ self ]
]

{ #category : #accessing }
GtPhlowRunBasedText >> endIndex [
	^ sourceString size
]

{ #category : #'test - accessing' }
GtPhlowRunBasedText >> from: aStart to: anEnd [
	"Create and return a subtext of this text form aStart to anEnd."
	<return: #GtPhlowSubText>
	
	aStart <= (anEnd + 1) 
		ifFalse: [ Error signal: 'Start must not exceed end' ].
		
	(self notEmpty or: [ aStart = 1 and: [ anEnd isZero ] ]) 
		ifFalse: [ Error signal: 'If I am empty then start must be 1 and end must be zero' ].

	^ GtPhlowSubText text: self from: aStart to: anEnd
]

{ #category : #'gt - extensions' }
GtPhlowRunBasedText >> gtStringFor: aView [
	<gtView>
	self isEmpty ifTrue: [ ^ aView empty ].
	
	^ aView forward 
		title: 'String';
		priority: 5;
		object: [ sourceString ];
		view: #gtLiveFor:
]

{ #category : #'gt - extensions' }
GtPhlowRunBasedText >> gtTextFor: aView [
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
GtPhlowRunBasedText >> gtViewIntervalsFor: aView [
	<gtView>
	
	^ aView forward 
		title: 'Intervals';
		priority: 10;
		object: [ attributeRuns ];
		view: #gtViewIntervalsFor: 
]

{ #category : #initialization }
GtPhlowRunBasedText >> initialieWithString: aString [ 
	sourceString := aString.
	attributeRuns := GtPhlowRunsGroup new
]

{ #category : #printing }
GtPhlowRunBasedText >> printOn: aStream [
	aStream << sourceString
]

{ #category : #'test - accessing' }
GtPhlowRunBasedText >> size [
	^ sourceString size
]

{ #category : #accessing }
GtPhlowRunBasedText >> startIndex [
	^ 1
]
