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
	"These phlow stencils are directly serializable; they are their own specification"
	^ self
]

{ #category : #converting }
GtPhlowStencil >> createStencil [
	^ self
]

{ #category : #views }
GtPhlowStencil >> gtLiveFor: aView [
	<gtView>
	
	^ aView explicit
		title: 'Live';
		priority: 10;
		declarativeStencil: [ self ]
]

{ #category : #testing }
GtPhlowStencil >> isPhlowErrrorStencil [
	^ false
]
