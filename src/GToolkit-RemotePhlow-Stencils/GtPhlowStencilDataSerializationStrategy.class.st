Class {
	#name : #GtPhlowStencilDataSerializationStrategy,
	#superclass : #GtPhlowDeclarativeSpecification,
	#category : #'GToolkit-RemotePhlow-Stencils'
}

{ #category : #api }
GtPhlowStencilDataSerializationStrategy class >> forDirectProxy [
	^ GtPhlowStencilMediumSerializationStrategy new 
		serializationStrategyName:#GtRsrProxyOnlySerializationStrategy
]

{ #category : #api }
GtPhlowStencilDataSerializationStrategy class >> forManualDictionary [
	^ GtPhlowStencilDictionaryDataSerializationStrategy new
]

{ #category : #api }
GtPhlowStencilDataSerializationStrategy class >> forWireEncoding [
	^ GtPhlowStencilMediumSerializationStrategy new 
		serializationStrategyName:#GtRsrWireSerializationStrategy
]

{ #category : #api }
GtPhlowStencilDataSerializationStrategy >> prepareStencilSpecificationForSerializationFor: aStencilSpecification from: aViewSpecification [
]

{ #category : #api }
GtPhlowStencilDataSerializationStrategy >> updateStencilSpecificationAfterDeserializationFor: aStencil from: aViewSpecification [
]
