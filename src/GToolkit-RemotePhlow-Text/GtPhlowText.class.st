Class {
	#name : #GtPhlowText,
	#superclass : #GtPhlowAbstractText,
	#instVars : [
		'sourceString',
		'runsWithAttributes'
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
	targetRunWithAttributes := runsWithAttributes 
		detect: [ :aRunWithAttributes |
			aRunWithAttributes run first = aStartIndex and: [
				aRunWithAttributes run last = anEndIndex ] ] 
		ifNone: [
			| newRunWithAttributes |
			newRunWithAttributes := (GtPhlowTextRunWithAttributes new
				run: (Interval from: aStartIndex to: anEndIndex);
				attributes: OrderedCollection new).
			runsWithAttributes add: newRunWithAttributes.
			newRunWithAttributes ].
	targetRunWithAttributes addAttribute: aPhlowAttribute
]

{ #category : #converting }
GtPhlowText >> asRopedText [
	^ self 
		gtDo: [ 
			(#GtRemotePhlowLocalTextAttributeRunsStyler asClass new 
				attributedRuns: runsWithAttributes)
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
	
	^ aView columnedList 
		title: 'Intervals';
		priority: 10;
		items: [ runsWithAttributes ];
		column: 'Interval' 
			text: [ :aRunWithAttributes | aRunWithAttributes run first asString, '-', aRunWithAttributes run last asString ];
		column: 'Attributes' 
			text: [ :aRunWithAttributes | 
				aRunWithAttributes attributesDescription ]
]

{ #category : #initialization }
GtPhlowText >> initialieWithString: aString [ 
	sourceString := aString.
	runsWithAttributes := OrderedCollection new
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
