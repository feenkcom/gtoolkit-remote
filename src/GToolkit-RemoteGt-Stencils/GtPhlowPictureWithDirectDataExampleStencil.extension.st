Extension { #name : #GtPhlowPictureWithDirectDataExampleStencil }

{ #category : #'*GToolkit-RemoteGt-Stencils' }
GtPhlowPictureWithDirectDataExampleStencil >> create [
	| imageElement |
	
	imageElement := BlSpartaBufferedImageElement buffer: contentBytes.
	imageElement constraintsDo: [:c |
			c horizontal matchParent.
			c vertical matchParent] .
	
	^(imageElement asScalableElement)
		id: GtLocalPhlowPictureElementId
]
