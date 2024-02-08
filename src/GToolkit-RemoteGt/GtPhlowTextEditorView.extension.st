Extension { #name : #GtPhlowTextEditorView }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextEditorView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^ GtPhlowTextEditorViewSpecification new
		title: self title;
		priority: self priority;
		phlowDataSource: (GtRemotePhlowDeclarativeTextualViewDataSource 
			forPhlowView: self);
		dataTransport: GtPhlowViewSpecification dataLazy
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextEditorView >> canBeGtDeclarativeView [
	"Answer a boolean indicating whether the receiver can be represented as a GtDeclarativeView"

	^true
]
