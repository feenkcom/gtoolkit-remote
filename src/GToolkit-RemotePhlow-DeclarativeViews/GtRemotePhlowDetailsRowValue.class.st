Class {
	#name : #GtRemotePhlowDetailsRowValue,
	#superclass : #GtRemotePhlowItemTextualValue,
	#instVars : [
		'rowText',
		'rowIndex',
		'rowValueWrapper'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #accessing }
GtRemotePhlowDetailsRowValue class >> valueTypeName [
	^ 'detailsRowValue'
]

{ #category : #comparing }
GtRemotePhlowDetailsRowValue >> = anObject [
	super = anObject  ifFalse: [ ^ false ].
	
	^ self rowIndex = anObject rowIndex
]

{ #category : #converting }
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
			nextPutAll: '; '.
	super descriptionOn: aStream 
]

{ #category : #comparing }
GtRemotePhlowDetailsRowValue >> hash [ 
	^ super hash bitXor: self rowIndex hash
]

{ #category : #initialization }
GtRemotePhlowDetailsRowValue >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	
	aDictionary at: 'rowIndex' ifPresent: [ :each | self rowIndex: each ]
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
	^ self rowValueWrapper targetObject
]

{ #category : #accessing }
GtRemotePhlowDetailsRowValue >> rowValue: anObject [
	self rowValueWrapper: (GtRemotePhlowSpawnObjectWrapper new
		targetObject: anObject)
]

{ #category : #accessing }
GtRemotePhlowDetailsRowValue >> rowValueWrapper [
	^ rowValueWrapper
]

{ #category : #accessing }
GtRemotePhlowDetailsRowValue >> rowValueWrapper: aWrapper [
	rowValueWrapper := aWrapper
]
