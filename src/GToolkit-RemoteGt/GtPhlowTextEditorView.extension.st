Extension { #name : #GtPhlowTextEditorView }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextEditorView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"
	| viewSpecification |

	viewSpecification := GtPhlowTextEditorViewSpecification new
		phlowDataSource: (GtRemotePhlowDeclarativeTextualViewDataSource
			forPhlowView: self);
		dataTransport: GtPhlowViewSpecification dataLazy.
	self configureGenericViewSpecificationOn: viewSpecification.
	^ viewSpecification
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextEditorView >> canBeGtDeclarativeView [
	"Answer a boolean indicating whether the receiver can be represented as a GtDeclarativeView"

	^true
]
