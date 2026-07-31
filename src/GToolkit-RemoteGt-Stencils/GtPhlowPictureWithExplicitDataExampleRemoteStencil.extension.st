Extension { #name : #GtPhlowPictureWithExplicitDataExampleRemoteStencil }

{ #category : #'*GToolkit-RemoteGt-Stencils' }
GtPhlowPictureWithExplicitDataExampleRemoteStencil >> create [
	| imageElement |
	
	imageElement := self imageElementFor: stencilData.
	self configureImageElement: imageElement.
	
	^(imageElement asScalableElement)
		id: GtLocalPhlowPictureElementId;
		margin: (BlInsets all: 10)
]

{ #category : #'*GToolkit-RemoteGt-Stencils' }
GtPhlowPictureWithExplicitDataExampleRemoteStencil >> imageElementFor: aData [
	^ BlSpartaBufferedImageElement buffer: aData content
]
