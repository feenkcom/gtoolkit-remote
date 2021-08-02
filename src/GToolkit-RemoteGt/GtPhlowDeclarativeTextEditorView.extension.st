Extension { #name : 'GtPhlowDeclarativeTextEditorView' }

{ #category : '*GToolkit-RemoteGt' }
GtPhlowDeclarativeTextEditorView >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"

	^aView textEditor 
		title: title;
		priority: priority;
		text: [ self string ]
]
