Extension { #name : 'GtPhlowTextView' }

{ #category : '*GToolkit-RemoteGt' }
GtPhlowTextView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^ nil
]

{ #category : '*GToolkit-RemoteGt' }
GtPhlowTextView >> canBeGtDeclarativeView [
	"Answer a boolean indicating whether the receiver can be represented as a GtDeclarativeView"

	^ false
]
