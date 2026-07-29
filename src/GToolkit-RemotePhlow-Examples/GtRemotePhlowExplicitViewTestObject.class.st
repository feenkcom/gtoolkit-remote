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
GtRemotePhlowExplicitViewTestObject >> gtViewPictureWithCustomPhlowStencilFor: aView [
	"<gtView>"
	
	^(aView explicit)
		title: 'Picture';
		priority: 20;
		stencil: [ 
			 ]
]

{ #category : #views }
GtRemotePhlowExplicitViewTestObject >> gtViewPictureWithDirectlySerializableFor: aView [
	<gtView>
	
	^(aView explicit)
		title: 'Remote stencil';
		priority: 10;
		declarativeStencil: [ 
			(GtPhlowPictureWithDirectDataExampleStencil new)
				contentBytes: self class pictureBytes ]
]

{ #category : #views }
GtRemotePhlowExplicitViewTestObject >> gtViewPictureWithGenericPhlowStencilWithDirectDataFor: aView [
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
GtRemotePhlowExplicitViewTestObject >> gtViewPictureWithGenericPhlowStencilWithDirectDataUsingDedicatedApiFor: aView [
	<gtView>
	
	^(aView explicit)
		title: 'GT-Side stencil v1';
		priority: 20;
		localStencilName: #GtLocalPhlowPictureFullSizeViewStencil
			stencilData: [ ((GtRemotePhlowPictureViewData new)
				content: self class pictureBytes) ]
]
