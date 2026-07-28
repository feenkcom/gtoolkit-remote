Extension { #name : #GtRemotePhlowTestDataForExamples }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowTestDataForExamples class >> computePictureBytes [
	| element  form |
	element := BlElement new
		border: (BlBorder paint: Color red width: 5);
		background: (BlPaintBackground new
			paint: (BlRadialGradientPaint new
					stops: {0 -> Color blue.
							1 -> Color white};
					center: 100 @ 100;
					radius: 200));
		extent: 600@300.
	form := (BlExporter form element: element) export.
	^ByteArray
		streamContents: [:stream | PNGReadWriter putForm: form onStream: stream]
]
