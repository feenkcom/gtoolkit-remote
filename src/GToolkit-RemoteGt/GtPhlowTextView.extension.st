Extension { #name : #GtPhlowTextView }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextView >> asGtDeclarativeView [
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

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextView >> canBeGtDeclarativeView [
	^ true
]
