Extension { #name : #GtRemotePhlowViewedObject }

{ #category : #'*GToolkit-RemotePhlow-GemStone' }
GtRemotePhlowViewedObject >> addRawSelfNodeTo: variableNodes [

	^ self "TBS"
]

{ #category : #'*GToolkit-RemotePhlow-Gemstone' }
GtRemotePhlowViewedObject class >> new [

	^ super new initialize
]

{ #category : #'*GToolkit-RemotePhlow-GemStone' }
GtRemotePhlowViewedObject >> rawViewData [
	"Answer the data for the raw view"
	| variableBindings |

	variableBindings := object gtRemoteVariableValuePairsWithSelfIf: true.

	^ Array streamContents: [ :stream |
		variableBindings do: [ :binding |
			| icon name value |
			name := binding key.
			value := binding value.

			icon := ([ value class gtGsInspectorIconName ]
					on: Error 
					do: [ :error | #smallWarningIcon ]).
			
			stream nextPut: { icon. name. value } ] ].
]
