Extension { #name : #GtRemotePhlowConcreteDataViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowConcreteDataViewSpecification >> createDeclarativeContentStencil [
	| data |
	data := self phlowDataSource retrieveData.
	^ self createDeclarativeStencilForViewData: data
]

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
	
	pictureView := aView explicit.
		
	self configureBasicLocalView: pictureView for: aView.
	self configureViewActionsFor: pictureView.
	
	pictureView 
		declarativeStencil: [ self createDeclarativeContentStencil ].
		
	^pictureView
]
