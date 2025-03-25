Class {
	#name : #GtRemotePhlowAction,
	#superclass : #Object,
	#instVars : [
		'id',
		'priority',
		'tooltipText',
		'definingSelector',
		'definingClass'
	],
	#category : #'GToolkit-RemotePhlow-PhlowActions'
}

{ #category : #accessing }
GtRemotePhlowAction class >> handledExceptions [
	"Explicitly catch here Halt and Warning as in case an action raising 
	those exceptions is embedded in the debugger it will trigger an
	infinite chain of debuggers.
	https://github.com/feenkcom/gtoolkit/issues/4383"
	
	^ Error, Halt, Warning
]

{ #category : #accessing }
GtRemotePhlowAction >> asGtDeclarativeAction [
	^ nil
]

{ #category : #'message performing' }
GtRemotePhlowAction >> basicOn: anObject perform: aMessageSymbol withArguments: aCollectionOfArguments [ 
	^ anObject  
		perform: aMessageSymbol
		with: aCollectionOfArguments first
]

{ #category : #decorating }
GtRemotePhlowAction >> button [
	^ GtRemotePhlowButtonAction new
]

{ #category : #testing }
GtRemotePhlowAction >> canBeGtDeclarativeAction [
	^ true
]

{ #category : #accessing }
GtRemotePhlowAction >> definingClass [
	^ definingClass
]

{ #category : #accessing }
GtRemotePhlowAction >> definingClass: aClass [
	definingClass := aClass
]

{ #category : #accessing }
GtRemotePhlowAction >> definingMethod [
	^ (self definingClass whichClassIncludesSelector: self definingSelector) 
		ifNil: [ nil ]
		ifNotNil: [ :aClass | aClass compiledMethodAt: self definingSelector ]
]

{ #category : #accessing }
GtRemotePhlowAction >> definingSelector [

	^ definingSelector
]

{ #category : #accessing }
GtRemotePhlowAction >> definingSelector: aSelector [

	definingSelector := aSelector
]

{ #category : #accessing }
GtRemotePhlowAction >> id [
	^ id
]

{ #category : #accessing }
GtRemotePhlowAction >> id: anId [
	id := anId
]

{ #category : #decorating }
GtRemotePhlowAction >> noAction [
	^ GtRemotePhlowNoAction new
]

{ #category : #'message performing' }
GtRemotePhlowAction >> on: anObject perform: aMessageSymbol [ 
	<return: #GtRemotePhlowAction>
	
	^ self 
		on: anObject 
		perform: aMessageSymbol 
		withArguments: { self }
]

{ #category : #'message performing' }
GtRemotePhlowAction >> on: anObject perform: aMessageSymbol withArguments: aCollectionOfArguments [
	<return: #GtRemotePhlowAction>
	
	^ [ 
			self 
				basicOn: anObject 
				perform: aMessageSymbol 
				withArguments: aCollectionOfArguments
		
	] 
		on: self class handledExceptions do: [ :anException |
			self 
				phlowErrorActionWithException: anException 
				forBuildContext: nil "(GtPhlowBuildContext new 
					object: anObject; 
					arguments: aCollectionOfArguments) "
				andSelector: aMessageSymbol ]
]

{ #category : #'error handling' }
GtRemotePhlowAction >> phlowErrorActionWithException: anException [ 
	^ GtRemotePhlowErrorAction new
		errorMessage: anException description
]

{ #category : #'error handling' }
GtRemotePhlowAction >> phlowErrorActionWithException: anException forBuildContext: aContext andSelector: aMessageSymbol [
	| phlowErrorAction | 

	phlowErrorAction := self phlowErrorActionWithException: anException.
	
	"aPhlow buildContext: aContext.
	aPhlow failedComputation: aFailedComputation."

	^ phlowErrorAction
]

{ #category : #accessing }
GtRemotePhlowAction >> priority [
	^ priority
]

{ #category : #accessing }
GtRemotePhlowAction >> priority: aNumber [
	priority := aNumber
]

{ #category : #accessing }
GtRemotePhlowAction >> tooltip: aTextOrString [
	self tooltipText: aTextOrString
]

{ #category : #accessing }
GtRemotePhlowAction >> tooltipText [
	^ tooltipText
]

{ #category : #accessing }
GtRemotePhlowAction >> tooltipText: aTextOrString [
	tooltipText := aTextOrString
]
