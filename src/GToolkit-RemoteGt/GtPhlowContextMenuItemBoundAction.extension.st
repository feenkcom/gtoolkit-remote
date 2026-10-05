Extension { #name : #GtPhlowContextMenuItemBoundAction }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowContextMenuItemBoundAction >> phlowActionFor: anAction [
	| localAction |
	localAction := anAction button.

	self targetAction tooltipText ifNotNil: [ :aText |
		localAction tooltip: aText ].
	self targetAction label ifNotNil: [ :aText |
		localAction label: aText ].
	self targetAction iconStencil ifNotNil: [ :anIconStencil |
		localAction icon: anIconStencil ].

	self targetAction id ifNotNil: [ :anId |
		localAction id: anId ].
	
	self shouldDisableContextAction ifTrue: [
		localAction menuDisable: [ true ]].
		
	localAction action: [ :anElement | 
		self executeActionFrom: anElement ].
	
	^ localAction
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowContextMenuItemBoundAction >> toMenuItemOn: anObject index: anObjectIndex  element: aTargetElement [
	^ (self phlowActionFor: GtPhlowAction noAction)
		toMenuItemOn: anObject index: anObjectIndex  element: aTargetElement
]
