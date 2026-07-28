Class {
	#name : #GtRemotePhlowPictureView,
	#superclass : #GtRemotePhlowLocalView,
	#instVars : [
		'pictureComputation',
		'renderingStencilSpecification',
		'widthComputation',
		'heightComputation',
		'mediaTypeComputation'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #converting }
GtRemotePhlowPictureView >> asGtDeclarativeView [
	| viewSpecification |
	viewSpecification := (GtRemotePhlowPictureViewSpecification new)
				phlowDataSource: (GtRemotePhlowDeclarativePictureViewDataSource
							forPhlowView: self);
				renderingStencilSpecification: self renderingStencilSpecification;
				dataTransport: GtPhlowViewSpecification dataLazy.
	self configureGenericViewSpecificationOn: viewSpecification.
	^viewSpecification
]

{ #category : #building }
GtRemotePhlowPictureView >> content: aBlock [
	pictureComputation := aBlock
]

{ #category : #accessing }
GtRemotePhlowPictureView >> height: anObject [
	heightComputation := anObject
]

{ #category : #accessing }
GtRemotePhlowPictureView >> heightComputation [
	^heightComputation
]

{ #category : #accessing }
GtRemotePhlowPictureView >> mediaType: anObject [
	mediaTypeComputation := anObject
]

{ #category : #accessing }
GtRemotePhlowPictureView >> mediaTypeComputation [
	^mediaTypeComputation
]

{ #category : #accessing }
GtRemotePhlowPictureView >> pictureComputation [
	^pictureComputation
]

{ #category : #accessing }
GtRemotePhlowPictureView >> pictureComputation: aBlock [
	pictureComputation := aBlock
]

{ #category : #accessing }
GtRemotePhlowPictureView >> renderingStencilName: aSymbol [
	renderingStencilSpecification := GtRemotePhlowTypedStencilSpecification new 
			stencilClassName: aSymbol
]

{ #category : #accessing }
GtRemotePhlowPictureView >> renderingStencilSpecification [
	^renderingStencilSpecification
		ifNil: [
			GtRemotePhlowTypedStencilSpecification new
				stencilClassName: #GtLocalPhlowPictureScaledViewStencil ]
]

{ #category : #accessing }
GtRemotePhlowPictureView >> renderingStencilSpecification: aStencilSpecification [
	renderingStencilSpecification := aStencilSpecification
]

{ #category : #accessing }
GtRemotePhlowPictureView >> width: anObject [
	widthComputation := anObject
]

{ #category : #accessing }
GtRemotePhlowPictureView >> widthComputation [
	^widthComputation
]
