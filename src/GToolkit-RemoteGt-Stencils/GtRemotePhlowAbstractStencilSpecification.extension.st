Extension { #name : #GtRemotePhlowAbstractStencilSpecification }

{ #category : #'*GToolkit-RemoteGt-Stencils' }
GtRemotePhlowAbstractStencilSpecification >> createStencil [
	^self subclassResponsibility
]

{ #category : #'*GToolkit-RemoteGt-Stencils' }
GtRemotePhlowAbstractStencilSpecification >> handleStencilSpecificationAfterDeserializationFrom: aViewSpecification [
	self dataSerializationStrategy 
		updateStencilSpecificationAfterDeserializationFor: self
		from: aViewSpecification.
]

{ #category : #'*GToolkit-RemoteGt-Stencils' }
GtRemotePhlowAbstractStencilSpecification >> handleStencilSpecificationBeforeSerializationFrom: aViewSpecification [
	self dataSerializationStrategy 
		prepareStencilSpecificationForSerializationFor: self
		from: aViewSpecification.
]
