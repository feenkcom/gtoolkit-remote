Class {
	#name : #GtRemoteDeclarativeStExamples,
	#superclass : #GtRemoteDeclarativeExamples,
	#category : #'GToolkit-RemoteExamples'
}

{ #category : #private }
GtRemoteDeclarativeStExamples >> declarativeViewNames [
	"Answer the expected array of declarative views from the remote"

	^ #(gtStringFor: gtListFor: gtColumnedListFor: gtPrintFor:)
]
