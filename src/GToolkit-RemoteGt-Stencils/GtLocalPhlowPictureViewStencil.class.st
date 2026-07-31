Class {
	#name : #GtLocalPhlowPictureViewStencil,
	#superclass : #GtLocalPhlowWithDataStencil,
	#category : #'GToolkit-RemoteGt-Stencils'
}

{ #category : #building }
GtLocalPhlowPictureViewStencil >> configureImageElement: anImageElement [
	stencilData width 
		ifNil: [
			anImageElement constraintsDo: [:c |
				c horizontal matchParent] ]
		ifNotNil: [:w | 
			anImageElement constraintsDo: 	[:c |
				c horizontal exact: w ] ].
	
	stencilData height 
		ifNil: [
			anImageElement constraintsDo: [:c |
				c vertical matchParent] ]
		ifNotNil: [:h | 
			anImageElement constraintsDo: 	[:c |
				c vertical exact: h ] ].
]

{ #category : #building }
GtLocalPhlowPictureViewStencil >> imageElementFor: aData [
	^ BlSpartaBufferedImageElement buffer: aData content
]
