Extension { #name : #GtPhlowTextEditorViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextEditorViewSpecification >> configureForLazyDataView: aTextView [ 
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextEditorViewSpecification >> configureForLocalDataView: aTextView [ 
	textStyler ifNotNil: [ :aTextStyler | 
		aTextView styler: [ aTextStyler createBlStyler ] ].
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextEditorViewSpecification >> viewFor: aView [
	| currentView |
	"Answer the GtPhlowView for the receiver"

	currentView := aView textEditor 
		title: title;
		priority: priority;
		text: [ self string ].
	
	self dataTransport = self class dataIncluded 
		ifTrue: [ self configureForLocalDataView: currentView ] 
		ifFalse: [ self configureForLazyDataView: currentView ].
		
	^ currentView
]
