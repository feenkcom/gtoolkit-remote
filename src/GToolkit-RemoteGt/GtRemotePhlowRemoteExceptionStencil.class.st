Class {
	#name : #GtRemotePhlowRemoteExceptionStencil,
	#superclass : #BrStencil,
	#instVars : [
		'exceptionWrapper'
	],
	#category : #'GToolkit-RemoteGt'
}

{ #category : #'api - instantiation' }
GtRemotePhlowRemoteExceptionStencil >> create [
	<return: #BlElement>
	| debugLabel aContainer |
	debugLabel := self createDebugLabel.
	
	aContainer := BlElement new
		layout: BlLinearLayout horizontal;
		id: BrDebuggableElementContentId;
		constraintsDo: [ :c | 
			c horizontal fitContentLimited.
			c vertical fitContent.
			c frame horizontal alignCenter.
			c frame vertical alignCenter ];
		addChildren: { debugLabel }.
		
	self exceptionWrapper exceptionObject ifNotNil: [
		| inspectButton|
		inspectButton := self createInspectButton.
		aContainer addChild: inspectButton ].

	^ BrFrame new
		matchParent;
		addChild: aContainer;
		in: [ :anElement | 
			anElement userData at: #exceptionWrapper put: self exceptionWrapper ];
		yourself
]

{ #category : #'building widgets' }
GtRemotePhlowRemoteExceptionStencil >> createDebugLabel [
	^ BrLabel new
		hFitContentLimited;
		vFitContent;
		id: BrDebuggableElementExceptionMessageId;
		text: self newTextLabel;
		aptitude: BrGlamorousLabelAptitude new;
		margin: (BlInsets right: 6);
		constraintsDo: [ :c | 
			c linear vertical alignCenter.
			c linear horizontal alignLeft ].
]

{ #category : #'building widgets' }
GtRemotePhlowRemoteExceptionStencil >> createInspectButton [
	^ BrButton new
		hFitContent;
		vFitContent;
		aptitude: BrGlamorousButtonWithIconAptitude new;
		icon: BrGlamorousVectorIcons inspect;
		label: 'Inspect exception';
		id: BrDebuggableElementInspectExceptionButtonId;
		beTinySize;
		constraintsDo: [ :c | 
			c linear vertical alignCenter ];
		action: [ :aButton |
			aButton phlow spawnObject: self exceptionWrapper exceptionObject ]
]

{ #category : #accessing }
GtRemotePhlowRemoteExceptionStencil >> exceptionWrapper [
	^ exceptionWrapper
]

{ #category : #accessing }
GtRemotePhlowRemoteExceptionStencil >> exceptionWrapper: anObject [
	exceptionWrapper := anObject
]

{ #category : #'instance creation' }
GtRemotePhlowRemoteExceptionStencil >> newTextLabel [
	^ self exceptionWrapper exceptionDescription asRopedText 
		glamorousCodeFontAndSmallSize;
		foreground: BrGlamorousColors linkWithErrorColor
]
