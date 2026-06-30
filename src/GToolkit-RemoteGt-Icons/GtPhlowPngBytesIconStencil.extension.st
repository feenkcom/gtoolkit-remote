Extension { #name : #GtPhlowPngBytesIconStencil }

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtPhlowPngBytesIconStencil >> create [
	| image|
	image := BlSpartaBufferedImageElement buffer: self pngBytes.
	
	image constraintsDo: [ :c |
			c vertical exact: 16.
			c horizontal exact: 16. ].
			
	^ image
]

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtPhlowPngBytesIconStencil class >> fromElement: anElement [
	^ self new
			initializeFromElement: anElement
]

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtPhlowPngBytesIconStencil >> initializeFromElement: anElement [
	| form stream |
	form := BlExporter form element: anElement; export.
	
	stream := ByteArray new writeStream.
	PNGReadWriter putForm: form onStream: stream.
	
	pngBytes := stream contents.
]
