Extension { #name : #GtRemotePhlowPictureViewTestObject }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowPictureViewTestObject >> computePictureBytes [
	| element  form |
	element := BlElement new
		border: (BlBorder paint: Color red width: 5);
		background: (BlPaintBackground new
			paint: (BlRadialGradientPaint new
					stops: {0 -> Color blue.
							1 -> Color white};
					center: 300 @ 300;
					radius: 400));
		extent: 1200@600.
	form := (BlExporter form element: element) export.
	^ByteArray
		streamContents: [:stream | PNGReadWriter putForm: form onStream: stream]
]
