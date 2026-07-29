Extension { #name : #GtPhlowPictureWithExplicitDataExampleStencil }

{ #category : #'*GToolkit-RemoteGt-Stencils' }
GtPhlowPictureWithExplicitDataExampleStencil >> create [
	| imageElement |
	
	imageElement := self imageElementFor: stencilData.
	self configureImageElement: imageElement.
	
	^(imageElement asScalableElement)
		id: GtLocalPhlowPictureElementId;
		margin: (BlInsets all: 10)
]

{ #category : #'*GToolkit-RemoteGt-Stencils' }
GtPhlowPictureWithExplicitDataExampleStencil >> imageElementFor: aData [
	^ BlSpartaBufferedImageElement buffer: aData content
]
