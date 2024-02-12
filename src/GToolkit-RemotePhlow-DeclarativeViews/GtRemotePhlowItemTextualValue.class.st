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

	| data | 
	
	data := super asDictionaryForExport.
	data 
		at: #itemText put: self itemText.
	
	^ data
]

{ #category : #printing }
GtRemotePhlowItemTextualValue >> descriptionOn: aStream [ 
	
	aStream << self itemText.
	super descriptionOn: aStream 
]

{ #category : #initialization }
GtRemotePhlowItemTextualValue >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	
	self itemText: (aDictionary at: #itemText).
]

{ #category : #accessing }
GtRemotePhlowItemTextualValue >> itemText [
	^ itemText
]

{ #category : #accessing }
GtRemotePhlowItemTextualValue >> itemText: anObject [
	itemText := anObject
]
