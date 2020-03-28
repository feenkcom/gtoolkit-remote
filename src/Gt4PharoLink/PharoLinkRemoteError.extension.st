Extension { #name : #PharoLinkRemoteError }

{ #category : #'*Gt4PharoLink' }
PharoLinkRemoteError >> formattedText: aString [
	| fullText regex |

	fullText := aString asRopedText.
	"The regex also groups the line and column numbers.
	ToDo: open the file with the error line number highlighted"
	regex := '\s*at\s[^(]*\(([^:(]+)\:(\d+)\:(\d+)\)' asRegex.
	regex matchesIn: aString do: [ :match | | filename filenameStart filenameEnd |
		filenameStart := (regex subBeginning: 2) first asNumber + 1.
		filenameEnd := (regex subBeginning: 3) first asNumber - 1.
		filename := fullText from: filenameStart to: filenameEnd.
		filename foreground: GtDocumentConstants linkColor.
		filename attribute: (BrTextClickAttribute new 
			action: [ :text :textElement :textEditor :clickEvent |
				textElement phlow spawnObject: filename asString asFileReference ])
		 ].
	^ fullText
]

{ #category : #'*Gt4PharoLink' }
PharoLinkRemoteError >> gtMessageTextFor: aView [
	"<gtView>"

	^ aView textEditor
		title: 'Message';
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
