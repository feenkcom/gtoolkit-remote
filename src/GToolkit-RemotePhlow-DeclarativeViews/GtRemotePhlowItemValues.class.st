Class {
	#name : #GtRemotePhlowItemValues,
	#superclass : #Object,
	#instVars : [
		'background',
		'itemText'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtRemotePhlowItemValues class >> fromJSONDictionary: aDictionary [
	"Answer an instance of the receiver from the supplied dictionary."

	^self new 
		itemText: (aDictionary at: #itemText);
		background: (aDictionary at: #background ifAbsent: [ nil ]);
		yourself
]

{ #category : #converting }
GtRemotePhlowItemValues >> asDictionaryForExport [
	"Answer the receiver as a dictionary ready for JSON serialisation"

	^ Dictionary new 
		at: #itemText put: self itemText;
		in: [ :aDictionary |
			self background ifNotNil: [ :aBackground |
				aDictionary at: #background put: aBackground ].
			aDictionary ]
		yourself
]

{ #category : #accessing }
GtRemotePhlowItemValues >> background [
	^ background
]

{ #category : #accessing }
GtRemotePhlowItemValues >> background: anObject [
	background := anObject
]

{ #category : #accessing }
GtRemotePhlowItemValues >> itemText [
	^ itemText
]

{ #category : #accessing }
GtRemotePhlowItemValues >> itemText: anObject [
	itemText := anObject
]

{ #category : #printing }
GtRemotePhlowItemValues >> printOn: aStream [ 
	super printOn: aStream .
	
	aStream parenthesize: [
		aStream << self itemText.
		self background ifNotNil: [ :aBackground |
			aStream 
				<< ', background: ';
				print: aBackground ] ]
]
