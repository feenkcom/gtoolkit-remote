Class {
	#name : #GtRemotePhlowPictureView,
	#superclass : #GtRemotePhlowLocalView,
	#instVars : [
		'pictureComputation',
		'widthComputation',
		'heightComputation',
		'mediaTypeComputation',
		'renderingStencilName'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #converting }
GtRemotePhlowPictureView >> asGtDeclarativeView [
	| viewSpecification |
	viewSpecification := (GtRemotePhlowPictureViewSpecification new)
				phlowDataSource: (GtRemotePhlowDeclarativePictureViewDataSource
							forPhlowView: self);
				renderingStencilName: self renderingStencilName;
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
GtRemotePhlowPictureView >> renderingStencilName [
	^ renderingStencilName
]

{ #category : #accessing }
GtRemotePhlowPictureView >> renderingStencilName: aSymbol [
	renderingStencilName := aSymbol
]

{ #category : #accessing }
GtRemotePhlowPictureView >> width: anObject [
	widthComputation := anObject
]

{ #category : #accessing }
GtRemotePhlowPictureView >> widthComputation [
	^widthComputation
]
