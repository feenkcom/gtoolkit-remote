Extension { #name : 'PharoLinkParserError' }

{ #category : '*Gt4PharoLink' }
PharoLinkParserError >> gtSourceFor: aView [
	<gtView>

	^ aView textEditor 
		title: 'Source';
		priority: 10;
		text: [ self highlightedSourceText ]
]

{ #category : '*Gt4PharoLink' }
PharoLinkParserError >> highlightedSourceText [
	"Answer the source as text, highlighting the start of the error"
	| text |

	source ifNil: [ ^'' asRopedText ].
	text := source asRopedText.
	position ifNil: [ ^text ].
	(text from: position to: text size) foreground: Color red.
	^ text
]
