Extension { #name : #GtRemotePhlowPictureViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowPictureViewSpecification >> viewFor: aView [
	| pictureView |
	pictureView := aView explicit
				originalView: aView;
				title: title;
				priority: priority;
				declarativeStencil: [
						| data |
						data := self phlowDataSource retrieveData.
						self createStencilForViewData: data ].
	self configureViewActionsFor: pictureView.
	^pictureView
]
