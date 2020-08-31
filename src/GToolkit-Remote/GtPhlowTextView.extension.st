Extension { #name : #GtPhlowTextView }

{ #category : #'*GToolkit-Remote' }
GtPhlowTextView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^ nil
]

{ #category : #'*GToolkit-Remote' }
GtPhlowTextView >> canBeGtDeclarativeView [
	"Answer a boolean indicating whether the receiver can be represented as a GtDeclarativeView"

	^ false
]
