Extension { #name : #GtRemotePhlowPictureViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowPictureViewSpecification >> buildErrorElementFor: anErrorData [
	^anErrorData asDebuggableElement
]

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowPictureViewSpecification >> buildPictureElementFor: aData [
	| stencil |
	stencil := self renderingStencilSpecification createStencil.
	stencil stencilData: aData.
	^stencil create
]

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowPictureViewSpecification >> viewFor: aView [
	| pictureView |
	pictureView := (GtPhlowExplicitWithSpecificationView new)
				originalView: aView;
				title: title;
				priority: priority;
				specification: 
						[| dict |
						dict := self asDictionaryForExportWithPhlowDataSource.
						GtPhlowViewSpecification fromDictionary: dict];
				stencil: 
						[| data |
						data := self phlowDataSource retrieveData.
						data isError
							ifTrue: [self buildErrorElementFor: data]
							ifFalse: [self buildPictureElementFor: data]].
	self configureViewActionsFor: pictureView.
	^pictureView
]
