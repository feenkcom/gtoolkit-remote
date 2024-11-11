Extension { #name : #GtPhlowProtoView }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowProtoView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	Supported views should overwrite this message to answer the appropriate declaration.
	nil = not supported"

	^nil
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowProtoView >> canBeGtDeclarativeView [
	"Answer a boolean indicating whether the receiver can be represented as a GtDeclarativeView.
	Supported views should overwrite this message if they support conversion."

	^false
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowProtoView >> remoteForward [
	<return: #GtPhlowRemoteForwarderView>
	^ GtPhlowRemoteForwarderView new
		originalView: self;
		definingMethod: (GtPhlowDefiningMethodsCollector forContext: thisContext) collect
]
