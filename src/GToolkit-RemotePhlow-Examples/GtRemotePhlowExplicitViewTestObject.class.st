Class {
	#name : #GtRemotePhlowExplicitViewTestObject,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #accessing }
GtRemotePhlowExplicitViewTestObject class >> pictureBytes [
	^ GtRemotePhlowTestDataForExamples pictureBytes
]

{ #category : #views }
GtRemotePhlowExplicitViewTestObject >> gtExplicitPictureViewWithDirectlySerializableFor: aView [
	<gtView>
	
	^(aView explicit)
		title: 'Remote/local stencil';
		priority: 10;
		declarativeStencil: [ 
			(GtPhlowPictureWithDirectDataExampleStencil new)
				contentBytes: self class pictureBytes ]
]

{ #category : #views }
GtRemotePhlowExplicitViewTestObject >> gtExplicitPictureViewWithGenericPhlowStencilWithDirectDataFor: aView [
	<gtView>
	
	^(aView explicit)
		title: 'GT-Side stencil v2';
		priority: 25;
		declarativeStencil: [
			GtPhlowNamedStencil new
				stencilClassName: #GtLocalPhlowPictureFullSizeViewStencil;
				stencilData: ((GtRemotePhlowPictureViewData new)
						content: self class pictureBytes)  ]
]

{ #category : #views }
GtRemotePhlowExplicitViewTestObject >> gtExplicitPictureViewWithGenericPhlowStencilWithDirectDataUsingDedicatedApiFor: aView [
	<gtView>
	
	^(aView explicit)
		title: 'GT-Side stencil v1';
		priority: 20;
		localStencilName: #GtLocalPhlowPictureFullSizeViewStencil
			stencilData: [ ((GtRemotePhlowPictureViewData new)
				content: self class pictureBytes) ]
]

{ #category : #views }
GtRemotePhlowExplicitViewTestObject >> gtExplicitPictureViewWithRemoteOnlyStencilSerializableFor: aView [
	<gtView>
	
	^(aView explicit)
		title: 'Remote only stencil';
		priority: 12;
		declarativeStencil: [ 
			GtPhlowPictureWithExplicitDataExampleRemoteStencil new
				stencilData: ((GtRemotePhlowPictureViewData new)
						content: self class pictureBytes) ]
]
