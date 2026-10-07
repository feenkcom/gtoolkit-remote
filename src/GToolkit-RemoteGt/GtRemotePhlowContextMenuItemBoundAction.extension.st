Extension { #name : #GtRemotePhlowContextMenuItemBoundAction }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowContextMenuItemBoundAction >> phlowActionFor: anAction [
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
		
	localAction action: [ :anElement | 
		self targetAction cull: anElement ].
	
	^ localAction
]

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowContextMenuItemBoundAction >> toMenuItemOn: anObject index: anObjectIndex  element: aTargetElement [
	^ (self phlowActionFor: GtPhlowAction noAction)
		toMenuItemOn: anObject index: anObjectIndex  element: aTargetElement
]
