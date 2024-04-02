Class {
	#name : #GtPhlowTextHighlight,
	#superclass : #Object,
	#instVars : [
		'color',
		'startPosition',
		'endPosition'
	],
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #'instance creation' }
GtPhlowTextHighlight class >> from: start to: end [
	^ self new
		startPosition: start;
		endPosition: end;
		yourself
]

{ #category : #'instance creation' }
GtPhlowTextHighlight class >> from: start to: end with: aColor [
	^ self new
		startPosition: start;
		endPosition: end;
		color: aColor;
		yourself
]

{ #category : #'instance creation' }
GtPhlowTextHighlight class >> fromJSONDictionary: aDictionary [
	^ self new
		startPosition: (aDictionary at: 'startPosition');
		endPosition: (aDictionary at: 'endPosition');
		color: (aDictionary
				at: 'color'
				ifPresent: [ :dict | (GtPhlowColor fromJSONDictionary: dict) asColor ]
				ifAbsent: [  ]);
		yourself
]

{ #category : #accessing }
GtPhlowTextHighlight >> asDictionaryForExport [
	| dict |
	dict := Dictionary new.
	dict at: 'startPosition' put: self startPosition.
	dict at: 'endPosition' put: self endPosition.
	color
		ifNotNil: [ dict
				at: 'color'
				put: (GtPhlowColor
						r: color red
						g: color green
						b: color blue
						alpha: color alpha) asDictionaryForExport ].
	^ dict
]

{ #category : #accessing }
GtPhlowTextHighlight >> color [
	^ color
]

{ #category : #accessing }
GtPhlowTextHighlight >> color: anObject [
	color := anObject
]

{ #category : #accessing }
GtPhlowTextHighlight >> endPosition [
	^ endPosition
]

{ #category : #accessing }
GtPhlowTextHighlight >> endPosition: anObject [
	endPosition := anObject
]

{ #category : #accessing }
GtPhlowTextHighlight >> startPosition [
	^ startPosition
]

{ #category : #accessing }
GtPhlowTextHighlight >> startPosition: anObject [
	startPosition := anObject
]
