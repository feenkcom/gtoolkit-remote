Extension { #name : #GtPhlowTextEditorView }

{ #category : #'*GToolkit-Remote' }
GtPhlowTextEditorView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^GtDeclarativeTextEditor new 
		title: self title;
		priority: self priority;
		string: self textBuilder value asString;
		dataTransport: GtDeclarativeView dataLazy.

]
