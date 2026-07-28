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
GtRemotePhlowExplicitViewTestObject >> gtViewPictureWithGenericPhlowStencilWithDirectDataFor: aView [
	<gtView>
	
	^(aView explicit)
		title: 'Picture (stencil API)';
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
		title: 'Picture (dedicated API)';
		priority: 20;
		declarativeStencilName: #GtLocalPhlowPictureFullSizeViewStencil
			stencilData: [ ((GtRemotePhlowPictureViewData new)
				content: self class pictureBytes) ]
]
