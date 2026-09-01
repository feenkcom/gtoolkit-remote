Class {
	#name : #GtRemotePhlowPictureView,
	#superclass : #GtRemotePhlowLocalView,
	#instVars : [
		'pictureComputation',
		'widthComputation',
		'heightComputation',
		'mediaTypeComputation',
		'renderingStencilName',
		'shouldLoadContentLazily'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #converting }
GtRemotePhlowPictureView >> asGtDeclarativeView [
	| viewSpecification |
	viewSpecification := (GtRemotePhlowConcreteDataViewSpecification new)
				phlowDataSource: (GtRemotePhlowConcreteDataViewDataSource
							forPhlowView: self);
				renderingStencilName: self renderingStencilName;
				dataTransport: self currentDataTransport.
	self configureGenericViewSpecificationOn: viewSpecification.
	^viewSpecification
]

{ #category : #utils }
GtRemotePhlowPictureView >> computeViewData [
	^ GtRemotePhlowPictureViewData new
		content: self pictureComputation value;
		mediaType: self mediaTypeComputation value;
		width: self widthComputation value;
		height: self heightComputation value
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
GtRemotePhlowPictureView >> loadContentLazily [
	self shouldLoadContentLazily: true
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
	^ renderingStencilName ifNil: [ #GtLocalPhlowPictureScaledViewStencil ]
]

{ #category : #accessing }
GtRemotePhlowPictureView >> renderingStencilName: aSymbol [
	renderingStencilName := aSymbol
]

{ #category : #accessing }
GtRemotePhlowPictureView >> shouldLoadContentLazily [
	^ shouldLoadContentLazily ifNil: [ true ]
]

{ #category : #accessing }
GtRemotePhlowPictureView >> shouldLoadContentLazily: aBoolean [
	shouldLoadContentLazily := aBoolean.
]

{ #category : #accessing }
GtRemotePhlowPictureView >> width: anObject [
	widthComputation := anObject
]

{ #category : #accessing }
GtRemotePhlowPictureView >> widthComputation [
	^widthComputation
]
