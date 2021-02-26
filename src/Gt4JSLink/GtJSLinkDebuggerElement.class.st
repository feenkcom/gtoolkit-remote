Class {
	#name : #GtJSLinkDebuggerElement,
	#superclass : #GtDebuggerElement,
	#instVars : [
		'variableList',
		'callFramesList',
		'sourceCode',
		'currentCallFrame'
	],
	#category : #Gt4JSLink
}

{ #category : #testing }
GtJSLinkDebuggerElement class >> availableAutomatically [
	"The JS debugger should be displayed automatically when opened
	as the Pharo stack only shows that the server paused signal has been received."
	
	^ true
]

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

	self nodeJSDebugger announcer 
		when: CDTDebuggerPaused
		send: #scheduleUpdateUI
		to: self.
	self scheduleUpdateUI.
]

{ #category : #'private - accessing' }
GtJSLinkDebuggerElement >> columnNumber [ 

	^ currentCallFrame columnNumber
]

{ #category : #initialization }
GtJSLinkDebuggerElement >> initialize [
	| container mainPane leftPane |

	super initialize.
	self constraintsDo: [ :c |
		c vertical matchParent.
		c horizontal matchParent ].
	container := BrVerticalPane new.
	mainPane := BrHorizontalPane new.
	leftPane := BrVerticalPane new.
	callFramesList := self newCallFramesList.
	sourceCode := self newSourceEditor.
	leftPane
		addChild: callFramesList;
		addChild: sourceCode.
	variableList := self newVariablesList.
	mainPane
		addChild: leftPane;
		addChild: variableList.
	container 
		addChild: self newToolbar;
		addChild: mainPane.
	self addChild: container.
]

{ #category : #'private - actions' }
GtJSLinkDebuggerElement >> jsResume [
	"Continue execution"

	debuggingSession jsResume.
	(ResumeDebugAction forDebugger: self) executeAction.
]

{ #category : #'private - actions' }
GtJSLinkDebuggerElement >> jsStepInto [

	debuggingSession jsStepInto.
]

{ #category : #'private - actions' }
GtJSLinkDebuggerElement >> jsStepOut [

	debuggingSession jsStepOut.
]

{ #category : #'private - actions' }
GtJSLinkDebuggerElement >> jsStepOver [

	debuggingSession jsStepOver.

]

{ #category : #'private - accessing' }
GtJSLinkDebuggerElement >> lineNumber [ 

	^ currentCallFrame lineNumber
]

{ #category : #'instance creation' }
GtJSLinkDebuggerElement >> newCallFramesList [
	| list |

	list := BrColumnedList new.
	list margin: (BlInsets all: 10).
	list addEventHandler: (GtPhlowListToSelectHandler new 
		transformation: [ :variableNode | variableNode value ]).
	list rowStencil: (BrGlamorousColumnedListSelectableRowElementStencilBuilder new).

	list column 
		title: 'Depth';
		cellStencil: [ 
			BrLabel new
				look: (BrGlamorousLabelLook new foreground: Color black);
				hExact: 30;
				vFitContent;
				margin: (BlInsets top: 3 left: 10 bottom: 3 right: 0) ];
		dataBinder: [ :aCellElement :aCDTCallFrame |
			aCellElement text: aCDTCallFrame ordinal asString asRopedText ].
	list column
		title: 'Frame';
		cellStencil: [
			BrLabel new
				look: BrGlamorousLabelLook new;
				hMatchParent;
				vFitContent;
				margin: (BlInsets top: 3 left: 10 bottom: 3 right: 0) ];
		dataBinder: [ :aCellElement :aCDTCallFrame |
			aCellElement text: aCDTCallFrame printString asRopedText ].
	
	list 
		background: Color white;
		addLook: BrShadowLook new.
		
	^ list
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

	^ BrEditor new
		look: BrGlamorousCodeEditorLook new + BrShadowLook new ;
		styler: JSParser gtStyler;
		background: Color white;
		margin: (BlInsets top: 0 left: 10 bottom: 10  right: 10).
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
		background: BrGlamorousColors defaultHeaderBackgroundColor;
		padding: (BlInsets top: 5 bottom: 5);
		alignCenterRight.
	toolbar
		addChild: self newInspectButton;
		addChild: self newResumeButton;
		addChild: self newStepIntoButton;
		addChild: self newStepOverButton;
		addChild: self newStepOutButton.
	^ toolbar
]

{ #category : #'instance creation' }
GtJSLinkDebuggerElement >> newVariablesList [
	| list |

	list := BrColumnedList new.
	list margin: (BlInsets top: 10 left: 0 bottom: 10 right: 10).
	list addEventHandler: (GtPhlowListToSelectHandler new 
		transformation: [ :variableNode | variableNode value ]).
	list rowStencil: (BrGlamorousColumnedListSelectableRowElementStencilBuilder new).

	list column 
		title: 'Variable';
		cellStencil: [ 
			BrLabel new
				look: (BrGlamorousLabelLook new foreground: Color black);
				hMatchParent;
				vFitContent;
				margin: (BlInsets top: 3 left: 10 bottom: 3 right: 0) ];
		dataBinder: [ :aCellElement :aCDTPropertyDescriptor |
			aCellElement text: aCDTPropertyDescriptor name asRopedText ].
	list column
		title: 'Value';
		cellStencil: [
			BrLabel new
				look: BrGlamorousLabelLook new;
				hMatchParent;
				vFitContent;
				margin: (BlInsets top: 3 left: 10 bottom: 3 right: 0) ];
		dataBinder: [ :aCellElement :aCDTPropertyDescriptor |
			aCellElement text: (aCDTPropertyDescriptor enumerable
				ifTrue: [ aCDTPropertyDescriptor value printString ]
				ifFalse: [ '<not enumerable>' ]) asRopedText ].

	list 
		background: Color white;
		addLook: BrShadowLook new.
	^ list
]

{ #category : #'private - accessing' }
GtJSLinkDebuggerElement >> nodeJSDebugger [
	"Answer the debugger client to the NodeJS server"

	^ debuggingSession nodeJSDebugger
]

{ #category : #private }
GtJSLinkDebuggerElement >> scheduleUpdateUI [

	self enqueueTask: (BlTaskAction new action: [ self updateUI ]).

]

{ #category : #'private - accessing' }
GtJSLinkDebuggerElement >> scriptId [ 

	^ currentCallFrame scriptId
]

{ #category : #'private - accessing' }
GtJSLinkDebuggerElement >> sourceCode [

	^ self nodeJSDebugger getScriptSource: self scriptId
]

{ #category : #'private - accessing' }
GtJSLinkDebuggerElement >> sourceText [ 
	"Answer the receiver's source code, with the current line highlighted"
	| source text indexes lineNumber |

	lineNumber := self lineNumber.
	source := self sourceCode withSqueakLineEndings.
	text := source asRopedText.
	lineNumber = 0 ifTrue: [ ^ text ].
	indexes := source gtIndexOfLineNumber: self lineNumber.
	indexes ifNotNil: 
		[ (text from: indexes key + self columnNumber to: indexes value) 
			attribute: (BlTextHighlightAttribute paint: BrGlamorousColors errorBackgroundColor)
				beNotOverwritableByStyler  ].
	^ text
]

{ #category : #callbacks }
GtJSLinkDebuggerElement >> updateUI [

	callFramesList items: self nodeJSDebugger callFrames.
	currentCallFrame := self nodeJSDebugger callFrames first.
	variableList items: currentCallFrame localScope properties.
	sourceCode text: self sourceText.
	self lineNumber > 5 ifTrue:
		[ StringSignal emit: 'Scrolling to line: ', self lineNumber asString.
		sourceCode scrollToPosition: self lineNumber + 5 ].

]
