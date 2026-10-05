Class {
	#name : #GtRemotePhlowDefiningMethodProvider,
	#superclass : #GtPhlowDefiningMethodProvider,
	#instVars : [
		'declarativeSpecification'
	],
	#category : #'GToolkit-RemoteGt-Phlow'
}

{ #category : #'as yet unclassified' }
GtRemotePhlowDefiningMethodProvider >> asBrMenuWithSelfObjectHolder: aSelfObjectHolder [
	^ BrMenuExplicit new
		stencil: [ :aMenuModel | 
			| aCoderElement |
			aCoderElement := self definingMethod asGtMethodCoderModel asElement.
			aCoderElement addAptitude: (BrGlamorousPopoverDefiningMethodAptitude new
		menuModel: aMenuModel).
			aCoderElement ]
]

{ #category : #accessing }
GtRemotePhlowDefiningMethodProvider >> declarativeAction: aDeclarativeView [
	self declarativeSpecification: aDeclarativeView
]

{ #category : #accessing }
GtRemotePhlowDefiningMethodProvider >> declarativeSpecification: aDeclarativeView [
	declarativeSpecification := aDeclarativeView
]

{ #category : #accessing }
GtRemotePhlowDefiningMethodProvider >> declarativeView: aDeclarativeView [
	self declarativeSpecification: aDeclarativeView
]

{ #category : #accessing }
GtRemotePhlowDefiningMethodProvider >> definingMethod [ 
	^ declarativeSpecification definingMethod
]

{ #category : #accessing }
GtRemotePhlowDefiningMethodProvider >> gtPhlowIncludesCompiledMethod: aCompiledMethod [
	"No need to trigger updates of remote views when local methods change"
	^ false
]
