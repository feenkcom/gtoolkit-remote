Extension { #name : #LanguageLinkApplication }

{ #category : #'*Gt4PharoLink' }
LanguageLinkApplication >> evaluateSourceSequence: aString [
	| cf |

	cf := self newCommandFactory.
	^ cf 
		<< aString;
		sendAndWait.

]

{ #category : #'*Gt4PharoLink' }
LanguageLinkApplication >> gtPlaygroundFor: aView [
	<gtView>

	^ aView textEditor
		title: 'Playground' translated;
		priority: 10;
		text: [ '' asRopedText attributesBuilder attribute: (BlFontGenericFamilyAttribute monospace beNotOverwritableByStyler) ];
		styler: self settings parserClass gtStyler;
		actionButtonIcon: BrGlamorousIcons playinspect  
			action: [ :aButton |
				| statements result |
				statements := aButton phlow textViewContent asString.
				result := [ self evaluateSourceSequence: statements ]
					on: PharoLinkRemoteError, PharoLinkParserError
					do: [ :ex | ex ].
				aButton phlow spawnObject: result ].

]
