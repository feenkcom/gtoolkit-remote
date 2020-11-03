Extension { #name : #PharoLinkRemoteError }

{ #category : #'*Gt4PharoLink' }
PharoLinkRemoteError >> formattedText: aString [
	| fullText regex |
	fullText := aString asRopedText.
	"The regex also groups the line and column numbers.
	ToDo: open the file with the error line number highlighted"
	regex := '\s*at\s[^(]*\(([^:(]+)\:(\d+)\:(\d+)(\))' asRegex.
	regex
		matchesIn: aString
		do: [ :match | 
			| filename filenameStart filenameEnd startLine startColumn |
			filenameStart := (regex subBeginning: 2) first asNumber + 1.
			filenameEnd := (regex subBeginning: 3) first asNumber.
			filename := fullText from: filenameStart to: filenameEnd - 1.
			startLine := (regex subexpression: 3) asNumber.
			startColumn := (regex subexpression: 4) asNumber.
			filename
				attributes:
					{(BlTextForegroundAttribute new paint: BrGlamorousColors linkColor).
					(BrTextHoverStylableAttribute new
						beNotOverwritableByStyler;
						attribute: (BlTextUnderlineAttribute new color: BrGlamorousColors linkColor)).
					(BrTextClickAttribute new
						action: [ :text :textElement :textEditor :clickEvent | 
							textElement phlow
								spawnObject:
									(filename asString asFileReference asGtFileReferenceWithRanges
										addStartLine: startLine
										startColumn: startColumn
										endLine: startLine
										endColumn: 0) ])} ].
	^ fullText
]

{ #category : #'*Gt4PharoLink' }
PharoLinkRemoteError >> gtMessageTextFor: aView [
	<gtView>

	^ aView textEditor
		title: 'Message';
		look: BrGlamorousCodeEditorLook;
		priority: 2;
		text: [ self formattedText: self messageText ]
]

{ #category : #'*Gt4PharoLink' }
PharoLinkRemoteError >> gtTraceTextFor: aView [
	<gtView>

	(messageText isNil or: [ messageText isEmpty ]) ifTrue: 
		[ ^ aView empty ].
	^ aView textEditor
		title: 'Trace';
		priority: 2;
		text: [ self formattedText: self trace asString ]
]
