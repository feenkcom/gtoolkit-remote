Class {
	#name : #GtRemotePhlowItemTextualValue,
	#superclass : #GtRemotePhlowItemValue,
	#instVars : [
		'itemText'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #accessing }
GtRemotePhlowItemTextualValue class >> valueTypeName [
	^ 'textualValue'
]

{ #category : #comparing }
GtRemotePhlowItemTextualValue >> = anObject [
	super = anObject  ifFalse: [ ^ false ].
	
	^ self itemText = anObject itemText
]

{ #category : #converting }
GtRemotePhlowItemTextualValue >> asDictionaryForExport [
	"Answer the receiver as a dictionary ready for JSON serialisation"

	| data currentText currentTextData | 
	
	data := super asDictionaryForExport.
	currentText := self itemText.
	currentTextData := (currentText isNil or: [currentText isString])
		ifTrue: [ currentText ] 
		ifFalse: [ currentText asDictionaryForExport ].
	
	data at: #itemText put: currentTextData.
	
	^ data
]

{ #category : #printing }
GtRemotePhlowItemTextualValue >> descriptionOn: aStream [ 
	
	aStream print: self itemText.
	super descriptionOn: aStream 
]

{ #category : #comparing }
GtRemotePhlowItemTextualValue >> hash [ 
	^ super hash bitXor: self itemText hash
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
