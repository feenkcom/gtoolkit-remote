Extension { #name : #GtPhlowButtonAction }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowButtonAction >> asItemBoundActionToItem: anItem viewSelection: anIndex [
	"Normal phlow actions do no get the item or the selection as parameters.
	They are bound already to them when they are created."
	^ self
]
