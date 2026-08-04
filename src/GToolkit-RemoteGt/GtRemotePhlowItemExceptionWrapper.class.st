Class {
	#name : #GtRemotePhlowItemExceptionWrapper,
	#superclass : #Object,
	#instVars : [
		'exceptionDescription',
		'exceptionObject'
	],
	#category : 'GToolkit-RemoteGt-Declarative Views'
}

{ #category : #accessing }
GtRemotePhlowItemExceptionWrapper >> asDebuggableElement [
	^ (GtRemotePhlowRemoteExceptionStencil new 
		exceptionWrapper:  self) asElement
]

{ #category : #accessing }
GtRemotePhlowItemExceptionWrapper >> exceptionDescription [
	^ exceptionDescription
]

{ #category : #accessing }
GtRemotePhlowItemExceptionWrapper >> exceptionDescription: aString [
	exceptionDescription := aString
]

{ #category : #accessing }
GtRemotePhlowItemExceptionWrapper >> exceptionObject [
	^ exceptionObject
]

{ #category : #accessing }
GtRemotePhlowItemExceptionWrapper >> exceptionObject: anObject [
	exceptionObject := anObject
]

{ #category : #views }
GtRemotePhlowItemExceptionWrapper >> gtLiveFor: aView [
	<gtView>
	^ aView explicit
		title: 'Live';
		stencil: [ self asDebuggableElement ]
]
