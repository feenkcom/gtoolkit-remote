Extension { #name : #CDTCallFrame }

{ #category : #'*Gt4ChromeDevTools' }
CDTCallFrame >> gtLocalScopeFor: aView [
	<gtView>
	| localScope |

	localScope := self localScope.
	localScope ifNil: [ ^ aView empty ].
	^ aView columnedList 
		title: 'Local Scope';
		priority: 15;
		items: [ localScope properties ];
		column: 'Name' text: [ :item | item name ];
		column: 'Value' text: [ :item | item value ].
]

{ #category : #'*Gt4ChromeDevTools' }
CDTCallFrame >> gtScopeFor: aView [
	<gtView>

	^ aView list
		title: 'Scope Chain';
		priority: 15;
		items: [ self scopeChain ];
		itemText: [ :scope | 
			scope nameOrNil
				ifNil: [ scope type ]
				ifNotNil: [ scope type, ': ', scope name ] ]
]

{ #category : #'*Gt4ChromeDevTools' }
CDTCallFrame >> gtSourceCodeFor: aView [
	<gtView>

	self hasSourceCode ifFalse: [ ^ aView empty ].
	^ aView explicit 
		title: 'Source';
		priority: 10;
		stencil: [ | editor |
			editor := BrEditor new
				text: self sourceText;
				look: BrGlamorousCodeEditorLook new;
				styler: JSParser gtStyler.
			self lineNumber > 5 ifTrue:
				[ editor 	scrollToPosition: self lineNumber - 5 ].
			editor ]

]
