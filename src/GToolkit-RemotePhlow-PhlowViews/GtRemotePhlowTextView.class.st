Class {
	#name : #GtRemotePhlowTextView,
	#superclass : #GtRemotePhlowTextualView,
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #converting }
GtRemotePhlowTextView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"
	| viewSpecification |

	viewSpecification := GtPhlowTextViewSpecification new
		phlowDataSource: (GtRemotePhlowDeclarativeTextualViewDataSource
			forPhlowView: self);
		dataTransport: GtPhlowViewSpecification dataLazy.
	self configureGenericViewSpecificationOn: viewSpecification.
	^ viewSpecification
]

{ #category : #accessing }
GtRemotePhlowTextView >> stylerSpecification [
	"Should be extended to support a styler that could be applied on the text"
	^ nil
]
