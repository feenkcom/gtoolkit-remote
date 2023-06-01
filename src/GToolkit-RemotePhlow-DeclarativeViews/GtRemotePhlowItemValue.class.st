Class {
	#name : #GtRemotePhlowItemValue,
	#superclass : #GtRemotePhlowNodeValue,
	#instVars : [
		'background',
		'itemText'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtRemotePhlowItemValue class >> fromJSONDictionary: aDictionary [
	"Answer an instance of the receiver from the supplied dictionary."

	^self new 
		itemText: (aDictionary at: #itemText);
		background: (aDictionary 
			at: #background 
			ifPresent: [ :aBackgroundValue |
				GtPhlowColor fromJSONDictionary: aBackgroundValue ]
			ifAbsent: [ nil ]);
		yourself
]

{ #category : #converting }
GtRemotePhlowItemValue >> asDictionaryForExport [
	"Answer the receiver as a dictionary ready for JSON serialisation"

	| data| 
	data := Dictionary new 
		at: #itemText put: self itemText;
		yourself.
		
	self background ifNotNil: [ :aBackground |
		data at: #background put: aBackground asDictionaryForExport  ].
	^ data
]

{ #category : #accessing }
GtRemotePhlowItemValue >> background [
	^ background
]

{ #category : #accessing }
GtRemotePhlowItemValue >> background: anObject [
	background := anObject
]

{ #category : #accessing }
GtRemotePhlowItemValue >> itemText [
	^ itemText
]

{ #category : #accessing }
GtRemotePhlowItemValue >> itemText: anObject [
	itemText := anObject
]

{ #category : #printing }
GtRemotePhlowItemValue >> printOn: aStream [ 
	super printOn: aStream .
	
	aStream parenthesize: [
		aStream << self itemText.
		self background ifNotNil: [ :aBackground |
			aStream 
				<< ', background: ';
				print: aBackground ] ]
]
