Class {
	#name : #GtRemotePhlowDefiningMethodProvider,
	#superclass : #GtPhlowDefiningMethodProvider,
	#instVars : [
		'declarativeView'
	],
	#category : #'GToolkit-RemoteGt-Phlow'
}

{ #category : #accessing }
GtRemotePhlowDefiningMethodProvider >> declarativeView: aDeclarativeView [
	declarativeView := aDeclarativeView
]

{ #category : #accessing }
GtRemotePhlowDefiningMethodProvider >> definingMethod [ 
	^ declarativeView definingMethod
]
