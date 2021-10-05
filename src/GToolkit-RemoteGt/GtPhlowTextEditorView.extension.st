Extension { #name : #GtPhlowTextEditorView }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextEditorView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^GtPhlowDeclarativeTextEditorView new 
		title: self title;
		priority: self priority;
		string: self textBuilder value asString;
		dataTransport: GtPhlowDeclarativeView dataIncluded.

]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextEditorView >> canBeGtDeclarativeView [
	"Answer a boolean indicating whether the receiver can be represented as a GtDeclarativeView"

	^true
]
