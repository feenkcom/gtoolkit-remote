Extension { #name : #GtRemotePhlowContextMenuTargetedObjectActions }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowContextMenuTargetedObjectActions >> toMenuItemOn: anItem index: anItemIndex element: anElement [
	| actions menuItems |
	actions := OrderedCollection new.
	self collectInvidualActionsOn: actions forElement: anElement item: anItem index: anItemIndex.
	menuItems := actions collect: [ :anAction |
		anAction toMenuItemOn: anItem index: anItemIndex element: anElement ].
	^ BrMenuItems new addItems: menuItems
]
