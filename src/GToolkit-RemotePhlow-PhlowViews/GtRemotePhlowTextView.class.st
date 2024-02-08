Class {
	#name : #GtRemotePhlowTextView,
	#superclass : #GtRemotePhlowTextualView,
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #accessing }
GtRemotePhlowTextView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^ GtPhlowTextViewSpecification new 
		title: self title;
		priority: self priority;
		phlowDataSource: (GtRemotePhlowDeclarativeTextualViewDataSource 
			forPhlowView: self);
		dataTransport: GtPhlowViewSpecification dataLazy.
]

{ #category : #accessing }
GtRemotePhlowTextView >> stylerSpecification [
	"Should be extended to support a styler that could be applied on the text"
	^ nil
]
