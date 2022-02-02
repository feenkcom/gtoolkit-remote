Extension { #name : #GtPhlowForwarderView }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowForwarderView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^ self phlowView wait asGtDeclarativeView
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowForwarderView >> canBeGtDeclarativeView [
	"Answer a boolean indicating whether the receiver can be represented as a GtDeclarativeView"

	^ self phlowView wait canBeGtDeclarativeView
]
