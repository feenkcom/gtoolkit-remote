Class {
	#name : #GtRemotePhlowLocalView,
	#superclass : #GtRemotePhlowView,
	#instVars : [
		'localOriginalView',
		'localBuildContext',
		'localDefiningMethodProvider'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #accessing }
GtRemotePhlowLocalView >> buildContext [
	^localBuildContext
]

{ #category : #accessing }
GtRemotePhlowLocalView >> buildContext: aGtPhlowBuildContext [
	localBuildContext := aGtPhlowBuildContext
]

{ #category : #accessing }
GtRemotePhlowLocalView >> definingClass [
	localDefiningMethodProvider
		ifNotNil: [ :aProvider | ^aProvider definingMethod methodClass].
	^super definingClass
]

{ #category : #accessing }
GtRemotePhlowLocalView >> definingMethod [
	localDefiningMethodProvider
		ifNotNil: [ :aProvider | ^aProvider definingMethod].
	^super definingMethod
]

{ #category : #accessing }
GtRemotePhlowLocalView >> definingSelector [
	super definingSelector 
		ifNotNil: [ :aSelector | ^ aSelector ].
	
	localDefiningMethodProvider
		ifNotNil: [:provider | ^provider definingMethod selector].
	^ nil
]

{ #category : #accessing }
GtRemotePhlowLocalView >> localDefiningMethodProvider [
	^localDefiningMethodProvider
]

{ #category : #accessing }
GtRemotePhlowLocalView >> localDefiningMethodProvider: aMethodProvider [
	localDefiningMethodProvider := aMethodProvider
]

{ #category : #accessing }
GtRemotePhlowLocalView >> originalView [
	^localOriginalView
]

{ #category : #accessing }
GtRemotePhlowLocalView >> originalView: aView [
	localOriginalView := aView
]
