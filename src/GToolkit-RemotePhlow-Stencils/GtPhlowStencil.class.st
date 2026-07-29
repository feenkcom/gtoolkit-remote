"
I represent a stencil that is directly serializable.
"
Class {
	#name : #GtPhlowStencil,
	#superclass : #GtPhlowDeclarativeSpecification,
	#category : #'GToolkit-RemotePhlow-Stencils'
}

{ #category : #converting }
GtPhlowStencil >> asGtStencilSpecification [
	^ GtRemotePhlowDirectStencilSpecification new
		stencilClassName: self class name;
		stencilData: self asDictionaryForExport
]

{ #category : #views }
GtPhlowStencil >> gtLiveFor: aView [
	<gtView>
	
	^ aView explicit
		title: 'Live';
		priority: 10;
		declarativeStencil: [ self ]
]

{ #category : #init }
GtPhlowStencil >> initializeFromStencilSpecification: aStencilSpecification [
	self initializeFromJSONDictionary: aStencilSpecification stencilData.
]

{ #category : #testing }
GtPhlowStencil >> isPhlowErrrorStencil [
	^ false
]
