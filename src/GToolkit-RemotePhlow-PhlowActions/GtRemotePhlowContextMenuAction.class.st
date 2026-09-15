Class {
	#name : #GtRemotePhlowContextMenuAction,
	#superclass : #GtRemotePhlowContextMenuSingleAction,
	#instVars : [
		'actionComputation',
		'showCondition',
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
GtRemotePhlowContextMenuAction >> asGtDeclarativeAction [
	^ GtPhlowContextMenuActionSpecification new
		tooltipText: self tooltipText;
		label: self label;
		iconStencil: self iconStencil;
		phlowDataSource: (GtRemotePhlowDeclarativeBlockActionDataSource new
			phlowAction: self;
			targetBlock: self actionBlock)
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
GtRemotePhlowContextMenuAction >> showIf: aBlock [ 
	showCondition := aBlock
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
