Extension { #name : #GtPhlowViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowViewSpecification >> asJSONForExport [ 
	"Answer the receiver serialised in JSON format"

	^STONJSON toStringPretty: self asDictionaryForExport
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowViewSpecification class >> fromDictionary: viewDictionary [
	"Answer the view specified by viewDictionary"
	| viewName |

	viewName := viewDictionary at: 'viewName'.
	^(Smalltalk globals at: viewName asSymbol) fromJSONDictionary: viewDictionary.
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowViewSpecification class >> fromJSONString: aString [
	"Answer the view specified by aString"

	| viewDictionary |

	viewDictionary := STONJSON fromString: aString.
	^self fromDictionary: viewDictionary.
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowViewSpecification >> gtActionBuildViewFor: anAction [
	<gtAction>
	
	^ anAction button
		  icon: BrGlamorousIcons go;
		  tooltip: 'Create view';
		  action: [ :aButton |
		  	aButton phlow spawnObject: (self viewFor: GtPhlowView empty)  ]
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowViewSpecification >> gtViewJSONFor: aView [
	<gtView>
	
	^ aView explicit
		title: 'JSON';
		priority: 10;
		stencil: [ | editorElement textEditor text |
			textEditor := BrTextEditorModel new.
			textEditor styler: JSONParser gtStyler.
			editorElement := BrEditorElement new.
			editorElement editor: textEditor.
			text := (NeoJSONWriter toStringPretty:  self asDictionaryForExport ) asRopedText.
			text glamorousCodeFontDo: #beNotOverwritableByStyler; glamorousCodeSizeDo: #beNotOverwritableByStyler.
			textEditor text: text.
			editorElement
				padding: (BlInsets all: 10);
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical matchParent ].
			editorElement ]
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowViewSpecification >> viewFor: aView [
	"Specifications should implement this method to create a local phlow view from the remote data."
]
