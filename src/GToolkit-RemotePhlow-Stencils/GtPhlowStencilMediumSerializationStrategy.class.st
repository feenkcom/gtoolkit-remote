Class {
	#name : #GtPhlowStencilMediumSerializationStrategy,
	#superclass : #GtPhlowStencilDataSerializationStrategy,
	#instVars : [
		'serializationStrategyName'
	],
	#category : #'GToolkit-RemotePhlow-Stencils'
}

{ #category : #converting }
GtPhlowStencilMediumSerializationStrategy >> asDictionaryForExport [
	^(super asDictionaryForExport)
		at: 'serializationStrategyName' put: serializationStrategyName;
		yourself
]

{ #category : #initialization }
GtPhlowStencilMediumSerializationStrategy >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	
	self serializationStrategyName: (aDictionary at: 'serializationStrategyName' ) asSymbol.
]

{ #category : #accessing }
GtPhlowStencilMediumSerializationStrategy >> serializationStrategyName [
	^ serializationStrategyName
]

{ #category : #accessing }
GtPhlowStencilMediumSerializationStrategy >> serializationStrategyName: anObject [
	serializationStrategyName := anObject
]

{ #category : #api }
GtPhlowStencilMediumSerializationStrategy >> updateStencilSpecificationAfterDeserializationFor: aSpecificationStencil from: aViewSpecification [
	| data |
	data := aViewSpecification 
		retrieveStencilDataWithSerializerNamed: self serializationStrategyName.
	aSpecificationStencil stencilData: data
]
