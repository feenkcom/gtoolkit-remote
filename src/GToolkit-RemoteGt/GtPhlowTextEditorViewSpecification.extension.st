Extension { #name : #GtPhlowTextEditorViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextEditorViewSpecification >> configureForLazyDataView: aTextView [
	aTextView text: [ 
		| stylableText |
		stylableText := self retrieveStyledText.
		(GtRemotePhlowStylableText 
			fromJSONDictionary: stylableText) createStyledText ]
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextEditorViewSpecification >> configureForLocalDataView: aTextView [
	aTextView text: [ self string ].
	textStylerSpecification
		ifNotNil: [ :aTextStyler | 
			aTextView styler: [ aTextStyler createBlStyler ] ]
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextEditorViewSpecification >> viewFor: aView [
	| currentView |
	"Answer the GtPhlowView for the receiver"

	currentView := aView textEditor 
		title: title;
		priority: priority.
	
	self dataTransport = self class dataIncluded 
		ifTrue: [ self configureForLocalDataView: currentView ] 
		ifFalse: [ self configureForLazyDataView: currentView ].
		
	^ currentView
]
