Class {
	#name : #GtRemotePhlowPictureViewData,
	#superclass : #GtRemotePhlowViewData,
	#instVars : [
		'content',
		'mediaType',
		'width',
		'height'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #serialization }
GtRemotePhlowPictureViewData class >> fromJSONDictionary: aDictionary [
	^(self new)
		content: (aDictionary at: 'content');
		mediaType: (aDictionary at: 'mediaType' ifAbsent: [nil]);
		width: (aDictionary at: 'width' ifAbsent: [nil]);
		height: (aDictionary at: 'height' ifAbsent: [nil]);
		yourself
]

{ #category : #serialization }
GtRemotePhlowPictureViewData >> asDictionaryForExport [
	| dict |
	dict := super asDictionaryForExport.
	dict at: 'content' put: content.
	mediaType ifNotNil: [dict at: 'mediaType' put: mediaType].
	width ifNotNil: [dict at: 'width' put: width].
	height ifNotNil: [dict at: 'height' put: height].
	^dict
]

{ #category : #accessing }
GtRemotePhlowPictureViewData >> content [
	^content
]

{ #category : #accessing }
GtRemotePhlowPictureViewData >> content: aByteArray [
	content := aByteArray
]

{ #category : #accessing }
GtRemotePhlowPictureViewData >> height [
	^height
]

{ #category : #accessing }
GtRemotePhlowPictureViewData >> height: anInteger [
	height := anInteger
]

{ #category : #testing }
GtRemotePhlowPictureViewData >> isPictureData [
	^true
]

{ #category : #accessing }
GtRemotePhlowPictureViewData >> mediaType [
	^mediaType
]

{ #category : #accessing }
GtRemotePhlowPictureViewData >> mediaType: aString [
	mediaType := aString
]

{ #category : #accessing }
GtRemotePhlowPictureViewData >> width [
	^width
]

{ #category : #accessing }
GtRemotePhlowPictureViewData >> width: anInteger [
	width := anInteger
]
