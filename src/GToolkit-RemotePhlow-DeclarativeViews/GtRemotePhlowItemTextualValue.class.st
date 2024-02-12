Class {
	#name : #GtRemotePhlowItemTextualValue,
	#superclass : #GtRemotePhlowItemValue,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #accessing }
GtRemotePhlowItemTextualValue class >> valueTypeName [
	^ 'textualValue'
]

{ #category : #converting }
GtRemotePhlowItemTextualValue >> asDictionaryForExport [
	"Answer the receiver as a dictionary ready for JSON serialisation"

	| data currentText | 
	
	data := super asDictionaryForExport.
	currentText := self itemText.
	currentText := (currentText notNil and: [currentText isString not])
		ifTrue: [ currentText asDictionaryForExport ].
	
	data at: #itemText put: currentText.
	
	^ data
]

{ #category : #printing }
GtRemotePhlowItemTextualValue >> descriptionOn: aStream [ 
	
	aStream print: self itemText.
	super descriptionOn: aStream 
]

{ #category : #initialization }
GtRemotePhlowItemTextualValue >> initializeFromJSONDictionary: aDictionary [
	| textData |
	super initializeFromJSONDictionary: aDictionary.
	
	textData := aDictionary at: #itemText.
	self itemText: ((textData isNil or: [ textData isString ]) 
		ifTrue: [ textData ]
		ifFalse: [ GtPhlowRunBasedText fromJSONDictionary: textData ])
	
]

{ #category : #accessing }
GtRemotePhlowItemTextualValue >> itemText [
	^ itemText
]

{ #category : #accessing }
GtRemotePhlowItemTextualValue >> itemText: anObject [
	itemText := anObject
]
