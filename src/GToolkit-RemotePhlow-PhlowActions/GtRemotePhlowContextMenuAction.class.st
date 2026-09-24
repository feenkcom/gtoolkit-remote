Class {
	#name : #GtRemotePhlowContextMenuAction,
	#superclass : #GtRemotePhlowContextMenuSingleAction,
	#instVars : [
		'actionComputation',
		'enableCondition',
		'iconStencil',
		'label',
		'id',
		'tooltipText'
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
GtRemotePhlowContextMenuAction class >> label: aString action: aBlock enable: anEnablelock [
	^ self new 
		label: aString;
		action: aBlock;
		enableIf: anEnablelock
]

{ #category : #'instance creation' }
GtRemotePhlowContextMenuAction class >> label: aString action: aBlock show: aShowBlock [
	^ self new 
		label: aString;
		action: aBlock;
		showIf: aShowBlock
]

{ #category : #'instance creation' }
GtRemotePhlowContextMenuAction class >> label: aString action: aBlock show: aShowBlock enable: anEnablelock [
	^ self new 
		label: aString;
		action: aBlock;
		showIf: aShowBlock;
		enableIf: anEnablelock
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
GtRemotePhlowContextMenuAction >> enableIf: aBlock [ 
	enableCondition := aBlock
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
