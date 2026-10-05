Class {
	#name : #GtRemotePhlowContextMenuAction,
	#superclass : #GtRemotePhlowContextMenuSingleAction,
	#instVars : [
		'actionComputation',
		'iconStencil',
		'label',
		'id',
		'tooltipText',
		'disableCondition'
	],
	#category : #'GToolkit-RemotePhlow-PhlowActions'
}

{ #category : #'instance creation' }
GtRemotePhlowContextMenuAction class >> label: aString action: aBlock [
	^ self new
		label: aString;
		action: aBlock
]

{ #category : #'instance creation' }
GtRemotePhlowContextMenuAction class >> label: aString action: aBlock disable: aDisableBlock [
	^ self new 
		label: aString;
		action: aBlock;
		disableIf: aDisableBlock
]

{ #category : #'instance creation' }
GtRemotePhlowContextMenuAction class >> label: aString action: aBlock show: aShowBlock [
	^ self new 
		label: aString;
		action: aBlock;
		showIf: aShowBlock
]

{ #category : #'instance creation' }
GtRemotePhlowContextMenuAction class >> label: aString action: aBlock show: aShowBlock disable: aDisableBlock [
	^ self new 
		label: aString;
		action: aBlock;
		showIf: aShowBlock;
		disableIf: aDisableBlock
]

{ #category : #'api - scripting' }
GtRemotePhlowContextMenuAction >> action: aBlock [ 
	actionComputation := aBlock
]

{ #category : #accessing }
GtRemotePhlowContextMenuAction >> actionBlock [
	^ self actionComputation
]

{ #category : #accessing }
GtRemotePhlowContextMenuAction >> actionComputation [
	^ actionComputation
]

{ #category : #converting }
GtRemotePhlowContextMenuAction >> asItemBoundActionToItem: anItem viewSelection: aSelection [
	^ GtRemotePhlowContextMenuItemBoundAction new
		targetAction: self;
		item: anItem; 
		viewSelection: aSelection
]

{ #category : #'api - scripting' }
GtRemotePhlowContextMenuAction >> disableIf: aBlock [ 
	disableCondition := aBlock
]

{ #category : #'api - scripting' }
GtRemotePhlowContextMenuAction >> icon: anIconStencil [
	iconStencil := anIconStencil
]

{ #category : #accessing }
GtRemotePhlowContextMenuAction >> iconStencil [
	^ iconStencil
]

{ #category : #accessing }
GtRemotePhlowContextMenuAction >> id [
	^ id
]

{ #category : #'api - scripting' }
GtRemotePhlowContextMenuAction >> id: anId [
	id := anId
]

{ #category : #accessing }
GtRemotePhlowContextMenuAction >> label [
	^ label
]

{ #category : #'api - scripting' }
GtRemotePhlowContextMenuAction >> label: aString [ 
	label := aString
]

{ #category : #printing }
GtRemotePhlowContextMenuAction >> printOn: aStream [
	super printOn: aStream.
	aStream parenthesize: [
		aStream nextPutAll: (self label ifNil: [ '' ]) ]
]

{ #category : #testing }
GtRemotePhlowContextMenuAction >> shouldDisableContextActionOn: anItem viewSelection: aViewSelection [ 
	^ disableCondition 
		ifNil: [ false ] 
		ifNotNil: [ :aConditon |
			aConditon cull: anItem cull: aViewSelection ]
]

{ #category : #'api - scripting' }
GtRemotePhlowContextMenuAction >> tooltip: aTextOrString [
	self tooltipText: aTextOrString
]

{ #category : #accessing }
GtRemotePhlowContextMenuAction >> tooltipText [
	^ tooltipText
]

{ #category : #'api - scripting' }
GtRemotePhlowContextMenuAction >> tooltipText: aTextOrString [
	tooltipText := aTextOrString
]
