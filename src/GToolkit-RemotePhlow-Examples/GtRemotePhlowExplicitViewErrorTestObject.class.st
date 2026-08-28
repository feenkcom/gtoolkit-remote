Class {
	#name : #GtRemotePhlowExplicitViewErrorTestObject,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #'as yet unclassified' }
GtRemotePhlowExplicitViewErrorTestObject >> gtExplicitPictureViewWithStencilDataFor: aView [
	<gtView>
	
	^(aView explicit)
		title: 'Picture (stencil API)';
		priority: 20;
		localStencilName: #GtLocalPhlowPictureFullSizeViewStencil
			stencilData: [ 
				self error: 'Stencil data computation with exception']
]

{ #category : #views }
GtRemotePhlowExplicitViewErrorTestObject >> gtExplicitPictureViewWithStencilErrorFor: aView [
	<gtView>
	^(aView explicit)
		title: 'Picture (stencil error)';
		priority: 25;
		declarativeStencil: [
			self error: 'Declarative stencil computation with exception']
]
