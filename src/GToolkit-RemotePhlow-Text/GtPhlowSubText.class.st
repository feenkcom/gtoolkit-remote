Class {
	#name : #GtPhlowSubText,
	#superclass : #GtPhlowText,
	#instVars : [
		'parentText',
		'startIndex',
		'endIndex'
	],
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #'instance creation' }
GtPhlowSubText class >> text: aPhlowText from: aStartIndex to: anEndIndex [
	(aPhlowText isKindOf: self) ifTrue: [
		Error signal: 'Can not create sub text of a subtext' ].

	^ self new
		text: aPhlowText from: aStartIndex to: anEndIndex;
		yourself
]

{ #category : #attributes }
GtPhlowSubText >> addAttribute: aPhlowAttribute from: aStartIndex to: anEndIndex [ 
	parentText 
		addAttribute: aPhlowAttribute from: aStartIndex to: anEndIndex 
]

{ #category : #copy }
GtPhlowSubText >> asRopedText [
	^ parentText copyFrom: startIndex to: endIndex
]

{ #category : #copy }
GtPhlowSubText >> asRopedtext [
	^ parentText copyFrom: startIndex to: endIndex
]

{ #category : #assertions }
GtPhlowSubText >> assertInvariant [
	self assertStart: startIndex end: endIndex
]

{ #category : #assertions }
GtPhlowSubText >> assertStart: aStartIndex end: anEndIndex [
	
	aStartIndex isZero
		ifTrue: [ Error signal: 'Start index must not be zero' ].

	(aStartIndex between: 1 and: (parentText size + 1))
		ifFalse: [Error signal: 'Sub-text start index is out of bounds'] .
	(anEndIndex between: 0 and: parentText size) ifFalse: [ Error signal: 'Sub-text end index is out of bounds!'].
	
	(parentText notEmpty or: [ aStartIndex = 1 and: [ anEndIndex isZero ] ]) 
		ifFalse: [ Error signal: 'If text is empty, start must be 1 and end index must be Zero!' ].

	(anEndIndex isZero not or: [ aStartIndex = 1 ])
		ifFalse: [ Error signal: 'If end index is zero then start index must be 1' ]
]

{ #category : #accessing }
GtPhlowSubText >> endIndex [
	^ endIndex
]

{ #category : #'test - accessing' }
GtPhlowSubText >> from: aStart to: anEnd [
	self assertInvariant.
	
	(self notEmpty or: [ aStart = 1 and: [ anEnd isZero ] ])
		ifFalse: [ Error signal: 'If I am empty then start must be 1 and end must be zero' ].
	
	^ parentText
		from: ((aStart + startIndex - 1) max: 0)
		to: ((anEnd + startIndex - 1) max: 0)
]

{ #category : #'gt - extensions' }
GtPhlowSubText >> gtAttributeTreeFor: aView [
	<gtView>
	
	^ aView forward 
		title: 'All attributes';
		priority: 20;
		object: [ self asRopedText ];
		view: #gtAttributeTreeFor: 
]

{ #category : #'test - accessing' }
GtPhlowSubText >> size [
	self assertInvariant.

	^ (startIndex = endIndex and: [ startIndex = 0 ])
		ifTrue: [ 0 ]
		ifFalse: [ endIndex - startIndex + 1 ]
]

{ #category : #accessing }
GtPhlowSubText >> startIndex [
	^ startIndex
]

{ #category : #initialization }
GtPhlowSubText >> text: aPhlowText from: aStartIndex to: anEndIndex [ 
	startIndex := aStartIndex.
	endIndex := anEndIndex.
	parentText := aPhlowText.
	
	self assertInvariant
]
