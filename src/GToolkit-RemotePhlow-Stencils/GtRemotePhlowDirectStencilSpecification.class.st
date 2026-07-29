Class {
	#name : #GtRemotePhlowDirectStencilSpecification,
	#superclass : #GtRemotePhlowAbstractStencilSpecification,
	#instVars : [
		'stencilData',
		'stencilClassName'
	],
	#category : #'GToolkit-RemotePhlow-Stencils'
}

{ #category : #accessing }
GtRemotePhlowDirectStencilSpecification >> asDictionaryForExport [
	^(super asDictionaryForExport)
		at: 'stencilClassName' put: stencilClassName;
		at: 'stencilData' put: stencilData;
		yourself
]

{ #category : #initialization }
GtRemotePhlowDirectStencilSpecification >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	
	self stencilClassName: (aDictionary at: 'stencilClassName' ) asSymbol.
	self stencilData: (aDictionary at: 'stencilData' ifAbsent: [ nil ])
]

{ #category : #accessing }
GtRemotePhlowDirectStencilSpecification >> stencilClassName [
	^ stencilClassName
]

{ #category : #accessing }
GtRemotePhlowDirectStencilSpecification >> stencilClassName: anObject [
	stencilClassName := anObject
]

{ #category : #accessing }
GtRemotePhlowDirectStencilSpecification >> stencilData [
	^ stencilData
]

{ #category : #accessing }
GtRemotePhlowDirectStencilSpecification >> stencilData: anObject [
	stencilData := anObject
]
