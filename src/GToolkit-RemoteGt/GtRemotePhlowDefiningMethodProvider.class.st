Class {
	#name : #GtRemotePhlowDefiningMethodProvider,
	#superclass : #GtPhlowDefiningMethodProvider,
	#instVars : [
		'declarativeView'
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
GtRemotePhlowDefiningMethodProvider >> declarativeView: aDeclarativeView [
	declarativeView := aDeclarativeView
]

{ #category : #accessing }
GtRemotePhlowDefiningMethodProvider >> definingMethod [ 
	^ declarativeView definingMethod
]

{ #category : #accessing }
GtRemotePhlowDefiningMethodProvider >> gtPhlowIncludesCompiledMethod: aCompiledMethod [
	"No need to trigger updates of remote views when local methods change"
	^ false
]
