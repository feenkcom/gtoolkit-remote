Class {
	#name : #GtRemotePhlowPictureViewTestObject,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #accessing }
GtRemotePhlowPictureViewTestObject class >> pictureBytes [
	^ GtRemotePhlowTestDataForExamples pictureBytes
]

{ #category : #views }
GtRemotePhlowPictureViewTestObject >> gtViewPictureFor: aView [
	<gtView>
	^(aView picture)
		title: 'Picture';
		priority: 20;
		content: [self class pictureBytes]
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
		content: [self class pictureBytes]
]
