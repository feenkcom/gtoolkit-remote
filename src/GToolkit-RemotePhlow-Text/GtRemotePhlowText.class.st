Class {
	#name : #GtRemotePhlowText,
	#superclass : #Object,
	#instVars : [
		'string',
		'stylerSpecification'
	],
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #'instance creation' }
GtRemotePhlowText class >> fromJSONDictionary: aDictionary [
	^ self new
		string: (aDictionary at: 'string');
		stylerSpecification: (GtRemotePhlowTextStylerSpecification
				fromJSONDictionary: (aDictionary at: 'stylerSpecification'));
		yourself
]

{ #category : #accessing }
GtRemotePhlowText class >> typeLabel [
	^ 'remotePhlowText'
]

{ #category : #accessing }
GtRemotePhlowText >> asRopedText [
	^ self stylerSpecification createBlStyler style: string asRopedText
]

{ #category : #accessing }
GtRemotePhlowText >> string [
	^ string
]

{ #category : #accessing }
GtRemotePhlowText >> string: anObject [
	string := anObject
]

{ #category : #accessing }
GtRemotePhlowText >> stylerSpecification [
	^ stylerSpecification
]

{ #category : #accessing }
GtRemotePhlowText >> stylerSpecification: anObject [
	stylerSpecification := anObject
]
