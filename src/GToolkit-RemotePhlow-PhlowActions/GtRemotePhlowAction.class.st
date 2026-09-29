Class {
	#name : #GtRemotePhlowAction,
	#superclass : #Object,
	#instVars : [
		'id',
		'priority',
		'tooltipText',
		'definingSelector',
		'definingClass',
		'target',
		'menuOptions'
	],
	#category : #'GToolkit-RemotePhlow-PhlowActions'
}

{ #category : #accessing }
GtRemotePhlowAction class >> defaultPriority [
	^ 50
]

{ #category : #'instance creation' }
GtRemotePhlowAction class >> empty [
	"Convenience --by analogy with views"

	^ self noAction
]

{ #category : #accessing }
GtRemotePhlowAction class >> handledExceptions [
	"Explicitly catch here Halt and Warning as in case an action raising 
	those exceptions is embedded in the debugger it will trigger an
	infinite chain of debuggers.
	https://github.com/feenkcom/gtoolkit/issues/4383"
	
	^ Error, Halt, Warning
]

{ #category : #'instance creation' }
GtRemotePhlowAction class >> noAction [
	^ self new noAction
]

{ #category : #accessing }
GtRemotePhlowAction >> addTarget: aGtPhlowActionTarget [
	self 
		assert: [ aGtPhlowActionTarget notNil ]
		description: [ 'Phlow action target must be non-nil' ].
	target := self target, aGtPhlowActionTarget asPhlowTarget
]

{ #category : #accessing }
GtRemotePhlowAction >> asGtDeclarativeAction [
	^ nil
]

{ #category : #'message performing' }
GtRemotePhlowAction >> basicOn: anObject perform: aMessageSymbol withArguments: aCollectionOfArguments [ 
	^ anObject  
		perform: aMessageSymbol
		with: aCollectionOfArguments first
]

{ #category : #decorating }
GtRemotePhlowAction >> button [
	^ GtRemotePhlowButtonAction new
]

{ #category : #testing }
GtRemotePhlowAction >> canBeGtDeclarativeAction [
	self target asRemotePhlowActionTarget ifNil: [ ^ false ].
	self id ifNotNil: [ :anId | 
		anId isRemotePhlowId ifFalse: [ ^ false ] ].
	^ true
]

{ #category : #decorating }
GtRemotePhlowAction >> contextMenuAction [
	^ GtRemotePhlowContextMenuAction new
		"definingMethod: (GtPhlowDefiningMethodsCollector forContext: thisContext) collect"
]

{ #category : #decorating }
GtRemotePhlowAction >> contextMenuBoundAction [
	^ GtRemotePhlowContextMenuItemBoundAction new
		"definingMethod: (GtPhlowDefiningMethodsCollector forContext: thisContext) collect"
]

{ #category : #accessing }
GtRemotePhlowAction >> defaultTarget [
	^ GtRemotePhlowObjectActionTarget new
]

{ #category : #accessing }
GtRemotePhlowAction >> definingClass [
	^ definingClass
]

{ #category : #accessing }
GtRemotePhlowAction >> definingClass: aClass [
	definingClass := aClass
]

{ #category : #accessing }
GtRemotePhlowAction >> definingMethod [
	^ (self definingClass whichClassIncludesSelector: self definingSelector) 
		ifNil: [ nil ]
		ifNotNil: [ :aClass | aClass compiledMethodAt: self definingSelector ]
]

{ #category : #accessing }
GtRemotePhlowAction >> definingSelector [

	^ definingSelector
]

{ #category : #accessing }
GtRemotePhlowAction >> definingSelector: aSelector [

	definingSelector := aSelector
]

{ #category : #decorating }
GtRemotePhlowAction >> empty [
	"Convenience --by analogy with views"

	^ self noAction
]

{ #category : #accessing }
GtRemotePhlowAction >> forViewDefinedIn: aSymbol [
	self target: (GtRemotePhlowViewActionTarget forSelector: aSymbol)
]

{ #category : #testing }
GtRemotePhlowAction >> hasMenuOptions [
	^ menuOptions notNil and: [ menuOptions hasAnyOptions ]
]

{ #category : #accessing }
GtRemotePhlowAction >> id [
	^ id
]

{ #category : #accessing }
GtRemotePhlowAction >> id: anId [
	id := anId
]

{ #category : #testing }
GtRemotePhlowAction >> isDefaultTarget [
	| defaultTarget |
	defaultTarget := self defaultTarget.
	self target targetsDo: [ :eachTarget | 
		eachTarget = defaultTarget ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #'accessing - menu' }
GtRemotePhlowAction >> menuDisable: anObject [
	self menuOptions menuDisable: anObject
]

{ #category : #'accessing - menu' }
GtRemotePhlowAction >> menuItemGroup: aGroupConfiguration [
	self menuOptions menuGroup: aGroupConfiguration
]

{ #category : #'accessing - menu' }
GtRemotePhlowAction >> menuItemHideOnClick: aBoolean [
	self menuOptions menuHideOnClick: aBoolean
]

{ #category : #'accessing - menu' }
GtRemotePhlowAction >> menuItemPinSubmenu [
	self menuOptions menuPinSubmenu
]

{ #category : #'accessing - menu' }
GtRemotePhlowAction >> menuItemPreview: anObject [
	self menuOptions menuPreview: anObject
]

{ #category : #'accessing - menu' }
GtRemotePhlowAction >> menuOptions [
	^ menuOptions ifNil: [ menuOptions := GtRemotePhlowMenuOptions new ]
]

{ #category : #'accessing - menu' }
GtRemotePhlowAction >> menuShortcut: aShortcut [
	self menuOptions menuShortcut: aShortcut
]

{ #category : #decorating }
GtRemotePhlowAction >> noAction [
	^ GtRemotePhlowNoAction new
]

{ #category : #'message performing' }
GtRemotePhlowAction >> on: anObject perform: aMessageSymbol [ 
	<return: #GtRemotePhlowAction>
	
	^ self 
		on: anObject 
		perform: aMessageSymbol 
		withArguments: { self }
]

{ #category : #'message performing' }
GtRemotePhlowAction >> on: anObject perform: aMessageSymbol withArguments: aCollectionOfArguments [
	<return: #GtRemotePhlowAction>
	
	^ [ 
			self 
				basicOn: anObject 
				perform: aMessageSymbol 
				withArguments: aCollectionOfArguments
		
	] 
		on: self class handledExceptions do: [ :anException |
			self 
				phlowErrorActionWithException: anException 
				forBuildContext: nil "(GtPhlowBuildContext new 
					object: anObject; 
					arguments: aCollectionOfArguments) "
				andSelector: aMessageSymbol ]
]

{ #category : #'error handling' }
GtRemotePhlowAction >> phlowErrorActionWithException: anException [ 
	^ GtRemotePhlowErrorAction new
		errorMessage: anException description
]

{ #category : #'error handling' }
GtRemotePhlowAction >> phlowErrorActionWithException: anException forBuildContext: aContext andSelector: aMessageSymbol [
	| phlowErrorAction | 

	phlowErrorAction := self phlowErrorActionWithException: anException.
	
	"aPhlow buildContext: aContext.
	aPhlow failedComputation: aFailedComputation."

	^ phlowErrorAction
]

{ #category : #accessing }
GtRemotePhlowAction >> primaryModifierAction: aBlock mouseCursor: aCursor [
	"Ignored in remote phlow"
]

{ #category : #accessing }
GtRemotePhlowAction >> priority [
	^ priority
]

{ #category : #accessing }
GtRemotePhlowAction >> priority: aNumber [
	priority := aNumber
]

{ #category : #accessing }
GtRemotePhlowAction >> target [
	^ target ifNil: [ GtRemotePhlowObjectActionTarget new ]
]

{ #category : #accessing }
GtRemotePhlowAction >> target: aGtRemotePhlowActionTarget [
	target := aGtRemotePhlowActionTarget default
]

{ #category : #accessing }
GtRemotePhlowAction >> tooltip: aTextOrString [
	self tooltipText: aTextOrString
]

{ #category : #accessing }
GtRemotePhlowAction >> tooltipText [
	^ tooltipText
]

{ #category : #accessing }
GtRemotePhlowAction >> tooltipText: aTextOrString [
	tooltipText := aTextOrString
]
