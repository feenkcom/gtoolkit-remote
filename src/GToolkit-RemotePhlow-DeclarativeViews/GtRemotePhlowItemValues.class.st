Class {
	#name : #GtRemotePhlowItemValues,
	#superclass : #Object,
	#instVars : [
		'background',
		'itemText'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #converting }
GtRemotePhlowItemValues >> asDictionaryForExport [
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
