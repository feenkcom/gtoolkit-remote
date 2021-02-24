Class {
	#name : #GtJSLinkDebugSession,
	#superclass : #DebugSession,
	#instVars : [
		'signal',
		'nodeJSDebugger'
	],
	#category : #Gt4JSLink
}

{ #category : #'js - actions' }
GtJSLinkDebugSession >> jsResume [
	"Continue execution.
	Flag the promise to wait again as the value should be returned (or the debugger opened again).
	This only instructs the NodeJS server to resume.  Control of the Pharo session is up to the owner of the receiver."

	self signal setWaitAgain.
	self nodeJSDebugger resume.

]

{ #category : #'js - actions' }
GtJSLinkDebugSession >> jsStepInto [

	self nodeJSDebugger stepInto.

]

{ #category : #'js - actions' }
GtJSLinkDebugSession >> jsStepOut [

	self nodeJSDebugger stepOut.

]

{ #category : #'js - actions' }
GtJSLinkDebugSession >> jsStepOver [

	self nodeJSDebugger stepOver.

]

{ #category : #'private - accessing' }
GtJSLinkDebugSession >> nodeJSDebugger [
	"Answer the debugger client to the NodeJS server"

	^ nodeJSDebugger ifNil: [ nodeJSDebugger := self signal debugger ].

]

{ #category : #'private - accessing' }
GtJSLinkDebugSession >> signal [
	"Answer the signal that triggered the debug session."

	signal ifNotNil: [ ^ signal ].

	"Confirm that the NodeJS server is in fact paused in the debugger"
	signal := self interruptedContext receiver value.
	(signal respondsTo: #debugger) ifFalse:
		[ self error: 'Unable to retrieve JS debugger' ].

	^ signal
]
