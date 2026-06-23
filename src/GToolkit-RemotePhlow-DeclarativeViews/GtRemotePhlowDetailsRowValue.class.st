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
			nextPutAll: '; '.
	super descriptionOn: aStream 
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
