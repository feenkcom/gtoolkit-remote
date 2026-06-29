"
GtDeclarativeView provides a declarative UI specification for presenting data that can be easily serialised and sent over the wire, including between applications written in different languages.

dataTransport is an emumerated value indicating whether the data to be displayed will be included with the specification or is available via reference or by key.]

- 1: data is included in the response
- 2: data is available by reference
- 3: data is available by reference and key (tbc)


Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	dataTransport:		<Object>


    Implementation Points
"
Class {
	#name : #GtRemotePhlowView,
	#superclass : #GtRemotePhlowProtoView,
	#instVars : [
		'title',
		'priority',
		'definingSelector',
		'definingClass',
		'phlowActions'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #accessing }
GtRemotePhlowView class >> handledExceptions [
	"Explicitly catch here Halt and Warning as in case an action raising 
	those exceptions is embedded in the debugger it will trigger an
	infinite chain of debuggers.
	https://github.com/feenkcom/gtoolkit/issues/4383"
	
	^ Error, Halt, Warning
]

{ #category : #actions }
GtRemotePhlowView >> action: anOneArgBlock [
	| newPhlowAction |
	newPhlowAction := anOneArgBlock value: GtRemotePhlowAction noAction.
	newPhlowAction priority: GtPhlowAction defaultPriority + self actions size + 1.
	self addPhlowAction: newPhlowAction
]

{ #category : #actions }
GtRemotePhlowView >> actionButtonDo: aBlock [
	self action: [ :aPhlowAction |
		aBlock cull: aPhlowAction button ]
]

{ #category : #actions }
GtRemotePhlowView >> actionButtonIcon: anIcon action: aValuable [
	self actionButtonDo: [ :aButtonAction |
		aButtonAction
			icon: anIcon;
			action: aValuable ]
]

{ #category : #actions }
GtRemotePhlowView >> actionButtonIcon: anIcon id: aButtonId tooltip: aTooltipText action: aValuable [
	self actionButtonDo: [ :aButtonAction |
		aButtonAction
			icon: anIcon;
			tooltip: aTooltipText;
			id: aButtonId;
			action: aValuable ]
]

{ #category : #actions }
GtRemotePhlowView >> actionButtonIcon: anIcon label: aStringOrRope action: aValuable [
	self actionButtonDo: [ :aButtonAction |
		aButtonAction
			icon: anIcon;
			label: aStringOrRope;
			action: aValuable ]
]

{ #category : #actions }
GtRemotePhlowView >> actionButtonIcon: anIcon label: aStringOrRope tooltip: aTooltipText action: aValuable [
	self actionButtonDo: [ :aButtonAction |
		aButtonAction
			icon: anIcon;
			label: aStringOrRope;
			tooltip: aTooltipText;
			action: aValuable ]
]

{ #category : #actions }
GtRemotePhlowView >> actionButtonIcon: anIcon tooltip: aTooltipText action: aValuable [
	self actionButtonDo: [ :aButtonAction |
		aButtonAction
			icon: anIcon;
			tooltip: aTooltipText;
			action: aValuable ]
]

{ #category : #actions }
GtRemotePhlowView >> actionButtonLabel: aString action: aValuable [
	self actionButtonDo: [ :aButtonAction |
		aButtonAction
			label: aString;
			action: aValuable ]
]

{ #category : #actions }
GtRemotePhlowView >> actionButtonLabel: aString tooltip: aTooltipText action: aValuable [
	self actionButtonDo: [ :aButtonAction |
		aButtonAction
			label: aString;
			tooltip: aTooltipText;
			action: aValuable ]
]

{ #category : #actions }
GtRemotePhlowView >> actionUpdateButton [
	"stub"
	"self actionUpdateButtonTooltip: 'Update'"
]

{ #category : #actions }
GtRemotePhlowView >> actionUpdateButtonIcon: anIcon tooltip: aTooltip [
	"stub"
	"self
		actionButtonIcon: anIcon
		tooltip: aTooltip
		action: [ :aButton | aButton ]"
]

{ #category : #actions }
GtRemotePhlowView >> actionUpdateButtonTooltip: aTooltip [
	"stub"
	"self
		actionUpdateButtonIcon: BrGlamorousVectorIcons refresh
		tooltip: aTooltip"
]

{ #category : #actions }
GtRemotePhlowView >> actions [
	<return: #OrderedCollection of: #GtRemotePhlowAction>
	^ phlowActions ifNil: [ phlowActions := OrderedCollection new ]
]

{ #category : #actions }
GtRemotePhlowView >> addPhlowAction: aPhlowAction [
	phlowActions add: aPhlowAction.
	phlowActions sort: [ :a :b |
		[ a priority < b priority ]
			on: Error
			do: [ :error | true ] ]
]

{ #category : #converting }
GtRemotePhlowView >> asGtDeclarativeView [
	^ nil
]

{ #category : #'message performning' }
GtRemotePhlowView >> basicOn: anObject perform: aMessageSymbol withArguments: aCollectionOfArguments [ 
	^ anObject  
		perform: aMessageSymbol
		with: aCollectionOfArguments first
]

{ #category : #testing }
GtRemotePhlowView >> canBeGtDeclarativeView [
	^ true
]

{ #category : #'private - converting' }
GtRemotePhlowView >> configureGenericViewSpecificationOn: aViewSpecification [
	aViewSpecification
		title: self title;
		priority: self priority;
		actionSpecifications: (self actions collect: [ :each | each asGtDeclarativeAction ]) asArray
]

{ #category : #copying }
GtRemotePhlowView >> copyTransformationFrom: aSendBlock [
	"Do nothing by default. This is a callback used by forward views that define #send: to still work in case the view that we forward to does not support #send:"
]

{ #category : #accessing }
GtRemotePhlowView >> definingClass [
	^ definingClass
]

{ #category : #accessing }
GtRemotePhlowView >> definingClass: aClass [
	definingClass := aClass
]

{ #category : #accessing }
GtRemotePhlowView >> definingMethod [
	^ (definingClass whichClassIncludesSelector: definingSelector) 
		ifNil: [ nil ]
		ifNotNil: [ :aClass | aClass compiledMethodAt: definingSelector ]
]

{ #category : #accessing }
GtRemotePhlowView >> definingSelector [

	^ definingSelector
]

{ #category : #accessing }
GtRemotePhlowView >> definingSelector: aSelector [

	definingSelector := aSelector
]

{ #category : #'message performing' }
GtRemotePhlowView >> on: anObject perform: aMessageSymbol [ 
	<return: #GtRemotePhlowView>
	
	^ self 
		on: anObject 
		perform: aMessageSymbol 
		withArguments: { self }
]

{ #category : #'message performning' }
GtRemotePhlowView >> on: anObject perform: aMessageSymbol withArguments: aCollectionOfArguments [
	<return: #GtRemotePhlowView>
	
	^ [ 
			self 
				basicOn: anObject 
				perform: aMessageSymbol 
				withArguments: aCollectionOfArguments
	] on: self class handledExceptions do: [ :anError |
			self 
				phlowErrorViewWithException: anError 
				forBuildContext: nil "(GtPhlowBuildContext new 
					object: anObject; 
					arguments: aCollectionOfArguments) "
				andSelector: aMessageSymbol ]
]

{ #category : #'message performning' }
GtRemotePhlowView >> phlowErrorViewWithException: anException [ 
	| aTitle |
	aTitle := 'Error'.
	
	^ GtRemotePhlowViewErrorView new
		title: aTitle;
		errorMessage: anException description
]

{ #category : #'error handling' }
GtRemotePhlowView >> phlowErrorViewWithException: anException forBuildContext: aContext andSelector: aMessageSymbol [
	| aPhlow | 

	aPhlow := self phlowErrorViewWithException: anException.
	
	"aPhlow buildContext: aContext.
	aPhlow failedComputation: aFailedComputation."

	^ aPhlow
]

{ #category : #printing }
GtRemotePhlowView >> printOn: aStream [
	super printOn: aStream.
	
	aStream parenthesize: [
		aStream << (self title ifNil: ['']) ]
]

{ #category : #accessing }
GtRemotePhlowView >> priority [
	^ priority
]

{ #category : #accessing }
GtRemotePhlowView >> priority: anObject [
	priority := anObject
]

{ #category : #accessing }
GtRemotePhlowView >> title [
	^ title
]

{ #category : #accessing }
GtRemotePhlowView >> title: anObject [
	title := anObject
]

{ #category : #'adding - update definitions' }
GtRemotePhlowView >> updateWhen: anAnnouncement if: anIfCondition in: anAnnouncer [
	"Stub"
]

{ #category : #'adding - update definitions' }
GtRemotePhlowView >> updateWhen: anAnnouncement in: anAnnouncer [
	"Stub"
]
