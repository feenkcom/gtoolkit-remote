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
GtRemotePhlowDeclarativeExplicitViewDataSource >> retrievePrimitiveStencilData [
	^self retrieveStencilData asDictionaryForExport
]

{ #category : #accessing }
GtRemotePhlowDeclarativeExplicitViewDataSource >> retrievePrimitiveStencilSpecificationData [
	^self retrieveStencilSpecification asDictionaryForExport
]

{ #category : #accessing }
GtRemotePhlowDeclarativeExplicitViewDataSource >> retrieveStencilData [
	^ [ self phlowStencil stencilData ]
			on: Error
			do: [ :anException | self captureErrorDataFor: anException]
]

{ #category : #accessing }
GtRemotePhlowDeclarativeExplicitViewDataSource >> retrieveStencilDataWithSerializerNamed: aDataSerializationStrategyClass [
	^ self retrieveStencilData
]

{ #category : #accessing }
GtRemotePhlowDeclarativeExplicitViewDataSource >> retrieveStencilSpecification [
	^ [ self phlowStencil asGtStencilSpecificationFrom: self ]
			on: Error
			do: [ :anException |
				(GtPhlowErrorStencil new 
					stencilData: (self captureErrorDataFor: anException))
						asGtStencilSpecificationFrom: self ]
]
