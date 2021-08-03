Extension { #name : 'GtRemotePhlowViewedObject' }

{ #category : '*GToolkit-RemotePhlow-Gemstone' }
GtRemotePhlowViewedObject class >> new [

	^ super new initialize
]

{ #category : '*GToolkit-RemotePhlow-GemStone' }
GtRemotePhlowViewedObject >> addRawSelfNodeTo: variableNodes [

	^ self "TBS"
]

{ #category : '*GToolkit-RemotePhlow-GemStone' }
GtRemotePhlowViewedObject >> rawViewData [
	"Answer the data for the raw view"
	| variableBindings |

	variableBindings := object gtGsVariableValuePairsWithSelfIf: true.

	^ Array streamContents: [ :stream |
		variableBindings do: [ :binding |
			| icon name value |
			icon :=  #classicon.
			"icon := ([ node rawValue class systemIconName ]
					on: Error 
					do: [ :error | #smallWarningIcon ])."
			name := binding key.
			value := binding value.
			stream nextPut: { icon. name. value } ] ].
]
