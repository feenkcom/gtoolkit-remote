Class {
	#name : #GtJSLinkDebuggerElement,
	#superclass : #GtDebuggerElement,
	#category : #Gt4JSLink
}

{ #category : #initialization }
GtJSLinkDebuggerElement class >> defaultTitle [ 

	^ 'JavaScript'
]

{ #category : #testing }
GtJSLinkDebuggerElement class >> handlesContext: aContext [ 

	^ aContext receiver class = LanguageLinkPromise and: 
		[ aContext receiver value class = PharoLinkDebuggerPaused ]
]

{ #category : #'tools registry' }
GtJSLinkDebuggerElement class >> registerToolsOn: registry [
	"self register"
	registry registerDebugger: self withRank: 1100.
]

{ #category : #accessing }
GtJSLinkDebuggerElement class >> sessionClass [

	^ GtJSLinkDebugSession
]

{ #category : #callbacks }
GtJSLinkDebuggerElement >> actOnDebugSessionChanged [
	| container |

	self removeChildren.
	self constraintsDo: [ :c |
		c vertical matchParent.
		c horizontal matchParent ].
	container := BrVerticalPane new.
	container 
		addChild: self newToolbar;
		addChild: self newSourceEditor.
	self addChild: container.
]

{ #category : #'private - element creation' }
GtJSLinkDebuggerElement >> newInspectButton [

	^ BrButton new 
		look: BrGlamorousButtonWithLabelLook;
		margin: (BlInsets left: 5);
		label: 'Inspect Me';
		action: [ :aButton | self inspect ]
]

{ #category : #'private - element creation' }
GtJSLinkDebuggerElement >> newResumeButton [

	^ BrButton new 
		look: BrGlamorousButtonWithIconLook;
		margin: (BlInsets left: 5);
		icon: BrGlamorousVectorIcons play;
		action: [ :aButton | self jsResume ]
]

{ #category : #'private - element creation' }
GtJSLinkDebuggerElement >> newSourceEditor [

	^ CDTDebuggerEditor new
		debugger: self nodeJSDebugger;
		look: BrGlamorousCodeEditorLook new;
		styler: JSParser gtStyler;
		yourself
]

{ #category : #'private - element creation' }
GtJSLinkDebuggerElement >> newStepIntoButton [

	^ BrButton new 
		look: BrGlamorousButtonWithIconLook;
		margin: (BlInsets left: 5);
		icon: BrGlamorousIcons into;
		action: [ :aButton | self jsStepInto ]
]

{ #category : #'private - element creation' }
GtJSLinkDebuggerElement >> newStepOutButton [

	^ BrButton new 
		look: BrGlamorousButtonWithIconLook;
		margin: (BlInsets left: 5);
		icon: BrGlamorousIcons down;
		action: [ :aButton | self jsStepOut ]
]

{ #category : #'private - element creation' }
GtJSLinkDebuggerElement >> newStepOverButton [

	^ BrButton new 
		look: BrGlamorousButtonWithIconLook;
		margin: (BlInsets left: 5);
		icon: BrGlamorousIcons over;
		action: [ :aButton | self jsStepOver ]
]

{ #category : #'private - element creation' }
GtJSLinkDebuggerElement >> newToolbar [ 
	| toolbar |

	toolbar := BrHorizontalPane new 
		vFitContent;
		background: Color lightGray;
		padding: (BlInsets top: 5 bottom: 5).
	toolbar
		addChild: self newInspectButton;
		addChild: self newResumeButton;
		addChild: self newStepIntoButton;
		addChild: self newStepOverButton;
		addChild: self newStepOutButton.
	^ toolbar
]

{ #category : #'private - accessing' }
GtJSLinkDebuggerElement >> nodeJSDebugger [
	"Answer the debugger client to the NodeJS server.
	See the Law of Demeter."

	^ debuggingSession interruptedContext receiver value debugger
]
