"
I am an example of a phlow stencil with data that can be used both locally and remotley
"
Class {
	#name : #GtPhlowPictureWithExplicitDataExampleRemoteStencil,
	#superclass : #GtPhlowForwardStencil,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #building }
GtPhlowPictureWithExplicitDataExampleRemoteStencil >> configureImageElement: anImageElement [
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
GtPhlowPictureWithExplicitDataExampleRemoteStencil >> stencilClassName [
	^ self class name
]
