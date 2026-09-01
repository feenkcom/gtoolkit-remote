Extension { #name : #GtRemotePhlowConcreteDataViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowConcreteDataViewSpecification >> createDeclarativeStencilForViewData: aViewData [
	^ aViewData isPhlowErrorData
		ifTrue: [ 
			GtPhlowErrorStencil new stencilData: aViewData ]
		ifFalse: [ 
			| stecil |
			stecil := GtPhlowNamedStencil new stencilClassName: self renderingStencilName.
			stecil stencilData: aViewData.
			stecil ]
]

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowConcreteDataViewSpecification >> viewFor: aView [
	| pictureView |
	pictureView := aView explicit
				originalView: aView;
				title: title;
				priority: priority;
				phlowViewSpecification: self;
				declarativeStencil: [
						| data |
						data := self phlowDataSource retrieveData.
						self createDeclarativeStencilForViewData: data ].
	self configureViewActionsFor: pictureView.
	^pictureView
]
