Class {
	#name : #GtRemotePhlowExplicitViewSpecification,
	#superclass : #GtPhlowViewSpecification,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtRemotePhlowExplicitViewSpecification class >> fromJSONDictionary: aDictionary [
	| specification |
	specification := super fromJSONDictionary: aDictionary.
	^specification
]

{ #category : #converting }
GtRemotePhlowExplicitViewSpecification >> asBasicViewDataForExport [
	| dictionary |
	dictionary := super asBasicViewDataForExport.
	^dictionary
]

{ #category : #initialization }
GtRemotePhlowExplicitViewSpecification >> initializeFromInspector: anInspector [
	self phlowDataSource ifNil: [	
			self phlowDataSource: (anInspector getDeclarativeViewFor: self methodSelector) ]
]

{ #category : #accessing }
GtRemotePhlowExplicitViewSpecification >> retrievePrimitiveStencilData [
	^self phlowDataSource retrievePrimitiveStencilData
]

{ #category : #accessing }
GtRemotePhlowExplicitViewSpecification >> retrievePrimitiveStencilSpecificationData [
	^self phlowDataSource retrievePrimitiveStencilSpecificationData
]

{ #category : #accessing }
GtRemotePhlowExplicitViewSpecification >> retrieveStencilData [
	^self phlowDataSource retrieveStencilData
]

{ #category : #accessing }
GtRemotePhlowExplicitViewSpecification >> retrieveStencilDataWithSerializerNamed: aDataSerializationStrategyClass [
	^ self phlowDataSource 
		retrieveStencilDataWithSerializerNamed: aDataSerializationStrategyClass
]

{ #category : #accessing }
GtRemotePhlowExplicitViewSpecification >> retrieveStencilSpecification [
	^self phlowDataSource retrieveStencilSpecification
]
