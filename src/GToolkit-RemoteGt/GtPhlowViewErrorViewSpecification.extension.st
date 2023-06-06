Extension { #name : #GtPhlowViewErrorViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowViewErrorViewSpecification >> createErrorElement [
	| messageLabel container |
	messageLabel := BrLabel new
		hMatchParent;
		text: self errorMessage;
		aptitude: (BrGlamorousLabelAptitude new
			glamorousCodeFontAndSmallSize;
			foreground: BrGlamorousColors linkWithErrorColor);
		margin: (BlInsets right: 6);
		constraintsDo: [ :c | 
			c linear vertical alignCenter ].
	
	container := BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c | 
			c horizontal fitContentLimited.
			c vertical fitContent.
			c frame horizontal alignCenter.
			c frame vertical alignCenter ];
		addChildren: {messageLabel}.
	
	^ BrFrame new
		matchParent;
		addChild: container
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowViewErrorViewSpecification >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"

	^aView explicit 
		title: title;
		priority: priority;
		stencil: [
			self createErrorElement ]
]
