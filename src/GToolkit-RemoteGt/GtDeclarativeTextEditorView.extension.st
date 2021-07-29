Extension { #name : 'GtDeclarativeTextEditorView' }

{ #category : '*GToolkit-RemoteGt' }
GtDeclarativeTextEditorView >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"

	^aView textEditor 
		title: title;
		priority: priority;
		text: [ self string ]
]
