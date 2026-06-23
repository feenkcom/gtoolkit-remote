Class {
	#name : #GtRemotePhlowDetailsRowValue,
	#superclass : #GtRemotePhlowItemTextualValue,
	#instVars : [
		'rowText',
		'rowValue',
		'rowIndex'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'as yet unclassified' }
GtRemotePhlowDetailsRowValue >> asDictionaryForExport [
	"Answer the receiver as a dictionary ready for JSON serialisation"

	| data | 
	
	data := super asDictionaryForExport.
	data at: 'rowIndex' put: self rowIndex.
	"data at: 'rowValue' put: self rowValue."
	
	^ data
]

{ #category : #printing }
GtRemotePhlowDetailsRowValue >> descriptionOn: aStream [
		aStream
			nextPutAll: 'index: ';
			print: self rowIndex;
			nextPutAll: '; text: ';
			nextPutAll: self itemText 
]

{ #category : #printing }
GtRemotePhlowDetailsRowValue >> printOn: aStream [
	super printOn: aStream.
	
	aStream parenthesize: [
		aStream
			nextPutAll: 'index: ';
			print: self rowIndex;
			nextPutAll: '; text: ';
			nextPutAll: self rowText ]
]

{ #category : #accessing }
GtRemotePhlowDetailsRowValue >> rowIndex [
	^ rowIndex
]

{ #category : #accessing }
GtRemotePhlowDetailsRowValue >> rowIndex: anObject [
	rowIndex := anObject
]

{ #category : #accessing }
GtRemotePhlowDetailsRowValue >> rowValue [
	^ rowValue
]

{ #category : #accessing }
GtRemotePhlowDetailsRowValue >> rowValue: anObject [
	rowValue := anObject
]
