Class {
	#name : #GtPhlowPngBytesIconStencil,
	#superclass : #GtPhlowIconStencil,
	#instVars : [
		'pngBytes'
	],
	#category : #'GToolkit-RemotePhlow-Icons'
}

{ #category : #converting }
GtPhlowPngBytesIconStencil >> asDictionaryForExport [
	^ super asDictionaryForExport
		at: 'pngBytes' put: self pngBytes base64Encoded;
		yourself
]

{ #category : #initialization }
GtPhlowPngBytesIconStencil >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	
		aDictionary 
		at: 'pngBytes' 
		ifPresent: [ :encodedBytes | 
			encodedBytes ifNotNil: [ 
				self pngBytes: encodedBytes base64Decoded ] ]
]

{ #category : #accessing }
GtPhlowPngBytesIconStencil >> pngBytes [
	^ pngBytes
]

{ #category : #accessing }
GtPhlowPngBytesIconStencil >> pngBytes: anObject [
	pngBytes := anObject
]
