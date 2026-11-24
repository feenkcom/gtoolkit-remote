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
	
	"The text is a String or a Symbol, depending on the side that wrote it"
	^ self itemText sameContentAs: anObject itemText
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
	
	data at: 'itemText' put: currentTextData.
	
	^ data
]

{ #category : #printing }
GtRemotePhlowItemTextualValue >> descriptionOn: aStream [ 
	
	aStream print: self itemText.
	super descriptionOn: aStream 
]

{ #category : #comparing }
GtRemotePhlowItemTextualValue >> hash [ 
	^ super hash bitXor: (self itemText isString
		ifTrue: [ self itemText asString ]
		ifFalse: [ self itemText ]) hash
]

{ #category : #initialization }
GtRemotePhlowItemTextualValue >> initializeFromJSONDictionary: aDictionary [
	| textData |
	super initializeFromJSONDictionary: aDictionary.
	
	"The keys are Strings when the data was read from JSON, Symbols when it comes from #asDictionaryForExport in memory"
	textData := aDictionary at: 'itemText' ifAbsent: [ aDictionary at: #itemText ].
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
