Class {
	#name : #GtRemotePhlowPictureViewErrorTestObject,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #accessing }
GtRemotePhlowPictureViewErrorTestObject class >> pictureBytes [
	^ GtRemotePhlowTestDataForExamples pictureBytes
]

{ #category : #views }
GtRemotePhlowPictureViewErrorTestObject >> gtViewPictureErrorFor: aView [
	<gtView>
	^(aView picture)
		title: 'Picture Error';
		priority: 25;
		content: [self error: 'Test picture computation error']
]

{ #category : #views }
GtRemotePhlowPictureViewErrorTestObject >> gtViewPictureHeightErrorFor: aView [
	<gtView>
	^(aView picture)
		title: 'Picture Height Error';
		priority: 27;
		height: [self error: 'Height computation error'];
		content: [self class pictureBytes]
]

{ #category : #views }
GtRemotePhlowPictureViewErrorTestObject >> gtViewPictureWidthErrorFor: aView [
	<gtView>
	^(aView picture)
		title: 'Picture Width Error';
		priority: 26;
		width: [self error: 'Width computation error'];
		content: [self class pictureBytes]
]
