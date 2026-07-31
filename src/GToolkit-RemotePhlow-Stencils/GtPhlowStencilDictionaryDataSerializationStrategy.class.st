Class {
	#name : #GtPhlowStencilDictionaryDataSerializationStrategy,
	#superclass : #GtPhlowStencilDataSerializationStrategy,
	#category : #'GToolkit-RemotePhlow-Stencils'
}

{ #category : #api }
GtPhlowStencilDictionaryDataSerializationStrategy >> prepareStencilSpecificationForSerializationFor: aStencilSpecification from: aDataProvider [
	| dictionary |
	
	dictionary := aDataProvider retrievePrimitiveStencilData.
	aStencilSpecification propertyAt: 'rawData' put: dictionary.
]

{ #category : #'as yet unclassified' }
GtPhlowStencilDictionaryDataSerializationStrategy >> updateStencilSpecificationAfterDeserializationFor: aSpecificationStencil from: aViewSpecification [
	| dictionary data |
	(aSpecificationStencil hasProperty: 'rawData') ifFalse: [ ^ self ].
	
	dictionary := aSpecificationStencil propertyAt: 'rawData' .
	data := GtRemotePhlowBasicViewData fromDictionary: dictionary.
	aSpecificationStencil stencilData: data
]
