Class {
	#name : #GtRemotePhlowForwardStencilSpecification,
	#superclass : #GtRemotePhlowAbstractStencilSpecification,
	#instVars : [
		'stencilClassName',
		'stencilData',
		'originalStencil',
		'isPhlowErrorSpecification'
	],
	#category : #'GToolkit-RemotePhlow-Stencils'
}

{ #category : #converting }
GtRemotePhlowForwardStencilSpecification >> asDictionaryForExport [
	^(super asDictionaryForExport)
		at: 'stencilClassName' put: stencilClassName;
		at: 'isPhlowErrorSpecification' put: isPhlowErrorSpecification;
		at: 'originalStencil' put: originalStencil;
		at: 'stencilData' put: stencilData;
		yourself
]

{ #category : #initialization }
GtRemotePhlowForwardStencilSpecification >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	
	self stencilClassName: (aDictionary at: 'stencilClassName' ) asSymbol.
	self isPhlowErrorSpecification: (aDictionary at: 'isPhlowErrorSpecification').
	self originalStencil: (aDictionary at: 'originalStencil' ifAbsent: [ nil ]).
	self stencilData: (aDictionary at: 'stencilData' ifAbsent: [ nil ])
]

{ #category : #accessing }
GtRemotePhlowForwardStencilSpecification >> isPhlowErrorSpecification [
	^ isPhlowErrorSpecification ifNil: [ false ]
]

{ #category : #accessing }
GtRemotePhlowForwardStencilSpecification >> isPhlowErrorSpecification: aBoolean [
	isPhlowErrorSpecification := aBoolean
]

{ #category : #accessing }
GtRemotePhlowForwardStencilSpecification >> originalStencil [
	^ originalStencil
]

{ #category : #accessing }
GtRemotePhlowForwardStencilSpecification >> originalStencil: anObject [
	originalStencil := anObject
]

{ #category : #accessing }
GtRemotePhlowForwardStencilSpecification >> stencilClassName [
	^stencilClassName
]

{ #category : #accessing }
GtRemotePhlowForwardStencilSpecification >> stencilClassName: aSymbol [
	stencilClassName := aSymbol
]

{ #category : #accessing }
GtRemotePhlowForwardStencilSpecification >> stencilData [
	^ stencilData
]

{ #category : #accessing }
GtRemotePhlowForwardStencilSpecification >> stencilData: anObject [
	stencilData := anObject
]
