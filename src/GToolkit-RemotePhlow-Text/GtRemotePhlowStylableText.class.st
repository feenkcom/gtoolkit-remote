Class {
	#name : #GtRemotePhlowStylableText,
	#superclass : #Object,
	#instVars : [
		'string',
		'stylerSpecification'
	],
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #'instance creation' }
GtRemotePhlowStylableText class >> fromJSONDictionary: aDictionary [
	^ self new
		initializeFromJSONDictionary: aDictionary
]

{ #category : #accessing }
GtRemotePhlowStylableText class >> typeLabel [
	^ 'remotePhlowText'
]

{ #category : #converting }
GtRemotePhlowStylableText >> asDictionaryForExport [
	"Answer the receiver as a dictionary ready for JSON serialisation.
	Subclasses will override and add to the dictionary"
	| dataForExport|
	dataForExport := Dictionary new.
	dataForExport
		at: '__typeLabel' put: self class typeLabel;
		at: 'string' put: self string.
	self stylerSpecification ifNotNil: [ :aStylerSpecification |
		dataForExport 
			at: 'stylerSpecification' 
			put: aStylerSpecification asDictionaryForExport ].
		
	^ dataForExport
]

{ #category : #accessing }
GtRemotePhlowStylableText >> cretateStyledText [
	^ self stylerSpecification 
		ifNil: [ string asRopedText ]
		ifNotNil: [ :aStylerSpecification |
			aStylerSpecification createBlStyler 
				style: string asRopedText]
]

{ #category : #initialization }
GtRemotePhlowStylableText >> initializeFromJSONDictionary: aDictionary [
	self string: (aDictionary at: 'string').
		
	(aDictionary includesKey: 'stylerSpecification') ifTrue: [
		self stylerSpecification: (GtRemotePhlowTextStylerSpecification
				fromJSONDictionary: (aDictionary at: 'stylerSpecification')) ]
]

{ #category : #accessing }
GtRemotePhlowStylableText >> string [
	^ string
]

{ #category : #accessing }
GtRemotePhlowStylableText >> string: anObject [
	string := anObject
]

{ #category : #accessing }
GtRemotePhlowStylableText >> stylerSpecification [
	^ stylerSpecification
]

{ #category : #accessing }
GtRemotePhlowStylableText >> stylerSpecification: anObject [
	stylerSpecification := anObject
]
