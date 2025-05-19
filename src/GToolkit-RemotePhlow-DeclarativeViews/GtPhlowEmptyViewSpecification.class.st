Class {
	#name : #GtPhlowEmptyViewSpecification,
	#superclass : #GtPhlowViewSpecification,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'as yet unclassified' }
GtPhlowEmptyViewSpecification class >> fromJSONDictionary: aDictionary [
	"Answer an instance of the receiver from the supplied dictionary.
	Subclasses will override this to add their specific attributes"

	^ self new
]

{ #category : #'as yet unclassified' }
GtPhlowEmptyViewSpecification >> viewFor: aView [
	"Answer the GtPhlowView for the receiver. We use a forwarder view as
	a way to delegate the creation of the remote view back to this specification."

	^ aView empty
]
