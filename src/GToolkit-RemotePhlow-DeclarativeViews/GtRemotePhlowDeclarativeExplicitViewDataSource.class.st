Class {
	#name : #GtRemotePhlowDeclarativeExplicitViewDataSource,
	#superclass : #GtRemotePhlowDeclarativeViewDataSource,
	#instVars : [
		'cachedStencil'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #accessing }
GtRemotePhlowDeclarativeExplicitViewDataSource >> flushCachedData [
	cachedStencil := nil
]

{ #category : #accessing }
GtRemotePhlowDeclarativeExplicitViewDataSource >> phlowStencil [
	^ cachedStencil ifNil: [
			cachedStencil := self phlowView computePhlowStencil ]
]

{ #category : #accessing }
GtRemotePhlowDeclarativeExplicitViewDataSource >> retrieveStencilData [
	^ [ self phlowStencil stencilData value ]
			on: Error
			do: [:e |
				(GtRemotePhlowViewErrorData new)
					errorDescription: e messageText;
					errorObject: e]
]

{ #category : #accessing }
GtRemotePhlowDeclarativeExplicitViewDataSource >> retrieveStencilSpecification [
	^ [ self phlowStencil asGtStencilSpecification  ]
			on: Error
			do: [ :anException |
				(GtPhlowErrorStencil forException: anException)
					asGtStencilSpecification ]
]
