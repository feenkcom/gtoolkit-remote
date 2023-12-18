Class {
	#name : #GtRemotePhlowBitmapSpecification,
	#superclass : #Object,
	#instVars : [
		'pixels',
		'width',
		'height',
		'stride',
		'format'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews-GTSpecific'
}

{ #category : #accessing }
GtRemotePhlowBitmapSpecification class >> fromJSONDictionary: aDictionary [
	^ self new
		width: (aDictionary at: #width);
		height: (aDictionary at: #height);
		stride: (aDictionary at: #stride);
		pixels: (aDictionary at: #pixels) base64Decoded 
			format: (aDictionary at: #format);
		yourself
]

{ #category : #accessing }
GtRemotePhlowBitmapSpecification >> asBitmap [
	| aBitmap |
	
	aBitmap := Bitmap new: pixels size // 4.
	aBitmap copyFromByteArray: pixels.
	
	^ aBitmap
]

{ #category : #accessing }
GtRemotePhlowBitmapSpecification >> asDictionaryForExport [
	^ Dictionary new
]

{ #category : #accessing }
GtRemotePhlowBitmapSpecification >> asForm [
	^ Form
		extent: self extent
		depth: 32
		bits: self asBitmap
]

{ #category : #accessing }
GtRemotePhlowBitmapSpecification >> extent [
	^ self width @ self height
]

{ #category : #accessing }
GtRemotePhlowBitmapSpecification >> format [
	^ format
]

{ #category : #accessing }
GtRemotePhlowBitmapSpecification >> height [
	^ height
]

{ #category : #accessing }
GtRemotePhlowBitmapSpecification >> height: anObject [
	height := anObject
]

{ #category : #accessing }
GtRemotePhlowBitmapSpecification >> pixels [
	^ pixels
]

{ #category : #accessing }
GtRemotePhlowBitmapSpecification >> pixels: aByteArray format: aPixelFormat [
	pixels := aByteArray.
	format := aPixelFormat.
	
	"Pharo's bitmap expect ARGB encoding"
	SkiaLibrary uniqueInstance
		newArrayU8FromByteArray: pixels
		during: [ :anArrayU8 |
			format = 'RGBA8888'
				ifTrue: [ anArrayU8 rgbaToArgb ].
				
			format = 'BGRA8888'
				ifTrue: [ anArrayU8 bgraToArgb ] ].
]

{ #category : #accessing }
GtRemotePhlowBitmapSpecification >> stride [
	^ stride
]

{ #category : #accessing }
GtRemotePhlowBitmapSpecification >> stride: anObject [
	stride := anObject
]

{ #category : #accessing }
GtRemotePhlowBitmapSpecification >> width [
	^ width
]

{ #category : #accessing }
GtRemotePhlowBitmapSpecification >> width: anObject [
	width := anObject
]
