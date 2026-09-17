Extension { #name : #GtPhlowContextMenuItemBoundAction }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowContextMenuItemBoundAction >> asMenuItem [
	"Return a menu item which will be displayed in a context menu.
	Context menu action can return also collection of menu items."

	<return: #BrMenuItem>
	^ BrMenuActionItem new
		label: self label;
		action: [ :anElement | self executeActionFrom: anElement ]
]
