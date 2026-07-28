Class {
	#name : #GtRemotePhlowExplicitView,
	#superclass : #GtRemotePhlowView,
	#instVars : [
		'phlowStencilComputation'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #converting }
GtRemotePhlowExplicitView >> asGtDeclarativeView [
	| viewSpecification |
	viewSpecification := (GtRemotePhlowExplicitViewSpecification new)
				phlowDataSource: (GtRemotePhlowDeclarativeExplicitViewDataSource
							forPhlowView: self);
				dataTransport: GtPhlowViewSpecification dataLazy.
	self configureGenericViewSpecificationOn: viewSpecification.
	^viewSpecification
]

{ #category : #accessing }
GtRemotePhlowExplicitView >> computePhlowStencil [
	^ self phlowStencilComputation value
]

{ #category : #'api - scripting' }
GtRemotePhlowExplicitView >> declarativeStencil: aStencilBuilder [
	self phlowStencilComputation: aStencilBuilder
]

{ #category : #'api - scripting' }
GtRemotePhlowExplicitView >> declarativeStencilName: aStencilClassName stencilData: aBlockClosure [
	self declarativeStencil: [
		GtPhlowNamedStencil new
				stencilClassName: aStencilClassName;
				stencilDataComputation: aBlockClosure ]
]

{ #category : #accessing }
GtRemotePhlowExplicitView >> phlowStencilComputation [
	^ phlowStencilComputation
]

{ #category : #accessing }
GtRemotePhlowExplicitView >> phlowStencilComputation: anObject [
	phlowStencilComputation := anObject
]
