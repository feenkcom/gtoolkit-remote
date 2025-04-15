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
			aCoderElement
				hExact: 500;
				vFitContentLimited;
				background: aCoderElement theme default contentBackgroundColor;
				addAptitude: (BrGlamorousMenuPinnableAptitude new
						menuModel: aMenuModel;
						withResizers;
						withAllPinActions);
				addAptitude: (BrMenuHideableAptitude new menuModel: aMenuModel);
				addAptitude: BrMenuCommonAptitude new ]
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
