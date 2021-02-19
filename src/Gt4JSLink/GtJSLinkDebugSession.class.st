Class {
	#name : #GtJSLinkDebugSession,
	#superclass : #DebugSession,
	#instVars : [
		'nodeJSDebugger'
	],
	#category : #Gt4JSLink
}

{ #category : #'js - actions' }
GtJSLinkDebugSession >> jsResume [
	"Continue execution.
	This only instructs the NodeJS server to resume.  Control of the Pharo session is up to the owner of the receiver."

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
	"Answer the debugger client to the NodeJS server.
	See the Law of Demeter."
	| receivedValue |

	nodeJSDebugger ifNotNil: [ ^ nodeJSDebugger ].

	"Confirm that the NodeJS server is in fact paused in the debugger"
	receivedValue := self interruptedContext receiver value.
	(receivedValue respondsTo: #debugger) ifFalse:
		[ self error: 'Unable to retrieve JS debugger' ].

	^ nodeJSDebugger := receivedValue debugger
]
