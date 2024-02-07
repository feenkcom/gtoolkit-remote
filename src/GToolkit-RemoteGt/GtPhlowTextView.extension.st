Extension { #name : #GtPhlowTextView }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^ GtPhlowTextViewSpecification new 
		title: self title;
		priority: self priority;
		phlowDataSource: (GtRemotePhlowDeclarativeTextualViewDataSource 
			forPhlowView: self);
		dataTransport: GtPhlowViewSpecification dataLazy.
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextView >> canBeGtDeclarativeView [
	^ true
]
