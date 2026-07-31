Class {
	#name : #GtLocalPhlowPictureFullSizeViewStencil,
	#superclass : #GtLocalPhlowPictureViewStencil,
	#category : #'GToolkit-RemoteGt-Stencils'
}

{ #category : #building }
GtLocalPhlowPictureFullSizeViewStencil >> create [
	| imageElement |
	imageElement := self imageElementFor: stencilData.
	self configureImageElement: imageElement.
	^imageElement asScrollableElement 
		id: GtLocalPhlowPictureElementId;
		margin: (BlInsets all: 10)
]
