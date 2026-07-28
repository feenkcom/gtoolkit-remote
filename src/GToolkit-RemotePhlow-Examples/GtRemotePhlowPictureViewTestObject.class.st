Class {
	#name : #GtRemotePhlowPictureViewTestObject,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #views }
GtRemotePhlowPictureViewTestObject >> gtViewPictureFor: aView [
	<gtView>
	^(aView picture)
		title: 'Picture';
		priority: 20;
		content: [self pictureBytes]
]

{ #category : #views }
GtRemotePhlowPictureViewTestObject >> gtViewPictureScaledWithExtentFor: aView [
	<gtView>
	^(aView picture)
		title: 'Picture (full size)';
		priority: 40;
		width: 1164;
		height: 560;
		renderingStencilName: #GtLocalPhlowPictureFullSizeViewStencil;
		content: [self pictureBytes]
]

{ #category : #accessing }
GtRemotePhlowPictureViewTestObject >> pictureBytes [
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
