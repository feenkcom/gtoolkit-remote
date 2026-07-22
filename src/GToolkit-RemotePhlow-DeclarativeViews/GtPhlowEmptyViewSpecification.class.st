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
