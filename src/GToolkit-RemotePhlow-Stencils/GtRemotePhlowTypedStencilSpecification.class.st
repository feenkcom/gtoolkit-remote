Class {
	#name : #GtRemotePhlowTypedStencilSpecification,
	#superclass : #GtRemotePhlowAbstractStencilSpecification,
	#instVars : [
		'stencilClassName'
	],
	#category : #'GToolkit-RemotePhlow-Stencils'
}

{ #category : #converting }
GtRemotePhlowTypedStencilSpecification >> asDictionaryForExport [
	^(super asDictionaryForExport)
		at: 'stencilClassName' put: stencilClassName;
		yourself
]

{ #category : #initialization }
GtRemotePhlowTypedStencilSpecification >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	
	self stencilClassName: (aDictionary at: 'stencilClassName') asSymbol
]

{ #category : #accessing }
GtRemotePhlowTypedStencilSpecification >> stencilClassName [
	^stencilClassName
]

{ #category : #accessing }
GtRemotePhlowTypedStencilSpecification >> stencilClassName: aSymbol [
	stencilClassName := aSymbol
]
