Extension { #name : #LanguageLinkCommandFactory }

{ #category : #'*Gt4PharoLink' }
LanguageLinkCommandFactory >> evaluateSourceSequence: aString [

	"self addPlaygroundBindings."
	self << aString.
	^ self sendAndWait.

]

{ #category : #'*Gt4PharoLink' }
LanguageLinkCommandFactory >> gtPlaygroundFor: aView [
	<gtView>

	^ aView textEditor
		title: 'Playground' translated;
		priority: 10;
		text: [ '' asRopedText attributesBuilder attribute: (BlFontGenericFamilyAttribute monospace beNotOverwritableByStyler) ];
		styler: application settings parserClass gtStyler;
		actionButtonIcon: BrGlamorousIcons playinspect  
			action: [ :aButton |
				| statements result |
				statements := aButton phlow textViewContent asString.
				result := [ self evaluateSourceSequence: statements ]
					on: PharoLinkRemoteError, PharoLinkParserError
					do: [ :ex | ex ].
				aButton phlow spawnObject: result ].

]
