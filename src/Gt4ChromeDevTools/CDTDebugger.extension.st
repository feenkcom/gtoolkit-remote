Extension { #name : #CDTDebugger }

{ #category : #'*Gt4ChromeDevTools' }
CDTDebugger >> gtCallStackFor: aView [
	<gtView>

	^ aView list
		title: 'Call Stack';
		priority: 10;
		items: [ self callFrames ];
		updateWhen: CDTDebuggerPaused in: [ self announcer ]
]

{ #category : #'*Gt4ChromeDevTools' }
CDTDebugger >> gtConsoleFor: aView [
	<gtView>

	^ aView textEditor 
		title: 'Console';
		priority: 10;
		text: [ self console asRopedText ];
		updateWhen: CDTDebuggerConsoleUpdated in: [ self announcer ]
]

{ #category : #'*Gt4ChromeDevTools' }
CDTDebugger >> gtResumeActionFor: anAction [
	<gtAction>
	^ anAction button
		label: 'Resume';
		priority: 3;
		action: [ :aButton | self resume ]
]

{ #category : #'*Gt4ChromeDevTools' }
CDTDebugger >> gtSourceCodeFor: aView [
	<gtView>

	^ aView explicit 
		title: 'Source';
		priority: 10;
		stencil: [
			CDTDebuggerEditor new
				debugger: self;
				look: BrGlamorousCodeEditorLook new;
				styler: JSParser gtStyler;
				yourself ].

]

{ #category : #'*Gt4ChromeDevTools' }
CDTDebugger >> gtStepIntoActionFor: anAction [
	<gtAction>
	^ anAction button
		label: 'Into';
		priority: 4;
		action: [ :aButton | self stepInto ]
]

{ #category : #'*Gt4ChromeDevTools' }
CDTDebugger >> gtStepOutActionFor: anAction [
	<gtAction>
	^ anAction button
		label: 'Out';
		priority: 5;
		action: [ :aButton | self stepOut ]
]

{ #category : #'*Gt4ChromeDevTools' }
CDTDebugger >> gtStepOverActionFor: anAction [
	<gtAction>
	^ anAction button
		label: 'Over';
		priority: 3;
		action: [ :aButton | self stepOver ]
]
