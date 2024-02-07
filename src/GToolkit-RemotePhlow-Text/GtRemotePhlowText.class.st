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
		initializeFromJSONDictionary: aDictionary
]

{ #category : #accessing }
GtRemotePhlowText class >> typeLabel [
	^ 'remotePhlowText'
]

{ #category : #converting }
GtRemotePhlowText >> asDictionaryForExport [
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
GtRemotePhlowText >> asRopedText [
	^ self stylerSpecification 
		ifNil: [ string asRopedText ]
		ifNotNil: [ :aStylerSpecification |
			aStylerSpecification createBlStyler 
				style: string asRopedText]
]

{ #category : #initialization }
GtRemotePhlowText >> initializeFromJSONDictionary: aDictionary [
	self string: (aDictionary at: 'string').
		
	(aDictionary includesKey: 'stylerSpecification') ifTrue: [
		self stylerSpecification: (GtRemotePhlowTextStylerSpecification
				fromJSONDictionary: (aDictionary at: 'stylerSpecification')) ]
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
