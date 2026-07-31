Class {
	#name : #GtPhlowPictureWithDirectDataExampleStencil,
	#superclass : #GtPhlowStencil,
	#instVars : [
		'contentBytes'
	],
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #converting }
GtPhlowPictureWithDirectDataExampleStencil >> asDictionaryForExport [
	^ super asDictionaryForExport
		at: 'contentBytes' put: self contentBytes;
		yourself
]

{ #category : #accessing }
GtPhlowPictureWithDirectDataExampleStencil >> contentBytes [
	^ contentBytes
]

{ #category : #accessing }
GtPhlowPictureWithDirectDataExampleStencil >> contentBytes: anObject [
	contentBytes := anObject
]

{ #category : #initialization }
GtPhlowPictureWithDirectDataExampleStencil >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	
	aDictionary 
		at: 'contentBytes' 
		ifPresent: [ :aByteArray | 
			aByteArray ifNotNil: [ 
				self contentBytes: aByteArray ] ]
]
