Extension { #name : #GtPhlowTextEditorView }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextEditorView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	| computedText viewSpecification |
	computedText := self textBuilder value asRopedText.

	viewSpecification := GtPhlowTextEditorViewSpecification new
		title: self title;
		priority: self priority;
		string: computedText asString;
		dataTransport: GtPhlowViewSpecification dataIncluded.

	(self createRemotePhlowStylerSpecificationForText: computedText) ifNotNil: [ :aStyler |
		viewSpecification textStyler: aStyler ].
			
	^ viewSpecification
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextEditorView >> canBeGtDeclarativeView [
	"Answer a boolean indicating whether the receiver can be represented as a GtDeclarativeView"

	^true
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextEditorView >> createRemotePhlowStylerSpecificationForText: aText [
	| computedStyler styledText |
	computedStyler := styler value.
	computedStyler affectsText ifFalse: [ ^ nil ].
	
	styledText := computedStyler style: aText.
	^ GtRemotePhlowTextAttributeRunsStylerSpecification new
		attributedRuns: (self extractRemotePhlowRunsFrom: styledText)
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextEditorView >> extractRemotePhlowRunsFrom: aStyledText [ 
	| runsGroup |
	runsGroup := GtPhlowRunsGroup new.
	
	aStyledText attributeRunsDo: [ :aStartIndex :anEndIndex :localAttributes | 
		 runsGroup addRun: (GtPhlowRun  
		 	from: aStartIndex
		 	to: anEndIndex
		 	attributes: (localAttributes 
		 		collect: [ :anAttribute |
		 			anAttribute asGtRemotePhlowTextAttribute ]
		 		as: Array ) ) ].
				
	^ runsGroup reject: [ :aRunWithAttributes |
		aRunWithAttributes attributes isEmpty ] 
]
