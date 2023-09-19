Class {
	#name : #GtRemotePhlowItemExceptionWrapper,
	#superclass : #Object,
	#instVars : [
		'exceptionDescription'
	],
	#category : #'GToolkit-RemoteGt-Declarative Views'
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
