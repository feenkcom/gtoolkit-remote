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
	| aLabel aContainer |
	aLabel := BrLabel new
		hFitContentLimited;
		vFitContent;
		text: self newTextLabel;
		aptitude: BrGlamorousLabelAptitude new;
		margin: (BlInsets right: 6);
		constraintsDo: [ :c | 
			c linear vertical alignCenter.
			c linear horizontal alignLeft ].
	aContainer := BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c | 
			c horizontal fitContentLimited.
			c vertical fitContent.
			c frame horizontal alignCenter.
			c frame vertical alignCenter ];
		addChildren: { aLabel }.
	^ BrFrame new
		matchParent;
		addChild: aContainer;
		in: [ :anElement | 
			anElement userData at: #exceptionWrapper put: self exceptionWrapper ];
		yourself
]

{ #category : #accessing }
GtRemotePhlowRemoteExceptionStencil >> exceptionWrapper [
	^ exceptionWrapper
]

{ #category : #accessing }
GtRemotePhlowRemoteExceptionStencil >> exceptionWrapper: anExceptionWrapper [
	exceptionWrapper := anExceptionWrapper
]

{ #category : #'instance creation' }
GtRemotePhlowRemoteExceptionStencil >> newTextLabel [
	^ self exceptionWrapper exceptionDescription asRopedText 
		glamorousCodeFontAndSmallSize;
		foreground: BrGlamorousColors linkWithErrorColor
]
