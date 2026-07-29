"
I represent a stencil that can exit remotley as an instance as is serializable using a specification.

The specification has the data relevant to this stencil that then can be used to instantiate a local stencil.
The local stencil could be of the same type, or of a different type.
"
Class {
	#name : #GtPhlowWithSpecificationStencil,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Stencils'
}

{ #category : #converting }
GtPhlowWithSpecificationStencil >> asGtStencilSpecification [
	"These stencil should define their explicit specification"
	^ nil
]

{ #category : #converting }
GtPhlowWithSpecificationStencil >> asGtStencilSpecificationFrom: aDataProvider [
	| stencilSpecification |
	stencilSpecification := self asGtStencilSpecification.
	stencilSpecification ifNil: [ ^ nil ].
	
	stencilSpecification handleStencilSpecificationBeforeSerializationFrom: aDataProvider.
	^ stencilSpecification
]

{ #category : #views }
GtPhlowWithSpecificationStencil >> gtLiveFor: aView [
	<gtView>
	
	^ aView explicit
		title: 'Live';
		priority: 10;
		declarativeStencil: [ self ]
]
