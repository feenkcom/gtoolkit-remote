Extension { #name : #GtGemStoneSourceHighlightStencil }

{ #category : #'*GToolkit-RemoteGt' }
GtGemStoneSourceHighlightStencil >> create [
	| text editor hs he attr |

	text := sourceString asRopedText.
	hs := highlightStart min: text size.
	he := (highlightEnd - 1) min: text size.
	hs > 0 ifTrue: [
		attr := BlTextHighlightAttribute paint: BrGlamorousColors debuggerTextHighlightColor.
		attr beNotOverwritableByStyler.
		(text from: hs to: he) attribute: attr ].
	editor := BrEditor new
		aptitude: BrGlamorousCodeEditorAptitude new;
		styler: BrRBTextStyler new;
		text: text;
		beReadOnlyWithSelection;
		matchParent.
	^ editor
]
