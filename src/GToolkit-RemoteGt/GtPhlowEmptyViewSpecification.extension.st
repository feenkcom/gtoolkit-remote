Extension { #name : #GtPhlowEmptyViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowEmptyViewSpecification >> viewFor: aView [
	"Answer the GtPhlowView for the receiver. We use a forwarder view as
	a way to delegate the creation of the remote view back to this specification."

	^ aView empty
]
