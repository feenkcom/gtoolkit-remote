"
I am an example of a phlow stencil with data that can be used both locally and remotley
"
Class {
	#name : #GtPhlowPictureWithExplicitDataExampleStencil,
	#superclass : #GtPhlowWithDataStencil,
	#category : #'GToolkit-RemotePhlow-Stencils'
}

{ #category : #converting }
GtPhlowPictureWithExplicitDataExampleStencil >> asGtStencilSpecification [
	^ GtRemotePhlowForwardStencilSpecification new
		stencilClassName: self class name;
		stencilData: self stencilData;
		originalStencil: self
]

{ #category : #building }
GtPhlowPictureWithExplicitDataExampleStencil >> configureImageElement: anImageElement [
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
