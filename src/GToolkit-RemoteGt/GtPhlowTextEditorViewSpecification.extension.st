Extension { #name : #GtPhlowTextEditorViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextEditorViewSpecification >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"

	^aView textEditor 
		title: title;
		priority: priority;
		text: [ self string ]
]
