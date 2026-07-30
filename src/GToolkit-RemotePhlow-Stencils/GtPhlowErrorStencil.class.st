Class {
	#name : #GtPhlowErrorStencil,
	#superclass : #GtPhlowForwardStencil,
	#category : #'GToolkit-RemotePhlow-Stencils'
}

{ #category : #'instance creation' }
GtPhlowErrorStencil class >> forException: anException [
	^self new 
		initializeForException: anException
]

{ #category : #initialization }
GtPhlowErrorStencil >> asGtStencilSpecification [
	^ super asGtStencilSpecification
		dataSerializationStrategy: GtPhlowStencilDictionaryDataSerializationStrategy new
]

{ #category : #initialization }
GtPhlowErrorStencil >> initializeForException: anException [
	self stencilData: ((GtRemotePhlowViewErrorData new)
			errorDescription: anException messageText;
			errorObject: anException )
]

{ #category : #testing }
GtPhlowErrorStencil >> isPhlowErrrorStencil [
	^ true
]

{ #category : #accessing }
GtPhlowErrorStencil >> stencilClassName [
	^ #GtLocalPhlowExceptionStencil
]
