Class {
	#name : #GtPharoLinkPostMortemDebugger,
	#superclass : #Object,
	#instVars : [
		'exception',
		'session',
		'stackFrames',
		'frameRegex'
	],
	#category : #'Gt4PharoLink-Debugger'
}

{ #category : #accessing }
GtPharoLinkPostMortemDebugger >> application [

	^ exception application
]

{ #category : #private }
GtPharoLinkPostMortemDebugger >> blockStackFrameFromStream: stream [
	"Answer a stack frame"
	| separatorIndex blockText methodName |

	self assert: stream peek = $[.

	separatorIndex := stream positionOfSubCollection: '] in '.
	self assert: separatorIndex > 0.
	blockText := stream next: (separatorIndex - stream position).
	stream next: 4.
	methodName := stream nextLine.
	^ GtPharoLinkPostMortemStackFrame new
		exception: exception;
		displayString: blockText, ' in ', methodName;
		methodName: methodName;
		blockSource: blockText.
]

{ #category : #accessing }
GtPharoLinkPostMortemDebugger >> exception [

	^ exception
]

{ #category : #accessing }
GtPharoLinkPostMortemDebugger >> exception: anObject [

	exception := anObject
]

{ #category : #initialization }
GtPharoLinkPostMortemDebugger >> initialize [

	super initialize.
	frameRegex := '\s+at.+\(([^:]+)\:(\d+)\:(\d+)\)' asRegexIgnoringCase.
]

{ #category : #private }
GtPharoLinkPostMortemDebugger >> methodStackFrameFromStream: stream [
	"Answer a stack frame"
	| methodName |

	self assert: stream peek ~= $[.

	methodName := stream nextLine.
	^ GtPharoLinkPostMortemStackFrame new
		exception: exception;
		displayString: methodName;
		methodName: methodName.
]

{ #category : #accessing }
GtPharoLinkPostMortemDebugger >> sourceStyler [
	"Answer the styler used by the source code editor for this exception"

	^ BrRBTextStyler new
]

{ #category : #accessing }
GtPharoLinkPostMortemDebugger >> stackFrames [
	"Answer a ordered collection of stack frames.
	This is called many times by the debugger, so cache"
	| ordinal stream whiteSpace |

	^ stackFrames ifNil:
		[ ordinal := 1.
		stackFrames := OrderedCollection new.
		stream := exception trace readStream.
		whiteSpace := { Character space. Character tab. }.
		[ stream atEnd ] whileFalse:
			[ [ whiteSpace includes: stream peek ] whileTrue:
				[ stream next ].
			stackFrames add: ( stream peek = $[
				ifTrue: [ self blockStackFrameFromStream: stream ]
				ifFalse: [ self methodStackFrameFromStream: stream ] ).
			ordinal := ordinal + 1 ].
		stackFrames ].
]

{ #category : #accessing }
GtPharoLinkPostMortemDebugger >> stderr [
	"Answer the stderr for the receiver's process."

	^ self application stderr
]

{ #category : #accessing }
GtPharoLinkPostMortemDebugger >> stdout [
	"Answer the stdout for the receiver's process."

	^ self application stdout
]
