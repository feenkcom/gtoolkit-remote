Class {
	#name : #GtLocalPhlowPictureScaledViewStencil,
	#superclass : #GtLocalPhlowPictureViewStencil,
	#category : #'GToolkit-RemoteGt-Stencils'
}

{ #category : #building }
GtLocalPhlowPictureScaledViewStencil >> create [
	| imageElement |
	imageElement := self imageElementFor: stencilData.
	self configureImageElement: imageElement.
	^(imageElement asScalableElement)
		id: GtLocalPhlowPictureElementId;
		margin: (BlInsets all: 10)
]
